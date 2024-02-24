// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print
import 'package:byon_care/bottomsheet/privacypolicybottomsheet.dart';
import 'package:byon_care/bottomsheet/registerbottomsheet.dart';
import 'package:byon_care/constents.dart';
import 'package:byon_care/servicess/firebase_services.dart';
import 'package:flutter/material.dart';

void loginbottomsheet(context, {AnimationController? contoler}) {
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
                        'Welcome',
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

                            await FirebaseServices().signIn(
                                email: emailcontroller.text,
                                password: passwordController.text,
                                context: context);
                           
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
                      TextButton(
                          onPressed: () {
                            registerBottomSheet(context);
                          },
                          child: Text(
                            'Don`t have an Account ? Register here',
                            style: TextStyle(
                                fontFamily: kfontPoppinsLight,
                                color: kbyoncolor2),
                          )),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextButton(
                        onPressed: () {
                          privacypoliypolicybottomsheet(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Privacy Policy ',
                              style: TextStyle(
                                color: Color(0XFFFD8C25),
                                fontSize: 16,
                                fontFamily: kfontPoppinsRegular,
                              ),
                            ),
                            Text(
                              '&',
                              style: TextStyle(
                                color: Color(0XFFB8BBC6),
                                fontSize: 16,
                                fontFamily: kfontPoppinsRegular,
                              ),
                            ),
                            Text(
                              ' T&C',
                              style: TextStyle(
                                color: Color(0XFFFD8C25),
                                fontSize: 16,
                                fontFamily: kfontPoppinsRegular,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: kbyoncolor11,
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                        ),
                        height: 5,
                        width: 135,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
}
