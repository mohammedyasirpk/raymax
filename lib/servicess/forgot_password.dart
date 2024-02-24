import 'package:byon_care/constents.dart';
import 'package:byon_care/service_manager/dropdowntextfield.dart';
import 'package:byon_care/servicess/firebase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isLoading = false;

  bool validateForm() {
    if (emailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter a valid email.",
        ),
      );
      return false;
    }

    return true;
  }

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 25),
      //     child: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back_ios,
      //         size: 16,
      //       ),
      //       color: const Color(0xff000000),
      //     ),
      //   ),
      //   elevation: 0,
      //   title: Text(
      //     'Forgot Password',
      //     style: GoogleFonts.roboto(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //         color: const Color(0xff051A00)),
      //   ),
      //   centerTitle: true,
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(4.0),
      //     child: Container(
      //       height: 0.5,
      //       width: double.infinity,
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(colors: [
      //           const Color(0xff000000).withOpacity(.0),
      //           const Color(0xff000000),
      //           const Color(0xff000000).withOpacity(.0),
      //         ]),
      //       ),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kbyoncolor3,
        elevation: 0,
        title: const Text(
          'Forgot Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontFamily: kfontPoppinsSemiBold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                height: 48,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: textFieldDecoration(
                    label: 'Email',
                    hint: 'Email',
                  ),
                ),
                // child: TextFormField(
                //   keyboardType: TextInputType.emailAddress,
                //   controller: emailController,
                //   decoration: const InputDecoration(
                //       hintText: "Email",
                //       filled: true,
                //       fillColor: Color(0xffF4F4F4),
                //       border:
                //           UnderlineInputBorder(borderSide: BorderSide.none)),
                //   style: GoogleFonts.nunitoSans(
                //       fontSize: 15, color: const Color(0xff1E1E1E)),
                // ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: null,
              height: 45.63,
              child: ElevatedButton(
                onPressed: () async {
                  if (validateForm()) {
                    setState(() {
                      isLoading = true;
                    });
                    await FirebaseAuthentication()
                        .resetPassword(emailController.text, context);
                       
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 34.2, vertical: 9)),
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
                child: !isLoading
                    ? Text(
                        'Reset Password',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    : const SizedBox(
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeAlign: 1,
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
