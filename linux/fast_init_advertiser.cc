#include "fast_init_advertiser.h"

#include <cstring>

namespace {

constexpr const char* kBluezName = "org.bluez";
constexpr const char* kAdvertisementPath =
    "/de/medformatik/crossdrop/FastInitAdvertisement";
constexpr const char* kLeAdvertisementInterface =
    "org.bluez.LEAdvertisement1";
constexpr const char* kLeAdvertisingManagerInterface =
    "org.bluez.LEAdvertisingManager1";
constexpr const char* kObjectManagerInterface =
    "org.freedesktop.DBus.ObjectManager";
constexpr const char* kQuickShareFastInitServiceUuid =
    "0000fe2c-0000-1000-8000-00805f9b34fb";

constexpr guint8 kServiceDataPrefix[] = {
    0xfc, 0x12, 0x8e, 0x01, 0x42, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};
constexpr gsize kPayloadSize = sizeof(kServiceDataPrefix) + 10;

const gchar kAdvertisementIntrospectionXml[] =
    "<node>"
    "  <interface name='org.bluez.LEAdvertisement1'>"
    "    <method name='Release'/>"
    "    <property name='Type' type='s' access='read'/>"
    "    <property name='ServiceData' type='a{sv}' access='read'/>"
    "    <property name='TxPower' type='n' access='readwrite'/>"
    "  </interface>"
    "</node>";

GDBusNodeInfo* advertisement_node_info = nullptr;

GQuark fast_init_error_quark() {
  return g_quark_from_static_string("crossdrop-fast-init-error");
}

void ensure_introspection_loaded(GError** error) {
  if (advertisement_node_info != nullptr) {
    return;
  }
  advertisement_node_info =
      g_dbus_node_info_new_for_xml(kAdvertisementIntrospectionXml, error);
}

}  // namespace

struct _FastInitAdvertiser {
  GDBusConnection* bus = nullptr;
  gchar* adapter_path = nullptr;
  guint registration_id = 0;
  gboolean advertising = FALSE;
  gint16 tx_power = 0;
  guint8 payload[kPayloadSize] = {0};
};

static void generate_payload(FastInitAdvertiser* advertiser) {
  std::memcpy(advertiser->payload, kServiceDataPrefix,
              sizeof(kServiceDataPrefix));
  for (gsize i = sizeof(kServiceDataPrefix);
       i < kPayloadSize; i++) {
    advertiser->payload[i] = static_cast<guint8>(g_random_int_range(0, 256));
  }
}

static GVariant* get_service_data(FastInitAdvertiser* advertiser) {
  GVariantBuilder builder;
  g_variant_builder_init(&builder, G_VARIANT_TYPE("a{sv}"));
  g_variant_builder_add(
      &builder, "{sv}", kQuickShareFastInitServiceUuid,
      g_variant_new_fixed_array(G_VARIANT_TYPE_BYTE, advertiser->payload,
                                kPayloadSize, sizeof(guint8)));
  return g_variant_builder_end(&builder);
}

static void advertisement_method_call(GDBusConnection* connection,
                                      const gchar* sender,
                                      const gchar* object_path,
                                      const gchar* interface_name,
                                      const gchar* method_name,
                                      GVariant* parameters,
                                      GDBusMethodInvocation* invocation,
                                      gpointer user_data) {
  if (g_strcmp0(method_name, "Release") == 0) {
    auto* advertiser = static_cast<FastInitAdvertiser*>(user_data);
    advertiser->advertising = FALSE;
    g_dbus_method_invocation_return_value(invocation, nullptr);
    return;
  }

  g_dbus_method_invocation_return_error(invocation, G_IO_ERROR,
                                        G_IO_ERROR_NOT_SUPPORTED,
                                        "Unsupported method %s", method_name);
}

static GVariant* advertisement_get_property(GDBusConnection* connection,
                                            const gchar* sender,
                                            const gchar* object_path,
                                            const gchar* interface_name,
                                            const gchar* property_name,
                                            GError** error,
                                            gpointer user_data) {
  auto* advertiser = static_cast<FastInitAdvertiser*>(user_data);
  if (g_strcmp0(property_name, "Type") == 0) {
    return g_variant_new_string("broadcast");
  }
  if (g_strcmp0(property_name, "ServiceData") == 0) {
    return get_service_data(advertiser);
  }
  if (g_strcmp0(property_name, "TxPower") == 0) {
    return g_variant_new_int16(advertiser->tx_power);
  }

  g_set_error(error, G_IO_ERROR, G_IO_ERROR_NOT_SUPPORTED,
              "Unsupported property %s", property_name);
  return nullptr;
}

static gboolean advertisement_set_property(GDBusConnection* connection,
                                           const gchar* sender,
                                           const gchar* object_path,
                                           const gchar* interface_name,
                                           const gchar* property_name,
                                           GVariant* value,
                                           GError** error,
                                           gpointer user_data) {
  auto* advertiser = static_cast<FastInitAdvertiser*>(user_data);
  if (g_strcmp0(property_name, "TxPower") == 0) {
    advertiser->tx_power = g_variant_get_int16(value);
    return TRUE;
  }

  g_set_error(error, G_IO_ERROR, G_IO_ERROR_NOT_SUPPORTED,
              "Unsupported property %s", property_name);
  return FALSE;
}

static const GDBusInterfaceVTable advertisement_vtable = {
    advertisement_method_call,
    advertisement_get_property,
    advertisement_set_property,
};

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
    g_autoptr(GVariant) adapter =
        g_variant_lookup_value(interfaces, "org.bluez.Adapter1",
                               G_VARIANT_TYPE("a{sv}"));
    g_autoptr(GVariant) manager =
        g_variant_lookup_value(interfaces, kLeAdvertisingManagerInterface,
                               G_VARIANT_TYPE("a{sv}"));
    const gboolean usable = adapter != nullptr && manager != nullptr;
    g_variant_unref(interfaces);
    if (usable) {
      g_variant_iter_free(objects);
      return g_strdup(object_path);
    }
  }

  g_variant_iter_free(objects);
  g_set_error(error, fast_init_error_quark(), 1,
              "No BlueZ adapter with LEAdvertisingManager1 found");
  return nullptr;
}

FastInitAdvertiser* fast_init_advertiser_new() {
  return g_new0(FastInitAdvertiser, 1);
}

void fast_init_advertiser_free(FastInitAdvertiser* advertiser) {
  if (advertiser == nullptr) {
    return;
  }
  fast_init_advertiser_stop(advertiser);
  g_clear_object(&advertiser->bus);
  g_clear_pointer(&advertiser->adapter_path, g_free);
  g_free(advertiser);
}

gboolean fast_init_advertiser_start(FastInitAdvertiser* advertiser,
                                    GError** error) {
  if (advertiser == nullptr) {
    g_set_error(error, fast_init_error_quark(), 2,
                "FastInitAdvertiser is null");
    return FALSE;
  }
  if (advertiser->advertising) {
    return TRUE;
  }

  if (advertiser->bus == nullptr) {
    advertiser->bus = g_bus_get_sync(G_BUS_TYPE_SYSTEM, nullptr, error);
    if (advertiser->bus == nullptr) {
      return FALSE;
    }
  }

  if (advertiser->adapter_path == nullptr) {
    advertiser->adapter_path = find_adapter_path(advertiser->bus, error);
    if (advertiser->adapter_path == nullptr) {
      return FALSE;
    }
  }

  ensure_introspection_loaded(error);
  if (advertisement_node_info == nullptr) {
    return FALSE;
  }

  generate_payload(advertiser);

  if (advertiser->registration_id == 0) {
    GDBusInterfaceInfo* interface_info = g_dbus_node_info_lookup_interface(
        advertisement_node_info, kLeAdvertisementInterface);
    advertiser->registration_id = g_dbus_connection_register_object(
        advertiser->bus, kAdvertisementPath, interface_info,
        &advertisement_vtable, advertiser, nullptr, error);
    if (advertiser->registration_id == 0) {
      return FALSE;
    }
  }

  GVariantBuilder options;
  g_variant_builder_init(&options, G_VARIANT_TYPE("a{sv}"));
  g_autoptr(GVariant) result = g_dbus_connection_call_sync(
      advertiser->bus, kBluezName, advertiser->adapter_path,
      kLeAdvertisingManagerInterface, "RegisterAdvertisement",
      g_variant_new("(oa{sv})", kAdvertisementPath, &options), nullptr,
      G_DBUS_CALL_FLAGS_NONE, -1, nullptr, error);
  if (result == nullptr) {
    g_dbus_connection_unregister_object(advertiser->bus,
                                        advertiser->registration_id);
    advertiser->registration_id = 0;
    return FALSE;
  }

  advertiser->advertising = TRUE;
  return TRUE;
}

void fast_init_advertiser_stop(FastInitAdvertiser* advertiser) {
  if (advertiser == nullptr) {
    return;
  }

  if (advertiser->advertising && advertiser->bus != nullptr &&
      advertiser->adapter_path != nullptr) {
    g_autoptr(GError) error = nullptr;
    g_dbus_connection_call_sync(
        advertiser->bus, kBluezName, advertiser->adapter_path,
        kLeAdvertisingManagerInterface, "UnregisterAdvertisement",
        g_variant_new("(o)", kAdvertisementPath), nullptr,
        G_DBUS_CALL_FLAGS_NONE, -1, nullptr, &error);
    if (error != nullptr) {
      g_warning("Failed to unregister Quick Share Fast Init advertisement: %s",
                error->message);
    }
  }

  if (advertiser->registration_id != 0 && advertiser->bus != nullptr) {
    g_dbus_connection_unregister_object(advertiser->bus,
                                        advertiser->registration_id);
    advertiser->registration_id = 0;
  }
  advertiser->advertising = FALSE;
}
