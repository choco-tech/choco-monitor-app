import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload: ${message.data}');
}

class MessagingService {
  static MessagingService? _instance;

  MessagingService._();

  static MessagingService get instance => _instance ??= MessagingService._();

  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final localToken = localStorage.getItem('fcm_token');
    final fcmToken = await _firebaseMessaging.getToken();

    if (localToken == null || localToken != fcmToken) {
      localStorage.setItem('fcm_token', fcmToken!);
      FirebaseDatabase.instance.ref('tokens').push().set(fcmToken);
    }

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
