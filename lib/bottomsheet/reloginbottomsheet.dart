// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print
import 'package:byon_care/constents.dart';
import 'package:byon_care/services/showmassege.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:flutter/material.dart';

void reloginbottomsheet(context, String changePassword,
    {AnimationController? contoler}) {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  showModalBottomSheet(
    transitionAnimationController: contoler,
    isDismissible: false,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    context: context,
    builder: (builder) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Text(
                      'Re-Login',
                      style: TextStyle(
                        color: kbyoncolor2,
                        fontSize: 34,
                        fontFamily: kfontPoppinsRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Login using your email',
                      style: TextStyle(
                        color: kbyoncolor7,
                        fontSize: 17,
                        fontFamily: kfontPoppinsRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0XFF8E8E93).withOpacity(.12),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22.0)),
                      ),
                      child: Center(
                        child: TextField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            hintText: 'Email',
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0XFF8E8E93).withOpacity(.12),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22.0)),
                      ),
                      child: Center(
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            hintText: 'Password',
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
                    MaterialButton(
                      onPressed: () async {
                        try {
                          setState(() {
                            isLoading = true;
                          });
                          await FirestoreServices().reauthentication(
                              emailcontroller.text, passwordController.text);
                          await FirestoreServices()
                              .changePassword(changePassword);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          showmassege('Password Changed');
                        } catch (e) {
                          print('$e');
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22.0)),
                      ),
                      minWidth: double.infinity,
                      color: kbyoncolor1,
                      height: 44,
                      child: isLoading
                          ? Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0XFFFFFFFF),
                                fontSize: 17,
                                fontFamily: kfontPoppinsRegular,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
