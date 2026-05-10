#ifndef FLUTTER_FAST_INIT_ADVERTISER_H_
#define FLUTTER_FAST_INIT_ADVERTISER_H_

#include <gio/gio.h>
#include <glib.h>

G_BEGIN_DECLS

typedef struct _FastInitAdvertiser FastInitAdvertiser;

FastInitAdvertiser* fast_init_advertiser_new();
void fast_init_advertiser_free(FastInitAdvertiser* advertiser);

gboolean fast_init_advertiser_start(FastInitAdvertiser* advertiser,
                                    GError** error);
void fast_init_advertiser_stop(FastInitAdvertiser* advertiser);

G_END_DECLS

#endif  // FLUTTER_FAST_INIT_ADVERTISER_H_
