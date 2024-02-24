// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/service_manager/ServieViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'complaint_service_container.dart';

class OpenServicesScreen extends StatelessWidget {
  final UserModel userData;
  final List<ComplaintModel> complaints;
  const OpenServicesScreen({
    Key? key,
    required this.complaints, required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        
      ],
    );
  }
}

