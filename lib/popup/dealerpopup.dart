import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';

Future dealerPopUp(String message, context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(26.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0))),
          content: Container(
            padding: const EdgeInsets.all(00),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Image.asset(
                  'images/popup_hart.png',
                  height: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Sorry',
                  style: TextStyle(
                      color: kbyoncolor2,
                      fontSize: 24,
                      fontFamily: kfontPoppinsLightItalic),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: kbyoncolor2,
                      fontSize: 17,
                      fontFamily: 'Avenir-Book'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.0))),
                  color: kbyoncolor1,
                  height: 44,
                  minWidth: double.infinity,
                  child: const Text(
                    'Okay',
                    style: TextStyle(
                        color: Color(0XFFFFFFFF), fontFamily: 'Avenir-Heavy'),
                  ),
                )
              ],
            ),
          ),
        );
      });
}