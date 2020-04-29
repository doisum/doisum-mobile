import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  final initializationSettings = InitializationSettings(
      AndroidInitializationSettings('@mipmap/ic_launcher'), IOSInitializationSettings()
  );

  final platformChannelSpecifics = new NotificationDetails(
      AndroidNotificationDetails(
          'id', 'name', 'description',
          playSound: false, importance: Importance.Max, priority: Priority.High),
      IOSNotificationDetails(presentSound: false)
  );

  void initLocalNotification() async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }
 

  Future showNotificationWithoutSound() async {
    await flutterLocalNotificationsPlugin.show(
        0,
        'Não se esqueça de manter sua rotina.',
        'Que tal parar um tempinho para tomar água?',
        platformChannelSpecifics,
        payload: 'No_Sound',
    );
  }

  Future scheduleNotification(DateTime notificationTime) async {
    await flutterLocalNotificationsPlugin.schedule(
    0,
    'Não se esqueça de manter sua rotina.',
    'Que tal parar um tempinho para tomar água?',
    notificationTime,
    platformChannelSpecifics);
  }


  Future onSelectNotification(String payload) async {
    showDialog(
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }
}
