import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:byon_care/constants/string_constant.dart';
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/admin_screen/screen_admin.dart';
import 'package:byon_care/customerr_screen/customer_screen.dart';
import 'package:byon_care/screen/servicetechnician_dashboard.dart';
import 'package:byon_care/service_manager/servicemanagerscreen.dart';

import '../dealer/screen_dealer copy.dart';
import 'production/productiondashboardscreen.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kbyoncolor3,
              ),
            );
          }

          if(!snapshot.hasData && snapshot.data == null){
            return Center(child: Text("error ${snapshot.error}"),);
          }

          UserModel userData = UserModel.fromMap(snapshot.data!.data() ?? {},snapshot.data!.id);

          switch (userData.role) {
            case kproduction:
              return ProductionDashboard(userData: userData);
            case kdealer:
              return DealerScreen(userData: userData);
            case ktechnician:
              return ServiceTechnicianDashboard(userData: userData);
            case kserviceManager:
              return ServiceManagerDashboard(userdata: userData);
            case kadmin:
              return ScreenAdmin(userdata: userData);
            default:
              return NewCustomerScreen(userData: userData);
          }
        },
      ),
    );
  }
}
