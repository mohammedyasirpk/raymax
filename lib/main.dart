// ignore_for_file: prefer_const_constructors, unused_element
import 'package:byon_care/constents.dart';

import 'package:byon_care/screen/role_screen.dart';
import 'package:byon_care/servicess/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'servicess/firebaseMessage/send_notification.dart';
import 'servicess/localnotification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCduvMOST_5S1H_c0r-FZWU_h0Y_P6sEbk",
        authDomain: "nixownn.firebaseapp.com",
        projectId: "nixownn",
        storageBucket: "nixownn.appspot.com",
        messagingSenderId: "704116316629",
        appId:
            "1:704116316629:android:6b763901c808839090c55c", //its android appOd change the copying time
        measurementId: "G-9JVVWQ7KL8"),
  );

  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  FirebaseMessaging.onMessage.listen((event) {
    LocalNotif().showNotification(event);
  });

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    showSemanticsDebugger: false,
    title: "Nixown",
    theme: ThemeData(
        primaryColor: kbyoncolor3,
        useMaterial3: false,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: kbyoncolor11)),
    home: _getLandingPage(),
  ));
}

Widget _getLandingPage() {
  return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return RoleScreen();
      } else {
        return LoginScreen();
      }
    },
  );
}