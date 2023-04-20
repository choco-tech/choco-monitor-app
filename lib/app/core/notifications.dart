import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:choco_health_monitor/app/utils/utilities.dart';

Future<void> createSimpleNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title: '${Emojis.money_money_bag + Emojis.plant_cactus} Alert',
      body: 'Some incrireble description',
      //bigPicture: 'asset://assets/notification_map.png',
      //notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}
