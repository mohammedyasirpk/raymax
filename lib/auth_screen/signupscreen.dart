// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hoavy/firebase/firbase_dynamic_links.dart';
// import 'package:hoavy/firebase/firebase_authentication.dart';
// import 'package:hoavy/pages/forgot_password.dart';
// import 'package:hoavy/widgets/custom_button.dart';
// import 'package:no_context_navigation/no_context_navigation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class SingupPage extends StatefulWidget {
//   const SingupPage({super.key});

//   @override
//   State<SingupPage> createState() => _SingupPageState();
// }

// class _SingupPageState extends State<SingupPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   bool isOpened = false;
//   bool isLoadingSignup = false;
//   bool isLoadingSignin = false;
//   String? userUidToVisit;

//   Future<void> checkAlreadyOpened() async {
//     if (FirebaseAuth.instance.currentUser == null) {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       isOpened = prefs.getBool('alreadyOpened') ?? false;
//       // isOpened = true;
//       if (context.mounted) setState(() {});

//       if (isOpened) {
//         if (context.mounted) showSigninsheet();
//       } else {
//         await prefs.setBool('alreadyOpened', true);
//       }
//     }
//   }

//   Future<void> signUpForm(contextx) async {
//     if (nameController.text.isEmpty) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Enter name",
//         ),
//       );
//       return;
//     }

//     if (emailController.text.isEmpty ||
//         !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//             .hasMatch(emailController.text)) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Enter a valid email",
//         ),
//       );
//       return;
//     }
//     if (passwordController.text.isEmpty) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Enter password",
//         ),
//       );
//       return;
//     }
//     if (confirmPasswordController.text.isEmpty) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Enter confirm password",
//         ),
//       );
//       return;
//     }
//     if (passwordController.text != confirmPasswordController.text) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Both passwords are not same",
//         ),
//       );
//       return;
//     }
//     bool? result = await FirebaseAuthentication().signUp(nameController.text,
//         emailController.text, passwordController.text, contextx);
//     if (result == true) {
//       // isOpened = false;

//       if (contextx.mounted) {
//         Navigator.pop(contextx);
//         if (userUidToVisit != null) {
//           navService.pushNamed('/view_profile', args: userUidToVisit);
//         }
//       }
//     }
//   }

//   Future<void> singinForm(contextx) async {
//     if (emailController.text.isEmpty ||
//         !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//             .hasMatch(emailController.text)) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Enter a valid email",
//         ),
//       );
//       return;
//     }
//     if (passwordController.text.isEmpty) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Enter a valid password",
//         ),
//       );
//       return;
//     }
//     await FirebaseAuthentication()
//         .login(emailController.text, passwordController.text, context);
//     if (FirebaseAuth.instance.currentUser != null) {
//       isOpened = false;

//       if (contextx.mounted) {
//         Navigator.pop(contextx);
//         if (userUidToVisit != null) {
//           navService.pushNamed('/view_profile', args: userUidToVisit);
//         }
//       }
//     }
//   }

//   void showSignupsheet() {
//     showModalBottomSheet(
//       enableDrag: false,
//       isDismissible: !isOpened,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (contextx) {
//         return PopScope(
//           canPop: !isOpened,
//           child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(contextx).viewInsets.bottom),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(9.56),
//                 color: Colors.white,
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//               margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
//               width: double.infinity,
//               height: 390,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Let’s get started",
//                         style: GoogleFonts.nunitoSans(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       if (isOpened == false)
//                         InkWell(
//                             onTap: () => Navigator.pop(contextx),
//                             child: Container(
//                               width: 23,
//                               height: 23,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Theme.of(context)
//                                       .primaryColor
//                                       .withOpacity(0.07)),
//                               child: const Icon(Icons.close, size: 16),
//                             ))
//                     ],
//                   ),
//                   const SizedBox(height: 11),
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                         hintText: "Name",
//                         filled: true,
//                         fillColor: Color(0xffF4F4F4),
//                         border:
//                             UnderlineInputBorder(borderSide: BorderSide.none)),
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 15, color: const Color(0xff1E1E1E)),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                         hintText: "Email",
//                         filled: true,
//                         fillColor: Color(0xffF4F4F4),
//                         border:
//                             UnderlineInputBorder(borderSide: BorderSide.none)),
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 15, color: const Color(0xff1E1E1E)),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                         hintText: "Password",
//                         filled: true,
//                         fillColor: Color(0xffF4F4F4),
//                         border:
//                             UnderlineInputBorder(borderSide: BorderSide.none)),
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 15, color: const Color(0xff1E1E1E)),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     decoration: const InputDecoration(
//                         hintText: "Confirm Password",
//                         filled: true,
//                         fillColor: Color(0xffF4F4F4),
//                         border:
//                             UnderlineInputBorder(borderSide: BorderSide.none)),
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 15, color: const Color(0xff1E1E1E)),
//                   ),
//                   const SizedBox(height: 15),
//                   StatefulBuilder(builder: (contextx, StateSetter newsetState) {
//                     return CustomButton(
//                         isLoading: isLoadingSignup,
//                         text: "Sign Up",
//                         width: double.infinity,
//                         function: () async {
//                           if (isLoadingSignup) {
//                             return;
//                           }
//                           newsetState(() {
//                             isLoadingSignup = true;
//                           });
//                           await signUpForm(contextx);
//                           newsetState(() {
//                             isLoadingSignup = false;
//                           });
//                         });
//                   }),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Already have an account? ",
//                         style: GoogleFonts.nunitoSans(
//                             fontSize: 12, fontWeight: FontWeight.w600),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(contextx);
//                           showSigninsheet();
//                         },
//                         child: Text(
//                           "Sign in",
//                           style: GoogleFonts.nunitoSans(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context).primaryColor),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void showSigninsheet() {
//     showModalBottomSheet(
//       enableDrag: false,
//       isDismissible: !isOpened,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (contextx) {
//         return PopScope(
//           canPop: !isOpened,
//           child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(contextx).viewInsets.bottom),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(9.56),
//                 color: Colors.white,
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//               margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
//               width: double.infinity,
//               height: 310,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Sign In",
//                         style: GoogleFonts.nunitoSans(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       if (isOpened == false)
//                         InkWell(
//                             onTap: () => Navigator.pop(contextx),
//                             child: Container(
//                               width: 23,
//                               height: 23,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Theme.of(context)
//                                       .primaryColor
//                                       .withOpacity(0.07)),
//                               child: const Icon(Icons.close, size: 16),
//                             ))
//                     ],
//                   ),
//                   const SizedBox(height: 11),
//                   TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                         hintText: "Email",
//                         filled: true,
//                         fillColor: Color(0xffF4F4F4),
//                         border:
//                             UnderlineInputBorder(borderSide: BorderSide.none)),
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 15, color: const Color(0xff1E1E1E)),
//                   ),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                         hintText: "Password",
//                         filled: true,
//                         fillColor: Color(0xffF4F4F4),
//                         border:
//                             UnderlineInputBorder(borderSide: BorderSide.none)),
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 15, color: const Color(0xff1E1E1E)),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const ForgotPassword()));
//                           },
//                           child: Text('Forgot password',
//                               style: GoogleFonts.nunitoSans(
//                                 fontSize: 12,
//                               ))),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   StatefulBuilder(builder: (contextx, newsetState) {
//                     return CustomButton(
//                         isLoading: isLoadingSignin,
//                         text: "Sign In",
//                         width: double.infinity,
//                         function: () async {
//                           if (isLoadingSignin) {
//                             return;
//                           }
//                           newsetState(() {
//                             isLoadingSignin = true;
//                           });
//                           await singinForm(contextx);
//                           newsetState(() {
//                             isLoadingSignin = false;
//                           });
//                         });
//                   }),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Already have an account? ",
//                         style: GoogleFonts.nunitoSans(
//                             fontSize: 12, fontWeight: FontWeight.w600),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(contextx);
//                           showSignupsheet();
//                         },
//                         child: Text(
//                           "Sign up",
//                           style: GoogleFonts.nunitoSans(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context).primaryColor),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // void handleDynamicLink() {
//   //   FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
//   //     if (dynamicLinkData.link.path == '/profile') {
//   //       userUidToVisit = dynamicLinkData.link.queryParameters['id'];
//   //     }
//   //   }).onError((error) {
//   //     print('onLink error');

//   //     print(error.message);
//   //   });
//   // }

//   @override
//   initState() {
//     super.initState();
//     checkAlreadyOpened();
//     UserDynamicLink().initDynamicLinks(context);
//     // handleDynamicLink();
//   }
//   // @override
//   // void didChangeDependencies() {
//   //  checkAlreadyOpened();
//   //    super.didChangeDependencies();
//   // }

//   // void dispose() {
//   //   emailController.dispose();
//   //   passwordController.dispose();
//   //   confirmPasswordController.dispose();
//   //   nameController.dispose();

//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // double deviceWidth = MediaQuery.of(context).size.width;
//     // double deviceHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//         body: SafeArea(
//       child: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Positioned(top: 80, child: Image.asset('assets/images/Vector.png')),
//             Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//               Image.asset('assets/images/logo.png'),
//               Center(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GradientText(
//                           'Store and share ',
//                           style: GoogleFonts.roboto(
//                               color: Colors.black, fontSize: 32),
//                           colors: [
//                             Theme.of(context).primaryColor,
//                             Colors.yellow
//                           ],
//                         ),
//                         Text(
//                           'your',
//                           style: GoogleFonts.roboto(
//                               color: Colors.black, fontSize: 32),
//                         )
//                       ],
//                     ),
//                     Text(
//                       'business details',
//                       style:
//                           GoogleFonts.roboto(color: Colors.black, fontSize: 32),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 56,
//               ),
//               !isOpened
//                   ? Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: 18),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: 47,
//                                 height: 47,
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context)
//                                         .primaryColor
//                                         .withOpacity(.10),
//                                     shape: BoxShape.circle),
//                                 child: Image.asset(
//                                   'assets/images/solar_code-scan-bold.png',
//                                 ),
//                               ),
//                               Container(
//                                 width: 2,
//                                 height: 47,
//                                 color: Theme.of(context)
//                                     .primaryColor
//                                     .withOpacity(.10),
//                               ),
//                               Container(
//                                 width: 47,
//                                 height: 47,
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context)
//                                         .primaryColor
//                                         .withOpacity(.10),
//                                     shape: BoxShape.circle),
//                                 child: Image.asset(
//                                   'assets/images/solar_chat-round-dots-line-duotone.png',
//                                 ),
//                               ),
//                               Container(
//                                 width: 2,
//                                 height: 47,
//                                 color: Theme.of(context)
//                                     .primaryColor
//                                     .withOpacity(.10),
//                               ),
//                               Container(
//                                 width: 47,
//                                 height: 47,
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context)
//                                         .primaryColor
//                                         .withOpacity(.10),
//                                     shape: BoxShape.circle),
//                                 child: Image.asset(
//                                   'assets/images/solar_share-circle-bold-duotone.png',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Scan',
//                                   style: GoogleFonts.nunitoSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   width: 214,
//                                   child: Text(
//                                     'Tap to activate your card swiftly.',
//                                     style: GoogleFonts.nunitoSans(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w600,
//                                         color: const Color(0xff8A8A8A)),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 45,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Store & engage',
//                                   style: GoogleFonts.nunitoSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   width: 214,
//                                   child: Text(
//                                     'Manage multiple profiles, stay connected.',
//                                     style: GoogleFonts.nunitoSans(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w600,
//                                         color: const Color(0xff8A8A8A)),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 45,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Share',
//                                   style: GoogleFonts.nunitoSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   width: 214,
//                                   child: Text(
//                                     'Share profile info with a quick tap.',
//                                     style: GoogleFonts.nunitoSans(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w600,
//                                         color: const Color(0xff8A8A8A)),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     )
//                   : Padding(
//                       padding: const EdgeInsets.only(left: 48),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Column(
//                                 children: [
//                                   Container(
//                                     width: 47,
//                                     height: 47,
//                                     decoration: BoxDecoration(
//                                         color: Theme.of(context)
//                                             .primaryColor
//                                             .withOpacity(.10),
//                                         shape: BoxShape.circle),
//                                     child: Image.asset(
//                                       'assets/images/solar_code-scan-bold.png',
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 2,
//                                     height: 47,
//                                     color: Theme.of(context)
//                                         .primaryColor
//                                         .withOpacity(.10),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 12, left: 18),
//                                 child: Text(
//                                   'Scan',
//                                   style: GoogleFonts.nunitoSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Column(
//                                 children: [
//                                   Container(
//                                     width: 47,
//                                     height: 47,
//                                     decoration: BoxDecoration(
//                                         color: Theme.of(context)
//                                             .primaryColor
//                                             .withOpacity(.10),
//                                         shape: BoxShape.circle),
//                                     child: Image.asset(
//                                       'assets/images/solar_chat-round-dots-line-duotone.png',
//                                     ),
//                                   ),
//                                   Container(
//                                     width: 2,
//                                     height: 47,
//                                     color: Theme.of(context)
//                                         .primaryColor
//                                         .withOpacity(.10),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 12, left: 18),
//                                 child: Text(
//                                   'Store & engage',
//                                   style: GoogleFonts.nunitoSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Column(
//                                 children: [
//                                   Container(
//                                     width: 47,
//                                     height: 47,
//                                     decoration: BoxDecoration(
//                                         color: Theme.of(context)
//                                             .primaryColor
//                                             .withOpacity(.10),
//                                         shape: BoxShape.circle),
//                                     child: Image.asset(
//                                       'assets/images/solar_share-circle-bold-duotone.png',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 12, left: 18),
//                                 child: Text(
//                                   'Share',
//                                   style: GoogleFonts.nunitoSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//               const SizedBox(
//                 height: 115,
//               ),
//               if (isOpened == false)
//                 CustomButton(
//                   isLoading: false,
//                   text: "Get Started",
//                   width: null,
//                   function: showSignupsheet,
//                 )
//             ]),
//             Positioned(
//                 bottom: 80,
//                 right: 0,
//                 child: Image.asset('assets/images/Vector(1).png')),
//           ],
//         ),
//       ),
//     ));
//   }
// }