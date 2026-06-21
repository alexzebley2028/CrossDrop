#include "fast_init_scanner.h"

namespace {

constexpr const char* kBluezName = "org.bluez";
constexpr const char* kAdapterInterface = "org.bluez.Adapter1";
constexpr const char* kDeviceInterface = "org.bluez.Device1";
constexpr const char* kObjectManagerInterface =
    "org.freedesktop.DBus.ObjectManager";
constexpr const char* kPropertiesInterface = "org.freedesktop.DBus.Properties";
constexpr const char* kQuickShareFastInitServiceUuid =
    "0000fe2c-0000-1000-8000-00805f9b34fb";

// Don't wake more than once per 30 seconds; a sender advertises continuously.
constexpr gint64 kAlertDebounceUs = 30LL * 1000 * 1000;

GQuark fast_init_scanner_error_quark() {
  return g_quark_from_static_string("crossdrop-fast-init-scanner-error");
}

}  // namespace

struct _FastInitScanner {
  GDBusConnection* bus = nullptr;
  gchar* adapter_path = nullptr;
  guint interfaces_added_sub = 0;
  guint properties_changed_sub = 0;
  gboolean scanning = FALSE;
  gint64 last_alert_us = 0;
  FastInitScannerCallback callback = nullptr;
  gpointer user_data = nullptr;
};

// Returns TRUE if a BlueZ ServiceData dict (a{sv}: uuid -> bytes) advertises the
// Quick Share service UUID.
static gboolean service_data_has_quickshare(GVariant* service_data) {
  if (service_data == nullptr) {
    return FALSE;
  }
  GVariantIter iter;
  g_variant_iter_init(&iter, service_data);
  const gchar* uuid = nullptr;
  GVariant* value = nullptr;
  gboolean found = FALSE;
  while (g_variant_iter_next(&iter, "{&sv}", &uuid, &value)) {
    if (uuid != nullptr &&
        g_ascii_strcasecmp(uuid, kQuickShareFastInitServiceUuid) == 0) {
      found = TRUE;
    }
    g_variant_unref(value);
    if (found) {
      break;
    }
  }
  return found;
}

// Returns TRUE if a Device1 properties dict (a{sv}) contains a ServiceData
// entry advertising the Quick Share service UUID.
static gboolean props_have_quickshare(GVariant* props) {
  if (props == nullptr) {
    return FALSE;
  }
  g_autoptr(GVariant) service_data =
      g_variant_lookup_value(props, "ServiceData", G_VARIANT_TYPE("a{sv}"));
  return service_data_has_quickshare(service_data);
}

static void maybe_alert(FastInitScanner* scanner) {
  const gint64 now = g_get_monotonic_time();
  if (scanner->last_alert_us != 0 &&
      (now - scanner->last_alert_us) <= kAlertDebounceUs) {
    return;
  }
  scanner->last_alert_us = now;
  if (scanner->callback != nullptr) {
    scanner->callback(scanner->user_data);
  }
}

static void on_interfaces_added(GDBusConnection* connection,
                                const gchar* sender_name,
                                const gchar* object_path,
                                const gchar* interface_name,
                                const gchar* signal_name, GVariant* parameters,
                                gpointer user_data) {
  auto* scanner = static_cast<FastInitScanner*>(user_data);
  // parameters: (o a{s a{sv}}) -> object path + interface->properties map.
  g_autoptr(GVariant) interfaces = g_variant_get_child_value(parameters, 1);
  g_autoptr(GVariant) device_props =
      g_variant_lookup_value(interfaces, kDeviceInterface,
                             G_VARIANT_TYPE("a{sv}"));
  if (device_props != nullptr && props_have_quickshare(device_props)) {
    maybe_alert(scanner);
  }
}

static void on_properties_changed(GDBusConnection* connection,
                                  const gchar* sender_name,
                                  const gchar* object_path,
                                  const gchar* interface_name,
                                  const gchar* signal_name,
                                  GVariant* parameters, gpointer user_data) {
  auto* scanner = static_cast<FastInitScanner*>(user_data);
  // parameters: (s a{sv} as) -> interface, changed props, invalidated.
  g_autoptr(GVariant) iface_variant = g_variant_get_child_value(parameters, 0);
  const gchar* iface = g_variant_get_string(iface_variant, nullptr);
  if (g_strcmp0(iface, kDeviceInterface) != 0) {
    return;
  }
  g_autoptr(GVariant) changed = g_variant_get_child_value(parameters, 1);
  if (props_have_quickshare(changed)) {
    maybe_alert(scanner);
  }
}

static gchar* find_adapter_path(GDBusConnection* bus, GError** error) {
  g_autoptr(GVariant) result = g_dbus_connection_call_sync(
      bus, kBluezName, "/", kObjectManagerInterface, "GetManagedObjects",
      nullptr, G_VARIANT_TYPE("(a{oa{sa{sv}}})"), G_DBUS_CALL_FLAGS_NONE, -1,
      nullptr, error);
  if (result == nullptr) {
    return nullptr;
  }

  GVariantIter* objects = nullptr;
  g_variant_get(result, "(a{oa{sa{sv}}})", &objects);

  const gchar* object_path = nullptr;
  GVariant* interfaces = nullptr;
  while (g_variant_iter_next(objects, "{&o@a{sa{sv}}}", &object_path,
                             &interfaces)) {
    g_autoptr(GVariant) adapter = g_variant_lookup_value(
        interfaces, kAdapterInterface, G_VARIANT_TYPE("a{sv}"));
    const gboolean usable = adapter != nullptr;
    g_variant_unref(interfaces);
    if (usable) {
      g_variant_iter_free(objects);
      return g_strdup(object_path);
    }
  }

  g_variant_iter_free(objects);
  g_set_error(error, fast_init_scanner_error_quark(), 1,
              "No BlueZ adapter found");
  return nullptr;
}

static gboolean set_discovery_filter(FastInitScanner* scanner, GError** error) {
  GVariantBuilder filter;
  g_variant_builder_init(&filter, G_VARIANT_TYPE("a{sv}"));

  GVariantBuilder uuids;
  g_variant_builder_init(&uuids, G_VARIANT_TYPE("as"));
  g_variant_builder_add(&uuids, "s", kQuickShareFastInitServiceUuid);
  g_variant_builder_add(&filter, "{sv}", "UUIDs",
                        g_variant_builder_end(&uuids));
  g_variant_builder_add(&filter, "{sv}", "Transport",
                        g_variant_new_string("le"));

  g_autoptr(GVariant) result = g_dbus_connection_call_sync(
      scanner->bus, kBluezName, scanner->adapter_path, kAdapterInterface,
      "SetDiscoveryFilter", g_variant_new("(a{sv})", &filter), nullptr,
      G_DBUS_CALL_FLAGS_NONE, -1, nullptr, error);
  return result != nullptr;
}

FastInitScanner* fast_init_scanner_new(FastInitScannerCallback callback,
                                       gpointer user_data) {
  FastInitScanner* scanner = g_new0(FastInitScanner, 1);
  scanner->callback = callback;
  scanner->user_data = user_data;
  return scanner;
}

void fast_init_scanner_free(FastInitScanner* scanner) {
  if (scanner == nullptr) {
    return;
  }
  fast_init_scanner_stop(scanner);
  g_clear_object(&scanner->bus);
  g_clear_pointer(&scanner->adapter_path, g_free);
  g_free(scanner);
}

gboolean fast_init_scanner_start(FastInitScanner* scanner, GError** error) {
  if (scanner == nullptr) {
    g_set_error(error, fast_init_scanner_error_quark(), 2,
                "FastInitScanner is null");
    return FALSE;
  }
  if (scanner->scanning) {
    return TRUE;
  }

  if (scanner->bus == nullptr) {
    scanner->bus = g_bus_get_sync(G_BUS_TYPE_SYSTEM, nullptr, error);
    if (scanner->bus == nullptr) {
      return FALSE;
    }
  }

  if (scanner->adapter_path == nullptr) {
    scanner->adapter_path = find_adapter_path(scanner->bus, error);
    if (scanner->adapter_path == nullptr) {
      return FALSE;
    }
  }

  // A discovery filter is best-effort; discovery can still proceed without it.
  g_autoptr(GError) filter_error = nullptr;
  if (!set_discovery_filter(scanner, &filter_error)) {
    g_warning("Failed to set Quick Share discovery filter: %s",
              filter_error->message);
  }

  g_autoptr(GVariant) result = g_dbus_connection_call_sync(
      scanner->bus, kBluezName, scanner->adapter_path, kAdapterInterface,
      "StartDiscovery", nullptr, nullptr, G_DBUS_CALL_FLAGS_NONE, -1, nullptr,
      error);
  if (result == nullptr) {
    return FALSE;
  }

  if (scanner->interfaces_added_sub == 0) {
    scanner->interfaces_added_sub = g_dbus_connection_signal_subscribe(
        scanner->bus, kBluezName, kObjectManagerInterface, "InterfacesAdded",
        nullptr, nullptr, G_DBUS_SIGNAL_FLAGS_NONE, on_interfaces_added,
        scanner, nullptr);
  }
  if (scanner->properties_changed_sub == 0) {
    scanner->properties_changed_sub = g_dbus_connection_signal_subscribe(
        scanner->bus, kBluezName, kPropertiesInterface, "PropertiesChanged",
        nullptr, kDeviceInterface, G_DBUS_SIGNAL_FLAGS_NONE,
        on_properties_changed, scanner, nullptr);
  }

  scanner->scanning = TRUE;
  return TRUE;
}

void fast_init_scanner_stop(FastInitScanner* scanner) {
  if (scanner == nullptr) {
    return;
  }

  if (scanner->interfaces_added_sub != 0 && scanner->bus != nullptr) {
    g_dbus_connection_signal_unsubscribe(scanner->bus,
                                         scanner->interfaces_added_sub);
    scanner->interfaces_added_sub = 0;
  }
  if (scanner->properties_changed_sub != 0 && scanner->bus != nullptr) {
    g_dbus_connection_signal_unsubscribe(scanner->bus,
                                         scanner->properties_changed_sub);
    scanner->properties_changed_sub = 0;
  }

  if (scanner->scanning && scanner->bus != nullptr &&
      scanner->adapter_path != nullptr) {
    g_autoptr(GError) error = nullptr;
    g_dbus_connection_call_sync(scanner->bus, kBluezName, scanner->adapter_path,
                                kAdapterInterface, "StopDiscovery", nullptr,
                                nullptr, G_DBUS_CALL_FLAGS_NONE, -1, nullptr,
                                &error);
    if (error != nullptr) {
      g_warning("Failed to stop Quick Share discovery: %s", error->message);
    }
  }

  scanner->scanning = FALSE;
}
