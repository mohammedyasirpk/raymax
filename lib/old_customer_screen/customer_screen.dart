// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable, avoid_unnecessary_containers
import 'package:byon_care/constents.dart';
import 'package:byon_care/old_customer_screen/profilescreen.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/screen/complaint_screen.dart';
import 'package:byon_care/screen/enquiry_screen.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    double percent = 0.7;

    List shopes = ['Manjeri', 'Nilambur'];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: StreamBuilder(
            stream: FirestoreServices().compareUserEmail(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: CircularProgressIndicator(
                      color: kbyoncolor3,
                    ),
                  ),
                );
              }
              List<DocumentSnapshot> documents = snapshot.data!.docs;
              if (documents.isEmpty) {
                return Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'No data available',
                      style: TextStyle(fontFamily: kfontPoppinsMedium),
                    ),
                  ),
                );
              }
              //  log(documents.toString());
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              documents[0]['brandName'],
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: kfontPoppinsBold,
                              ),
                            ),
                            Text(
                              documents[0]['productType'],
                              style: TextStyle(
                                fontFamily: kfontPoppinsMedium,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                  userModel: UserModel(
                                      name: userModel?.name,
                                      email: userModel?.email,
                                      phoneNo: userModel?.phoneNo,
                                      image: userModel?.image),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: userModel?.image != null
                                  ? DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(userModel!.image!),
                                    )
                                  : null,
                            ),
                            child: userModel?.image == null
                                ? Center(
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.person,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '222',
                                style: TextStyle(
                                  fontFamily: kfontPoppinsBold,
                                  fontSize: 40,
                                ),
                              ),
                              Text(
                                'days left',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: kfontPoppinsMedium,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SfRadialGauge(
                                    axes: <RadialAxis>[
                                      RadialAxis(
                                        startAngle: 180,
                                        endAngle: 0,
                                        showLabels: false,
                                        showTicks: false,
                                        axisLineStyle: AxisLineStyle(
                                          thickness: 0.2,
                                          thicknessUnit: GaugeSizeUnit.factor,
                                          color: kbyoncolor3,
                                        ),
                                        pointers: <GaugePointer>[
                                          NeedlePointer(
                                            value: percent * 100,
                                            enableAnimation: true,
                                            needleLength: 0.7,
                                            needleColor: Colors.black,
                                            knobStyle: KnobStyle(
                                              knobRadius: 0.09,
                                              sizeUnit: GaugeSizeUnit.factor,
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
                            width: 50,
                          ),
                          Container(
                            height: 190,
                            width: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: RadialGradient(
                                focalRadius: 10,
                                colors: [
                                  Colors.yellow.withOpacity(0.9),
                                  Colors.white,
                                ],
                                radius: 8.0,
                              ),
                              boxShadow: [
                                BoxShadow(blurRadius: 0),
                              ],
                            ),
                            child: Image.asset(
                              'images/inverter.png',
                              height: 90,
                              width: 90,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 5),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            'images/nixown.jpg',
                                          ))),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Nixown',
                                        style: TextStyle(
                                            fontFamily: kfontPoppinsBold,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Manjeri',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: kfontPoppinsMedium,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.phone,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          ' +91 7736848926',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: kfontPoppinsSemiBold,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 5),
                                      child: Container(
                                        width: 80,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: kbyoncolor3,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                size: 13,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'Get Location',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: shopes.length,
                  )
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
          backgroundColor: kbyoncolor3,
          icon: Icons.support_agent_outlined,
          children: [
            SpeedDialChild(
              child: Icon(Icons.graphic_eq_outlined),
              label: 'Enquiry',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Enquiryscreen(),
                    ));
              },
            ),
            SpeedDialChild(
              shape: CircleBorder(side: BorderSide.none),
              child: Icon(Icons.report_problem_outlined),
              label: 'Complaint',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComplaintScreen(
                        userModel: userModel,
                      ),
                    ));
              },
            ),
          ]),
    );
  }
}
