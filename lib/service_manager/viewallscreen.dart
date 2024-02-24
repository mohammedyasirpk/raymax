// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_null_comparison, unrelated_type_equality_checks
import 'dart:developer';
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/service_manager/openservices_screen.dart';
import 'package:byon_care/service_manager/servicemanagershimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/string_constant.dart';
import 'complaint_service_container.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key, required this.userData}) : super(key: key);

  final UserModel userData;

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  String? selectedStatus;

  late ScrollController _scrollCtrl;

  bool _isLoading = false;

  List<ComplaintModel> complaints = [];

  List<ComplaintModel> filtteredComplaints = [];

  Stream<QuerySnapshot>? servicestream;

  bool islast = false;

  bool isAlreadyFilttered = false;
  @override
  void initState() {
    _scrollCtrl = ScrollController()..addListener(_scrollListener);
    _isLoading = true;
    getproductlist(selectedStatus);
    super.initState();
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    bool isAlmostEnded = _scrollCtrl.position.pixels >
        (0.80 * _scrollCtrl.position.maxScrollExtent); //80% scrolled
    if (isAlmostEnded && !_isLoading) {
      getproductlist(selectedStatus);
    }
  }

  List<ComplaintModel> complaintlist = [];

  DocumentSnapshot? lastDoc;

  Future getproductlist(
    String? status,
  ) async {
    if (status != selectedStatus) {
      lastDoc = null;
      complaintlist = [];
      islast = false;
    }

    if (islast == true) {
      return;
    }
    selectedStatus = status;
    late QuerySnapshot<Map<String, dynamic>> firebaseData;
    _isLoading = true;
    if (lastDoc == null) {
      log("firebaseData");
      firebaseData = await FirebaseFirestore.instance
          .collection("complaints")
          .where('status', isEqualTo: status)
          .where("technicianId",isEqualTo:widget.userData.role =="technician" ? widget.userData.uid:null)
          .orderBy('registerDate', descending: true)
          .limit(10)
          .get();
    } else {
      log('message');
      firebaseData = await FirebaseFirestore.instance
          .collection("complaints")
          .where('status', isEqualTo: status)
                    .where("technicianId",isEqualTo:widget.userData.role =="technician" ? widget.userData.uid:null)

          .orderBy('registerDate', descending: true)
          .startAfterDocument(lastDoc!)
          .limit(10)
          .get();
    }
    _isLoading = false;
    if (firebaseData.docs.isNotEmpty) {
      lastDoc = firebaseData.docs.last;
    } else {
      islast = true;
    }
    if (firebaseData.docs.length < 10) {
      islast = true;
    }

    for (var element in firebaseData.docs) {
      ComplaintModel complaint =
          ComplaintModel.fromMap(element.data(), element.id,element.data()[productIdKeyFirestore]);

      complaintlist.add(complaint);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbyoncolor3,
        title: Text(
          'Services',
          style: TextStyle(
              color: Colors.white,
              fontFamily: kfontPoppinsSemiBold,
              fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 11,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      getproductlist(null);
                      setState(() {});
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: selectedStatus == null
                              ? kbyoncolor3
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(
                            fontFamily: kfontPoppinsMedium,
                            fontSize: 14,
                            color: selectedStatus == null
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getproductlist('open');
                      setState(() {});
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: selectedStatus == 'open'
                              ? kbyoncolor3
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Open Services',
                          style: TextStyle(
                            fontFamily: kfontPoppinsMedium,
                            fontSize: 14,
                            color: selectedStatus == 'open'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      getproductlist('pending');
                      setState(() {});
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: selectedStatus == 'pending'
                              ? kbyoncolor3
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Pending Service',
                          style: TextStyle(
                            fontFamily: kfontPoppinsMedium,
                            fontSize: 14,
                            color: selectedStatus == 'pending'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      getproductlist('closed');
                      setState(() {});
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: selectedStatus == 'closed'
                              ? kbyoncolor3
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Closed Services',
                          style: TextStyle(
                            fontFamily: kfontPoppinsMedium,
                            fontSize: 14,
                            color: selectedStatus == 'closed'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: complaintlist.isNotEmpty
                    ? ListView.separated(
                        controller: _scrollCtrl,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          ComplaintModel complaint = complaintlist[index];

                          return ComplainServiceContainer(

                            complaint: complaint,
                            userData: widget.userData,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: complaintlist.length,
                      )
                    : _isLoading
                        ? ShimmerServiceManager(
                      
                          )
                        : SizedBox(
                            height: 20000,
                            child: Center(
                              child: Text(
                                'No Services available',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: kfontPoppinsMedium),
                              ),
                            ),
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
