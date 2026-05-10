#include "my_application.h"

#include <flutter_linux/flutter_linux.h>
#ifdef GDK_WINDOWING_X11
#include <gdk/gdkx.h>
#endif

#include "fast_init_advertiser.h"
#include "flutter/generated_plugin_registrant.h"

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
  GtkWindow* window;
  FlView* view;
  FlMethodChannel* file_intent_channel;
  FlMethodChannel* fast_init_channel;
  FastInitAdvertiser* fast_init_advertiser;
  GPtrArray* pending_open_files;
  gboolean dart_file_intent_handler_ready;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

static void flush_pending_open_files(MyApplication* self);

static gboolean has_arguments(char** arguments) {
  return arguments != nullptr && arguments[0] != nullptr;
}

static void send_open_files_to_dart(MyApplication* self, char** filenames) {
  if (!has_arguments(filenames)) {
    return;
  }

  if (self->dart_file_intent_handler_ready &&
      self->file_intent_channel != nullptr) {
    g_autoptr(FlValue) args =
        fl_value_new_list_from_strv((const gchar* const*)filenames);
    fl_method_channel_invoke_method(self->file_intent_channel, "openFiles",
                                    args, nullptr, nullptr, nullptr);
    return;
  }

  for (int i = 0; filenames[i] != nullptr; i++) {
    g_ptr_array_add(self->pending_open_files, g_strdup(filenames[i]));
  }
}

static void file_intent_method_call_cb(FlMethodChannel* channel,
                                       FlMethodCall* method_call,
                                       gpointer user_data) {
  MyApplication* self = MY_APPLICATION(user_data);
  const gchar* method = fl_method_call_get_name(method_call);

  g_autoptr(FlMethodResponse) response = nullptr;
  if (strcmp(method, "ready") == 0) {
    self->dart_file_intent_handler_ready = TRUE;
    flush_pending_open_files(self);
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  }

  g_autoptr(GError) error = nullptr;
  if (!fl_method_call_respond(method_call, response, &error)) {
    g_warning("Failed to respond to file intent method call: %s",
              error->message);
  }
}

static void create_file_intent_channel(MyApplication* self) {
  FlEngine* engine = fl_view_get_engine(self->view);
  FlBinaryMessenger* messenger = fl_engine_get_binary_messenger(engine);
  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();

  self->file_intent_channel = fl_method_channel_new(
      messenger, "crossdrop/file_intents", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(
      self->file_intent_channel, file_intent_method_call_cb, self, nullptr);
}

static void fast_init_method_call_cb(FlMethodChannel* channel,
                                     FlMethodCall* method_call,
                                     gpointer user_data) {
  MyApplication* self = MY_APPLICATION(user_data);
  const gchar* method = fl_method_call_get_name(method_call);

  g_autoptr(FlMethodResponse) response = nullptr;
  if (strcmp(method, "start") == 0) {
    g_autoptr(GError) error = nullptr;
    const gboolean started =
        fast_init_advertiser_start(self->fast_init_advertiser, &error);
    if (error != nullptr) {
      g_warning("Failed to start Quick Share Fast Init advertisement: %s",
                error->message);
    }
    response = FL_METHOD_RESPONSE(
        fl_method_success_response_new(fl_value_new_bool(started)));
  } else if (strcmp(method, "stop") == 0) {
    fast_init_advertiser_stop(self->fast_init_advertiser);
    response = FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
  } else {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  }

  g_autoptr(GError) error = nullptr;
  if (!fl_method_call_respond(method_call, response, &error)) {
    g_warning("Failed to respond to Fast Init method call: %s",
              error->message);
  }
}

static void create_fast_init_channel(MyApplication* self) {
  FlEngine* engine = fl_view_get_engine(self->view);
  FlBinaryMessenger* messenger = fl_engine_get_binary_messenger(engine);
  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();

  self->fast_init_channel = fl_method_channel_new(
      messenger, "crossdrop/fast_init", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(
      self->fast_init_channel, fast_init_method_call_cb, self, nullptr);
}

static void flush_pending_open_files(MyApplication* self) {
  if (self->pending_open_files == nullptr ||
      self->pending_open_files->len == 0 ||
      !self->dart_file_intent_handler_ready ||
      self->file_intent_channel == nullptr) {
    return;
  }

  g_autoptr(FlValue) args = fl_value_new_list();
  for (guint i = 0; i < self->pending_open_files->len; i++) {
    const gchar* path = static_cast<const gchar*>(
        g_ptr_array_index(self->pending_open_files, i));
    fl_value_append_take(args, fl_value_new_string(path));
  }
  g_ptr_array_set_size(self->pending_open_files, 0);

  fl_method_channel_invoke_method(self->file_intent_channel, "openFiles", args,
                                  nullptr, nullptr, nullptr);
}

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);
  if (self->window != nullptr) {
    gtk_window_present(self->window);
    return;
  }

  GtkWindow* window =
      GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));
  self->window = window;

  // Use a header bar when running in GNOME as this is the common style used
  // by applications and is the setup most users will be using (e.g. Ubuntu
  // desktop).
  // If running on X and not using GNOME then just use a traditional title bar
  // in case the window manager does more exotic layout, e.g. tiling.
  // If running on Wayland assume the header bar will work (may need changing
  // if future cases occur).
  gboolean use_header_bar = TRUE;
#ifdef GDK_WINDOWING_X11
  GdkScreen* screen = gtk_window_get_screen(window);
  if (GDK_IS_X11_SCREEN(screen)) {
    const gchar* wm_name = gdk_x11_screen_get_window_manager_name(screen);
    if (g_strcmp0(wm_name, "GNOME Shell") != 0) {
      use_header_bar = FALSE;
    }
  }
#endif
  if (use_header_bar) {
    GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_header_bar_new());
    gtk_widget_show(GTK_WIDGET(header_bar));
    gtk_header_bar_set_title(header_bar, "CrossDrop");
    gtk_header_bar_set_show_close_button(header_bar, TRUE);
    gtk_window_set_titlebar(window, GTK_WIDGET(header_bar));
  } else {
    gtk_window_set_title(window, "CrossDrop");
  }

  gtk_window_set_default_size(window, 1280, 720);
  gtk_widget_realize(GTK_WIDGET(window));

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(
      project, self->dart_entrypoint_arguments);

  self->view = fl_view_new(project);
  gtk_widget_show(GTK_WIDGET(self->view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(self->view));

  create_file_intent_channel(self);
  create_fast_init_channel(self);

  fl_register_plugins(FL_PLUGIN_REGISTRY(self->view));

  gtk_widget_grab_focus(GTK_WIDGET(self->view));
}

// Implements GApplication::command_line.
static int my_application_command_line(GApplication* application,
                                       GApplicationCommandLine* command_line) {
  MyApplication* self = MY_APPLICATION(application);
  int argc = 0;
  gchar** arguments =
      g_application_command_line_get_arguments(command_line, &argc);
  char** dart_arguments = argc > 1 ? arguments + 1 : nullptr;

  if (self->view == nullptr) {
    g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
    self->dart_entrypoint_arguments =
        has_arguments(dart_arguments) ? g_strdupv(dart_arguments) : nullptr;
    g_application_activate(application);
  } else if (has_arguments(dart_arguments)) {
    send_open_files_to_dart(self, dart_arguments);
  } else {
    g_application_activate(application);
  }

  g_strfreev(arguments);
  return 0;
}

// Implements GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  g_clear_pointer(&self->fast_init_advertiser, fast_init_advertiser_free);
  g_clear_object(&self->fast_init_channel);
  g_clear_object(&self->file_intent_channel);
  g_clear_pointer(&self->pending_open_files, g_ptr_array_unref);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->command_line = my_application_command_line;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

static void my_application_init(MyApplication* self) {
  self->pending_open_files = g_ptr_array_new_with_free_func(g_free);
  self->fast_init_advertiser = fast_init_advertiser_new();
}

MyApplication* my_application_new() {
  return MY_APPLICATION(g_object_new(my_application_get_type(),
                                     "application-id", APPLICATION_ID,
                                     "flags", G_APPLICATION_HANDLES_COMMAND_LINE,
                                     nullptr));
}
