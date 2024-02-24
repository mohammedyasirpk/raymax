// ignore_for_file: prefer_const_constructors, unused_element, unused_local_variable
import 'package:flutter/material.dart';
import 'package:byon_care/constents.dart';

Future servicePopup(context) async {
  bool? isWarrantyExpired;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(26.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
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
                  fontFamily: kfontPoppinsLightItalic,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Warranty expired'
                // isWarrantyExpired ? 'Warranty expired!' : 'Warranty is  valid.',
                ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kbyoncolor2,
                  fontSize: 17,
                  fontFamily: kfontPoppinsMedium,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                ),
                color: kbyoncolor3,
                height: 44,
                minWidth: double.infinity,
                child: const Text(
                  'Okay',
                  style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontFamily: 'Avenir-Heavy',
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
