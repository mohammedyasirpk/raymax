import 'package:byon_care/constents.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../servicess/firebase_services.dart';

class UserContainer extends StatefulWidget {
  UserContainer(
      {Key? key, required this.userData, this.onLongPress, required this.onTap})
      : super(key: key);

  final UserModel userData;
  final VoidCallback? onLongPress;
  final VoidCallback onTap;

  final FirebaseServices _firebaseServices = FirebaseServices();

  void updateRoleFunction(
    BuildContext context,
    String? role,
  ) {
    _firebaseServices.updateRole(
      role: role,
      docid: userData.uid,
      context: context,
    );
    
  }

  @override
  State<UserContainer> createState() => _ProductListTileState();
}

 



String technician = "technician";
String production = "production";
String dealer = "dealer";
String admin = "admin";
String serviceManager = "service manager";
String customer = "customer";

class _ProductListTileState extends State<UserContainer> {
  double selectedColor = 0.0;

late ValueNotifier<String> roleNameNotifier;
  @override
  void initState() {
   roleNameNotifier = ValueNotifier(widget.userData.role ?? "customer");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPress,
      child: MaterialButton(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          width: 80,
                          height: 80,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                border: Border.all(color: kbyoncolor3, width: 2),
                                image: widget.userData.image == null
                                    ? const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "images/profile_pic-removebg-preview.png"))
                                    : DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(widget.userData.image!))),
                          )
              
                          // : CircleAvatar(child: Image.network(widget.userData!.image!)),
                          ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.userData.name ?? " Not Available",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: widget.userData.phoneNo ?? "",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.userData.email ?? "",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
             PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem<String>(
                    value: dealer,
                    child: Text(dealer),
                    onTap: () {
                      widget.updateRoleFunction(
                        context,
                        dealer,
                      );
                       roleNameNotifier.value = dealer;
                    },
                  ),
                  PopupMenuItem<String>(
                    value: technician,
                    child: Text(technician),
                    onTap: () {
                      widget.updateRoleFunction(context, technician);
                     roleNameNotifier.value = technician;
                    },
                  ),
                  PopupMenuItem<String>(
                    value: serviceManager,
                    child: Text(serviceManager),
                    onTap: () {
                      widget.updateRoleFunction(context, serviceManager);
                      roleNameNotifier.value = serviceManager;
                    },
                  ),
                  PopupMenuItem<String>(
                    value: production,
                    child: Text(production),
                    onTap: () {
                      widget.updateRoleFunction(context, production);
                      roleNameNotifier.value = production;
                    },
                  ),
                  PopupMenuItem<String>(
                    value: admin,
                    child: Text(admin),
                    onTap: () {
                      widget.updateRoleFunction(context, admin);
                          roleNameNotifier.value = admin;
                    },
                  ),
                  PopupMenuItem<String>(
                    value: customer,
                    child: Text(customer),
                    onTap: () {
                      widget.updateRoleFunction(context, null);
                        roleNameNotifier.value = "customer";
                      
                    },
                  ),
                ];
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Color(0xffD9EDD9),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(12))),
                child: ValueListenableBuilder<String>(
                  valueListenable: roleNameNotifier,
                  builder: (context, value, child) {
                    return Text(
                    value,
                    style: const TextStyle(
                        color: Color(0xff59C159),
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  );
                  },
                  
                ),
              ),
            ),
          ],
        ),
        minWidth: double.infinity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        highlightElevation: 0,
        onPressed: widget.onTap,
        elevation: .8,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
