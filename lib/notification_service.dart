import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{

  var notificationManager = FlutterLocalNotificationsPlugin();

  /// to initialize notification manager before notifying
  initializeNotificationManager(){

    var initSettings = InitializationSettings(
      android: AndroidInitializationSettings('app_icon'),
      iOS: DarwinInitializationSettings(),
      macOS: DarwinInitializationSettings(),
    );

    notificationManager.initialize(initSettings);

    if(Platform.isAndroid){
      notificationManager.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
    }
  }

  sendNotification({required int id, required String title, String? subTitle}){

    var notiDetails = NotificationDetails(
      android: AndroidNotificationDetails("test", "Test Channel"),
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
    );

    notificationManager.show(id, title, subTitle, notiDetails);
  }

}