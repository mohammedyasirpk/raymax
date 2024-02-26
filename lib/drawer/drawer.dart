// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:byon_care/admin_screen/helper/capitalized.dart';

import 'package:byon_care/drawer/termsandconditions.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/string_constant.dart';
import '../screen/userview_screens.dart/screen_admin_userview.dart.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  required  this.userdta,
  }) : super(key: key);

  final UserModel userdta;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int? selectedintex;
  List<String> iteamname = [
    "Terms And Conditions",
    "Contact Us",
    "Logout",
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff191919),
      child: SafeArea(
          child: Column(
        children: [
          InkWell(
            onTap: () async {
                      Navigator.of(context).pop();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsViewScreen(
                      
                      userData: widget.userdta,
                    ),
                  ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30)
                  .copyWith(right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: widget.userdta.image != null
                                ? Image.network(
                                    widget.userdta.image ?? '',
                                    fit: BoxFit.fill,
                                  )
                                : Container(
                                    decoration:
                                        BoxDecoration(color: Colors.grey[300]),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60)),
                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                            size: 40,
                                          ),
                                        )),
                                  ),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            capitalizeFirstLetter(
                                widget.userdta.name ?? "Not available"),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            capitalizeFirstLetter(
                              (widget.userdta.role ?? widget.userdta.email) ??
                                  "",
                            ),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.userdta.phoneNo ?? "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                       Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsViewScreen(
                      userData: widget.userdta,
                    ),
                  ));
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 39,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: const Color(0xffD8D8D8).withOpacity(.15),
            height: 1,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: iteamname.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        setState(() {
                          selectedintex = index;
                        });
                        if (iteamname[selectedintex ?? 0] ==
                            "Terms And Conditions") {
                          Navigator.of(context).pop();
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TermsAndConditions(),
                          ));
                        }
                        if (iteamname[selectedintex ?? 0] == "Contact Us") {
                          String phone = "$customerServiceNumber";
                          String message = "";
                          await launchUrl(Uri.parse(
                              "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}"));
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                        //   return "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";

                        if (iteamname[selectedintex ?? 0] == "Logout") {
                          Navigator.pop(context);
                          FirebaseAuth.instance.signOut();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 70),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          gradient: selectedintex == index
                              ? const LinearGradient(
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                  colors: [
                                      Color(0xffD21948),
                                      Color(0xffF0641F)
                                    ])
                              : null,
                        ),
                        height: 59,
                        child: Text(
                          iteamname[index],
                          style: selectedintex == index
                              ? const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)
                              : const TextStyle(
                                  color: Color(0xff90A1AC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: const Color(0xffD8D8D8).withOpacity(.15),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Column(
              children: [
                const Text(
                  'Developed by',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'images/kayla_w_logo.png',
                  height: 40,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
// Container(
//             alignment: Alignment.bottomLeft,
//             child: Image.asset("images/Kayla log.png",
//                 height: 150,
//                 opacity: const AlwaysStoppedAnimation<double>(.10)),
//           ),