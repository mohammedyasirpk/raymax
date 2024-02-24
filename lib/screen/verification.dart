// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors
import 'package:byon_care/constents.dart';
import 'package:byon_care/popup/number_not_font_popup.dart';
import 'package:flutter/material.dart';

class Phoneverification extends StatefulWidget {
  const Phoneverification({Key? key}) : super(key: key);

  @override
  _PhoneverificationState createState() => _PhoneverificationState();
}

class _PhoneverificationState extends State<Phoneverification> {
  String? digit1;
  String? digit2;
  String? digit3;
  String? digit4;
  String? digit5;
  String? digit6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'images/phoneverification.png',
            height: 16,
            width: 18,
          ),
        ),
        title: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Nixown',
              style: TextStyle(
                color: kbyoncolor2,
                fontSize: 26,
                fontFamily: kfontPoppinsRegular,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Spacer(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Phone Verification',
                      style: TextStyle(
                        color: kbyoncolor2,
                        fontSize: 32,
                        fontFamily: kfontPoppinsRegular,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'We have sent you an SMS with a code to your registered no +91-XXXXX2192',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.2,
                      color: kbyoncolor2,
                      fontFamily: kfontPoppinsRegular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Enter your OTP code here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kbyoncolor2,
                      fontSize: 14,
                      fontFamily: kfontPoppinsRegular,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            digit1 == null ? kbyoncolor4 : kbyoncolor3,
                        maxRadius: 20,
                        minRadius: 20,
                        child: Text(
                          digit1 ?? '',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0XFFFFFFFF),
                            fontFamily: kfontPoppinsBold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor:
                            digit2 == null ? kbyoncolor4 : kbyoncolor3,
                        maxRadius: 20,
                        minRadius: 20,
                        child: Text(
                          digit2 ?? '',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0XFFFFFFFF),
                            fontFamily: kfontPoppinsBold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      CircleAvatar(
                        backgroundColor:
                            digit3 == null ? kbyoncolor4 : kbyoncolor3,
                        maxRadius: 20,
                        minRadius: 20,
                        child: Text(
                          digit3 ?? '',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0XFFFFFFFF),
                            fontFamily: kfontPoppinsBold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      CircleAvatar(
                        backgroundColor:
                            digit4 == null ? kbyoncolor4 : kbyoncolor3,
                        maxRadius: 20,
                        minRadius: 20,
                        child: Text(
                          digit4 ?? '',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0XFFFFFFFF),
                            fontFamily: kfontPoppinsBold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      CircleAvatar(
                        backgroundColor:
                            digit5 == null ? kbyoncolor4 : kbyoncolor3,
                        maxRadius: 20,
                        minRadius: 20,
                        child: Text(
                          digit5 ?? '',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0XFFFFFFFF),
                            fontFamily: kfontPoppinsBold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      CircleAvatar(
                        backgroundColor:
                            digit6 == null ? kbyoncolor4 : kbyoncolor3,
                        maxRadius: 20,
                        minRadius: 20,
                        child: Text(
                          digit6 ?? '',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0XFFFFFFFF),
                            fontFamily: kfontPoppinsBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Did not receive the OTP?',
                    style: TextStyle(
                      color: Color(0XFFB8BBC6),
                      fontSize: 16,
                      fontFamily: kfontPoppinsRegular,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      numbernotfontpopup(context);
                    },
                    child: const Text(
                      'Resend a new code.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: kfontPoppinsRegular,
                        color: kbyoncolor3,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              width: 375,
              color: const Color(0XFFD2D5DB),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '1',
                        numberpressed: () {
                          keyboard("1");
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '2',
                        numberpressed: () {
                          keyboard("2");
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '3',
                        numberpressed: () {
                          keyboard('3');
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '4',
                        numberpressed: () {
                          keyboard('4');
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '5',
                        numberpressed: () {
                          keyboard('5');
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '6',
                        numberpressed: () {
                          keyboard('6');
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '7',
                        numberpressed: () {
                          keyboard('7');
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '8',
                        numberpressed: () {
                          keyboard('8');
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '9',
                        numberpressed: () {
                          keyboard('9');
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 6.5,
                      ),
                      Expanded(
                        child: Container(
                          height: 46,
                        ),
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Numbers(
                        number: '0',
                        numberpressed: () {
                          keyboard('0');
                        },
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            if (digit6 != null) {
                              digit6 = null;
                            } else if (digit5 != null) {
                              digit5 = null;
                            } else if (digit4 != null) {
                              digit4 = null;
                            } else if (digit3 != null) {
                              digit3 = null;
                            } else if (digit2 != null) {
                              digit2 = null;
                            } else if (digit1 != null) {
                              digit1 = null;
                            }

                            setState(() {});
                          },
                          height: 46,
                          child: Image.asset(
                            'images/verification.png',
                            width: 22.62,
                            height: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6.5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void keyboard(String? number) {
    if (digit1 == null) {
      digit1 = number;
    } else if (digit2 == null) {
      digit2 = number;
    } else if (digit3 == null) {
      digit3 = number;
    } else if (digit4 == null) {
      digit4 = number;
    } else if (digit5 == null) {
      digit5 = number;
    } else if (digit6 == null) {
      digit6 = number;
      otpsubmit();
    }

    setState(() {});
  }

  void otpsubmit() async {
    await Future.delayed(const Duration(milliseconds: 500));

    String correctOTP = "123456";
    String enteredOTP = "$digit1$digit2$digit3$digit4$digit5$digit6";

    if (enteredOTP == correctOTP) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('OTP is correct!'),
          duration: const Duration(seconds: 2),
        ),
      );

      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return const Bloodsugaranalysisreport();
      //   }));
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Incorrect OTP. Please try again.'),
      //       duration: const Duration(seconds: 2),
      //     ),
      //   );

      digit1 = null;
      digit2 = null;
      digit3 = null;
      digit4 = null;
      digit5 = null;
      digit6 = null;

      setState(() {});
    }
  }
}

class Numbers extends StatelessWidget {
  const Numbers({this.number, this.numberpressed});
  final String? number;
  final Function? numberpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          numberpressed!();
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        color: const Color(0XFFFFFFFF),
        height: 46,
        child: Text(
          number ?? '',
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'SFProDisplay-Regular',
          ),
        ),
      ),
    );
  }
}
