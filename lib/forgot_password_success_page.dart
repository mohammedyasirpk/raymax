import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordSuccessPage extends StatefulWidget {
  const ForgotPasswordSuccessPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordSuccessPage> createState() =>
      _ForgotPasswordSuccessPageState();
}

class _ForgotPasswordSuccessPageState extends State<ForgotPasswordSuccessPage> {
  closeScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    closeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 72),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.56),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 0,
                      color: const Color(0xff000000).withOpacity(0.12))
                ],
                color: Colors.white),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 89),
                child: Image.asset('images/check-circle.png'),
              ),
              Text(
                'Email Sent',
                style: GoogleFonts.roboto(
                    fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 53.5),
                child: Text(
                  'We have sent a mail to your email for reseting your password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                  ),
                ),
              )
            ]),
          ),
        ],
      )),
    );
  }
}
