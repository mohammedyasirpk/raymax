// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:byon_care/bottomsheet/reloginbottomsheet.dart';
import 'package:byon_care/constents.dart';
import 'package:byon_care/services/showmassege.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Change Password',
          style: TextStyle(
            fontFamily: kfontPoppinsMedium,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black, size: 23),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0XFF8E8E93).withOpacity(.12),
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              ),
              child: Center(
                child: TextField(
                  controller: newPasswordController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 20,
                    ),
                    hintText: 'New Password',
                    helperStyle: TextStyle(
                      color: const Color(0XFF919192).withOpacity(.40),
                      fontSize: 17,
                      fontFamily: kfontPoppinsRegular,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0XFF8E8E93).withOpacity(.12),
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              ),
              child: Center(
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 20,
                    ),
                    hintText: 'Confirm Password',
                    helperStyle: TextStyle(
                      color: const Color(0XFF919192).withOpacity(.40),
                      fontSize: 17,
                      fontFamily: kfontPoppinsRegular,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 230,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  backgroundColor: kbyoncolor3,
                ),
                onPressed: () {
                  if (newPasswordController.text ==
                      confirmPasswordController.text) {
                    reloginbottomsheet(
                      context,
                      confirmPasswordController.text,
                    );
                  } else {
                    showmassege(
                        'New Password and Confirm Password do not match');
                  }
                },
                child: Text(
                  'Save',
                  style:
                      TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
