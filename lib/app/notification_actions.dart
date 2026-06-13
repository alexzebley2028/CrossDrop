import 'dart:async';

import 'package:crossdrop/nearby_share/manager/nearby_manager.dart';
import 'package:crossdrop/notifications.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('notification_actions');

NotificationActionCallback? _activeNotificationActionHandler;

void registerNotificationActionHandler(NotificationActionCallback? handler) {
  _activeNotificationActionHandler = handler;
}

void handleNotificationResponse(String connectionId, bool accepted) {
  _log.info(
    'Handling notification response: $connectionId, Accepted: $accepted',
  );
  final activeHandler = _activeNotificationActionHandler;
  if (activeHandler != null) {
    activeHandler(connectionId, accepted);
    return;
  }

  // Fallback for action delivery before the widget tree has registered a handler.
  unawaited(
    NearbyConnectionManager().respondToTransfer(connectionId, accepted),
  );
}
