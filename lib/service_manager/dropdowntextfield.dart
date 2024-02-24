import 'package:flutter/material.dart';

var textFieldStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 15,
  color: Colors.black.withOpacity(0.65),
);

InputDecoration textFieldDecoration(
    {required String label, required String hint, Widget? suffix,bool? isenable}) {
  return InputDecoration(
 enabled: isenable?? true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding:  EdgeInsets.symmetric(horizontal: 16, vertical: suffix !=null ? 0: 12),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: const Color(0xff0D5257).withOpacity(0.7),
      ),
    ),
    suffix: suffix,
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: const Color(0xff0D5257).withOpacity(0.4),
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: const Color(0xffD9D9D9).withOpacity(.44),
      ),
    ),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: const Color(0xff1C1B1F).withOpacity(.33),
    ),
    labelStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0xff1C1B1F),
    ),
    labelText: label,
    hintText: hint,
  );
}