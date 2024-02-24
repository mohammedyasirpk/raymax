import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';

Future numbernotfontpopup(context) {
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
                  height: 10.0,
                ),
                Image.asset(
                  'images/phone_verification_hart.png',
                  height: 90,
                  width: 90,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Sorry',
                  style: TextStyle(
                      color: kbyoncolor2,
                      fontSize: 24,
                      fontFamily: 'Avenir-Black'),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "We cannot find any registered number related to this Patient ID.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kbyoncolor2,
                      fontSize: 17,
                      fontFamily: 'Avenir-Book'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Please contact us if you feel you need to add a registered number at support@nixown.com ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                  minWidth: 153,
                  child: const Text(
                    'Okay',
                    style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontSize: 17,
                        fontFamily: 'Avenir-Heavy'),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
