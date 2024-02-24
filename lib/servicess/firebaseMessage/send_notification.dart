// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_declarations

import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

Future<void> sendFcmMessage({
  required String token,
  required String body,
  required String title,
  required bool isLegacy,
  String? datavalue,
}) async {
  // if (isLegacy) {
  //   ///////////////////--------------->isLegacy

  //   const postUrl = 'https://fcm.googleapis.com/fcm/send';

  //   final data = {
  //     'notification': {
  //       'title': title,
  //       'body': body,
  //     },
  //     'priority': 'high',
  //     'data': {
  //       'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //       'id': '1',
  //       'status': 'done',
  //     },
  //     'to': token,
  //   };

  //   final headers = {
  //     'content-type': 'application/json',
  //     'Authorization': 'key=${AppDetails().notificationKey}',
  //   };

  //   final response = await http.post(
  //     Uri.parse(postUrl),
  //     body: json.encode(data),
  //     headers: headers,
  //   );

  //   if (response.statusCode == 200) {
  //     log('FCM message sent successfully (isLegacy)');
  //   } else {
  //     log('Failed to send FCM message. Status code: ${response.statusCode}');
  //     log('Response body: ${response.body}');
  //   }
  // } else {
    ///////////////////--------------->V1
    ///
    final result = await obtainAuthenticatedClient();
    final url = 'https://fcm.googleapis.com/v1/projects/nixownn/messages:send';

    // Replace with your notification details
    final notification = <String, dynamic>{
      'title': title,
      'body': body,
      // You can add 'image' here if needed
    };

    // Replace with your custom data
    final data = <String, dynamic>{
      'key': datavalue,
    };

    // Construct the FCM message
    final message = <String, dynamic>{
      'message': {
        'token': token,
        'notification': notification,
        'data': data,
      },
    };

    // Convert the message to JSON
    final jsonMessage = jsonEncode(message);

    // Make the POST request to send the FCM message
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${result.credentials.accessToken.data}',
      },
      body: jsonMessage,
    );

    // Check the response
    if (response.statusCode == 200) {
      log('FCM message sent successfully (V1)');
    } else {
      log('Failed to send FCM message. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  // }
}

Future<AuthClient> obtainAuthenticatedClient() async {
  final accountCredentials = ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "project_id": "nixownn",
    "private_key_id": "2d8ad8e693f752aa8adff551188b3f9010805c36",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCqsfjej9HtbHeH\nzE0Y1RMbgSwu060pADfvyXOLPe/WYhb6edxXyabvXflF2FwRGC45V93CsAW25ZEI\nEPrzFBA1IcVf2Wy6Rm0jO5gJXDXK6SGGXl/LrY/jsx6UeFiiwXFmYucoi5zyzhMO\nozg0UjYk8oLO8oVNdBiZOs/CepJWIAKwHwFzBeoDllSWfVx62JpsxV7VGw3GJrHi\nhoEnmdoUvHrp6nPFqw/qkNeX/lVGQhz4hk4/nMRZL1uw3LxAG6mDOJwKXOoUVk3Q\n/LTvVyhJYJiGGqb7uZRJrqpQnM/2uGoONBQjqwN9/bfdjFv/JPvmWjeNohElkeJz\nqOIvx+VHAgMBAAECggEATrwP7O0O6oKFMhzhFQq3qRCwphrafRaONqtIAhq8JbmS\nGtAZ/F5WA4RnxjlR4kqyi53FexeBU0dZ2gwnDPecsD1XEuqx9cwlbEKBUxP29hUJ\n8zZV3pe8zs1g1iAa1lv/KDiHopKffvniHXbZJn0jX3CDONzx8vORoyBXE8BA/rs8\n7WtOwgftJrU021psIN1DyEZ76J35YqwfDenEIREVH5y3cKQjjNLtea6jPBESY35E\nGJN/9R62R152AphtJTGw0o8eaJCyGbN714mCqdaMbkqUkYhmGOEvRd+JHKqKQ9Ma\na8mljI2YanCjSTtXA3M4Tbv2YkocF4plvO/Y+KKfWQKBgQDfVh1k5vGL/8alWuA4\nDExkgI02dqEjqBfepDR+TJDvPIahkLCl5gWbabuPu3sBNaFBW/NT/DHaWt9wW92J\n/rMvsAC8oHaSulczIgCIbVHdzsNFaZuQL+lNNplD/odnVS3iBUSOIQzYIQkcbYtt\npaorWlJx2XWemZgV5J+cs4F8PwKBgQDDqO5h1grUgopCQCekL5j/NQRZi4i9GxgH\nT+COwegnuSuUmQtLFe4NrV0xcpghujOGHmRWNr42J5TliOnxRE9akdzbdRGjtpyw\n3EFDR/Z10XAxVWNwKZIb1Wm6yMPLLSreWxJPNnlKA8S9s85Wfkg2gSVhrfzGVmqh\ns2hswRb0+QKBgQDZbIKtSs/5FYcUT8ZdikuMxEG1tgPmLK0gSQf5tRyca3Y+MBhp\nSehHhsXchg6X/NgCQzw+lRULmNBSGH0y7M0RLe1ptWX6LoLZ+s4+Av9iSvp7xvZ1\nhs9AJllLgq3bgWdr1OkK3U4d0vuFu3ezxUZHcmU1BRmmz6zqE2r4KSF0DQKBgQC3\neeKQvDbLsN4V4jNKM5g1OXIqxj4jlxShRrY9KHibR3kmj52Xe6kQClIp3FvsxL8s\nNbPBZPRZtCRcWleGd5gyRjXlVZKFAulMsD5C6WikcxHSMVBeDZ2FnErZbQqtrF1W\nxfAVd++lCIOloMcNNL5i3hg/0PgIxWCY4bQ6x5bPgQKBgFhFugpZJ9LpTybN7DDs\nqndvTsxSxI+UGKC3m0bcehictxMDscEDKFs7KEqXMuN20wj+pHpvRNcwjTfb9D/0\nTeAjHiSpEUnkC4jJf61MKZJiTGTUWA9LA6L9VZ0sctLMyzxLMHqcLH2N8z+MGoSp\ng3eOMAV8gq4RydvFUdrLP5tU\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-9bl3h@nixownn.iam.gserviceaccount.com",
    "client_id": "113925174732786058146",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-9bl3h%40nixownn.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  });
  const messagingScope = 'https://www.googleapis.com/auth/firebase.messaging';
  final scopes = [messagingScope];

  final AuthClient client =
      await clientViaServiceAccount(accountCredentials, scopes);

  return client;
}

Future initNotification() async {
  final messaging = FirebaseMessaging.instance;

  // await messaging.requestPermission();
  final Fcmtoken = await messaging.getToken();
 
  return Fcmtoken;
}

Future<void> handleBackgroundMessage(RemoteMessage remoteMessage) async {
  print('Title: ${remoteMessage.notification?.title}');
  print('Body: ${remoteMessage.notification?.body}');
  print('Data: ${remoteMessage.data}');
  print('rdfcgvbhj00');
}