// ignore_for_file: prefer_const_constructors
import 'package:byon_care/admin_screen/screen_admin.dart';
import 'package:byon_care/constants/string_constant.dart';
import 'package:byon_care/constents.dart';
import 'package:byon_care/customerr_screen/customer_screen.dart';
import 'package:byon_care/dealer/screen_dealer%20copy.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/screen/servicetechnician_dashboard.dart';
import 'package:byon_care/service_manager/servicemanagerscreen.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'production/productiondashboardscreen.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((event) {
      if (event.exists) {
        return UserModel(
          uid: event.id,
          role: event.data()?["role"],
          name: event.data()?["name"],
          phoneNo: event.data()?["phoneNo"],
          email: event.data()?["email"],
          image: event.data()?['image'],
        );
      } else {
        return null;
      }
    });
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: kbyoncolor3,
              ),
            );
          }

          UserModel userData = UserModel(
            uid: snapshot.data?.id,
            role: snapshot.data?.data()?["role"],
            name: snapshot.data?.data()?["name"],
            phoneNo: snapshot.data?.data()?["phoneNo"],
            email: snapshot.data?.data()?["email"],
            image: snapshot.data?.data()?["image"],
          );

          if (userData.role == kproduction) {
            return ProductionDashboard(
              userData: userData,
            );
          } else if (userData.role == kdealer) {
            return DealerScreen(
              userData: userData,
            );
          } else if (userData.role == ktechnician) {
            return ServiceTechnicianDashboard(
              userData: userData,
            );
          } else if (userData.role == kserviceManager) {
            return ServiceManagerDashboard(
              userdata: userData,
            );
          } else if (userData.role == kadmin) {
            return ScreenAdmin(
              userdata :userData,
             
            );
          } else {
            return NewCustomerScreen(
              userData: userData,
            );
          }
        },
      ),
    );
  }
}
