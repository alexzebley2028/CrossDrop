#ifndef FLUTTER_FAST_INIT_SCANNER_H_
#define FLUTTER_FAST_INIT_SCANNER_H_

#include <gio/gio.h>
#include <glib.h>

G_BEGIN_DECLS

typedef struct _FastInitScanner FastInitScanner;

// Invoked on the GLib main loop when a nearby device is detected starting a
// Quick Share session. |user_data| is the value passed to
// fast_init_scanner_new().
typedef void (*FastInitScannerCallback)(gpointer user_data);

FastInitScanner* fast_init_scanner_new(FastInitScannerCallback callback,
                                       gpointer user_data);
void fast_init_scanner_free(FastInitScanner* scanner);

// Starts BlueZ LE discovery filtered to the Quick Share service UUID. Returns
// TRUE if discovery was started (or already running).
gboolean fast_init_scanner_start(FastInitScanner* scanner, GError** error);
void fast_init_scanner_stop(FastInitScanner* scanner);

G_END_DECLS

#endif  // FLUTTER_FAST_INIT_SCANNER_H_
