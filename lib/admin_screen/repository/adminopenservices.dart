// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/service_manager/ServieViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminOpenService extends StatelessWidget {
  final List<ComplaintModel> complaints;

  final UserModel userData;
  const AdminOpenService({
    Key? key,
    required this.complaints,
    required this.userData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
    
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (complaints.isEmpty) {
              return Text('No data');
            }
    
            final complaint = complaints[index];
    
            return MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              highlightElevation: 0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServieViewScreen(
                        complaintid: complaint,
                        userData: userData,
                      ),
                    ));
              },
              elevation: .8,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            complaint.name ?? "",
                            style: TextStyle(
                                color: Color(0xff230304),
                                fontSize: 16,
                                fontFamily: kfontRobotoBold,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {},
                        height: 27,
                        elevation: 0,
                        minWidth: 58,
                        color: const Color(0xffD9EDD9),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12))),
                        child: Text(
                          complaint.status ?? "",
                          style: const TextStyle(
                              color: Color(0xff59C159),
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complaint.phoneNo ?? "",
                          style: TextStyle(
                            color: Color(0xff230304).withOpacity(0.7),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.calendar_month_outlined,
                                    size: 12, color: Color(0xff777676)),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Color(0xff777676),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    complaint.registerDate != null
                                        ? DateFormat('yyyy-MM-dd').format(
                                            complaint.registerDate!.toDate())
                                        : 'Not Available',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 20, 20, 20),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 20,
                        child: const VerticalDivider(
                          thickness: 1.5,
                          color: Color(0xff777676),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    size: 12,
                                    color: Color(0xff777676),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Closed",
                                      style: TextStyle(
                                          color: Color(0xff777676),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Not available',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 20, 20),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 20,
                        child: const VerticalDivider(
                          thickness: 1.5,
                          color: Color(0xff777676),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 12,
                                    color: Color(0xff777676),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Technician",
                                      style: TextStyle(
                                          color: Color(0xff777676),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      " anu",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 20, 20),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: complaints.length,
        ),
        
      ],
    );
  }
}