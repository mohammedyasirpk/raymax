import 'package:byon_care/constents.dart';
import 'package:byon_care/servicess/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future contactuspopup(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0))),
          // contentPadding: const EdgeInsets.all(40.0),
          content: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  onPressed: () {},
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.0))),
                  color: kbyoncolor5,
                  height: 44,
                  minWidth: double.infinity,
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontSize: 17,
                        fontFamily: kfontPoppinsRegular),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  onPressed: () {
                    FirebaseServices().signOut(context);
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.0))),
                  color: kbyoncolor5,
                  height: 44,
                  minWidth: double.infinity,
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontSize: 17,
                        fontFamily: kfontPoppinsRegular),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.0))),
                  color: kbyoncolor5,
                  height: 44,
                  minWidth: double.infinity,
                  child: const Text(
                    'Exit',
                    style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontSize: 17,
                        fontFamily: kfontPoppinsRegular),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
