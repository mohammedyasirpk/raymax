import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotif {
  int id = 0;
  final selectNotificationStream = StreamController<String?>.broadcast();

  Future<void> showNotification(RemoteMessage remoteMessage) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // final DarwinInitializationSettings initializationSettingsDarwin =
    //     DarwinInitializationSettings(
    //         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsDarwin,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );

    const androidNotificationDetails = AndroidNotificationDetails(
      'raymax',
      'raymax',
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      id++,
      remoteMessage.notification?.title,
      remoteMessage.notification?.body,
      notificationDetails,
      // payload: firebaseNotif.isNavigation
      //     ? "${firebaseNotif.screen},${firebaseNotif.id}"
      //     : null,
    );
  }
}