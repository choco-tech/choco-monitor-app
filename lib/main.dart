import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'app/app.dart';

void main() {
  AwesomeNotifications().initialize(
    // 'resource://drawable/res_notification_app_icon',
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      )
    ],
    debug: false,
  );

  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
