import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showmassege(String? message) {
  Fluttertoast.showToast(
      msg: message ?? "error",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: kbyoncolor3,
      textColor: Colors.white,
      fontSize: 16.0);
}
