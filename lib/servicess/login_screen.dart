import 'package:byon_care/service_manager/dropdowntextfield.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'firebase_authentication.dart';
import 'forgot_password.dart';
import 'widget/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isOpened = false;
  bool isLoadingSignup = false;
  bool isLoadingSignin = false;
  String? userUidToVisit;

  Future<void> checkAlreadyOpened() async {
    if (FirebaseAuth.instance.currentUser == null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isOpened = prefs.getBool('alreadyOpened') ?? false;
      // isOpened = true;
      if (context.mounted) setState(() {});

      if (isOpened) {
        if (context.mounted) showSigninsheet();
      } else {
        await prefs.setBool('alreadyOpened', true);
      }
    }
  }

  Future<void> signUpForm(contextx) async {
    if (nameController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter name",
        ),
      );
      return;
    }
     if (phoneController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter your phone number",
        ),
      );
      return;
    }
    if (phoneController.text.length ==10) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Phone number must be 10 digits",
        ),
      );
      return;
    }
    

    if (emailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter a valid email",
        ),
      );
      return;
    }
    if (passwordController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter password",
        ),
      );
      return;
    }
    if (confirmPasswordController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter confirm password",
        ),
      );
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Both passwords are not same",
        ),
      );
      return;
    }
    bool? result = await FirebaseAuthentication().signUp(
        nameController.text,
        emailController.text,
        passwordController.text,
        contextx,
        phoneController.text);
    if (result == true) {
      Navigator.pop(contextx);
    
    }
  }

  Future<void> singinForm(contextx) async {
    if (emailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter a valid email",
        ),
      );
      return;
    }
    if (passwordController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Enter a valid password",
        ),
      );
      return;
    }
    await FirebaseAuthentication()
        .login(emailController.text, passwordController.text, context);
    if (FirebaseAuth.instance.currentUser != null) {
      isOpened = false;

      Navigator.pop(contextx);

    }
  }

  void showSignupsheet() {
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: !isOpened,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (contextx) {
        return PopScope(
          canPop: !isOpened,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(contextx).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.56),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Let’s get started",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        if (isOpened == false)
                          InkWell(
                              onTap: () => Navigator.pop(contextx),
                              child: Container(
                                width: 23,
                                height: 23,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.07)),
                                child: const Icon(Icons.close, size: 16),
                              ))
                      ],
                    ),
                    const SizedBox(height: 11),
                    // const SizedBox(height: 20),
                    TextFormField(
                      controller: nameController,
                      decoration: textFieldDecoration(
                        label: 'Name',
                        hint: 'Name',
                      ),
                    ),
                 
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: textFieldDecoration(
                        label: 'Email',
                        hint: 'Email',
                      ),
                    ),
           
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: textFieldDecoration(
                        label: 'Phone number',
                        hint: 'Phone number',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: textFieldDecoration(
                        label: 'Password',
                        hint: 'Password',
                      ),
                    ),
                 
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: textFieldDecoration(
                        label: 'Confirm Password',
                        hint: 'Confirm Password',
                      ),
                    ),
                 
                    const SizedBox(height: 15),
                    StatefulBuilder(
                        builder: (contextx, StateSetter newsetState) {
                      return CustomButton(
                          isLoading: isLoadingSignup,
                          text: "Sign Up",
                          width: double.infinity,
                          function: () async {
                            if (isLoadingSignup) {
                              return;
                            }
                            newsetState(() {
                              isLoadingSignup = true;
                            });
                            await signUpForm(contextx);
                            newsetState(() {
                              isLoadingSignup = false;
                            });
                          });
                    }),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(contextx);
                            showSigninsheet();
                          },
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.nunitoSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void showSigninsheet() {
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: !isOpened,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (contextx) {
        
        return PopScope(
          canPop: !isOpened,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(contextx).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.56),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign In",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        if (isOpened == false )
                          InkWell(
                              onTap: () => Navigator.pop(contextx),
                              child: Container(
                                width: 23,
                                height: 23,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(contextx)
                                        .primaryColor
                                        .withOpacity(0.07)),
                                child: const Icon(Icons.close, size: 16),
                              ))
                      ],
                    ),
                    const SizedBox(height: 11),
                
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: textFieldDecoration(
                        label: 'Email',
                        hint: 'Email',
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: textFieldDecoration(
                        label: 'Password',
                        hint: 'Password',
                      ),
                    ),
                
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  contextx,
                                  MaterialPageRoute(
                                      builder: (contextx) =>
                                          const ForgotPassword()));
                            },
                            child: Text('Forgot password',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                ))),
                      ],
                    ),
                    const SizedBox(height: 15),
                    StatefulBuilder(builder: (contextx, newsetState) {
                      return CustomButton(
                          isLoading: isLoadingSignin,
                          text: "Sign In",
                          width: double.infinity,
                          function: () async {
                            if (isLoadingSignin) {
                              return;
                            }
                            newsetState(() {
                              isLoadingSignin = true;
                            });
                            await singinForm(contextx);
                            newsetState(() {
                              isLoadingSignin = false;
                            });
                          });
                    }),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(contextx);
                            showSignupsheet();
                          },
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.nunitoSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(contextx).primaryColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }



  @override
  initState() {
    super.initState();
    checkAlreadyOpened();
    // handleDynamicLink();
  }


  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(top: 80, child: Image.asset('images/Vector.png')),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Image.asset(
                  'images/Raymax logo.png',
                  width: 190,
                ),
              ),
              Center(
                child: Column(
                  children: [
               

                    GradientText(
                      'Check warranty, ',
                      style:
                          GoogleFonts.roboto(color: Colors.black, fontSize: 30),
                      colors: [Theme.of(context).primaryColor, Colors.yellow],
                    ),
                    Text(
                      'and protect the product hassle-free!',
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.roboto(color: Colors.black, fontSize: 28),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              !isOpened
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.10),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  'images/solar_code-scan-bold.png',
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 47,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.10),
                              ),
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.10),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  'images/solar_chat-round-dots-line-duotone.png',
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 47,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.10),
                              ),
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.10),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  'images/solar_share-circle-bold-duotone.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Verify',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 214,
                                  child: Text(
                                    'Confirm the warranty status of your products with ease.',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff8A8A8A)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Report',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 214,
                                  child: Text(
                                    'Lodge complaints about product issues swiftly and efficiently.',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff8A8A8A)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Explore',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 214,
                                  child: Text(
                                    'Stay informed about new products and their details effortlessly.',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff8A8A8A)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 47,
                                    height: 47,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.10),
                                        shape: BoxShape.circle),
                                    child: Image.asset(
                                      'images/solar_code-scan-bold.png',
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 47,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.10),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 18),
                                child: Text(
                                  'Verify',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 47,
                                    height: 47,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.10),
                                        shape: BoxShape.circle),
                                    child: Image.asset(
                                      'images/solar_chat-round-dots-line-duotone.png',
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 47,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.10),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 18),
                                child: Text(
                                  'Report',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 47,
                                    height: 47,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(.10),
                                        shape: BoxShape.circle),
                                    child: Image.asset(
                                      'images/solar_share-circle-bold-duotone.png',
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 18),
                                child: Text(
                                  'Explore',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
              const SizedBox(
                height: 115,
              ),
              if (isOpened == false)
                CustomButton(
                  isLoading: false,
                  text: "Get Started",
                  width: null,
                  function: showSignupsheet,
                )
            ]),
            Positioned(
                bottom: 80,
                right: 0,
                child: Image.asset('images/Vector(1).png')),
          ],
        ),
      ),
    ));
  }
}
