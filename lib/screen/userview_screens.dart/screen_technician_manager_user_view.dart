// ignore_for_file: prefer_const_constructors
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserViewTechnicianandSerManagerScreen extends StatefulWidget {
  const UserViewTechnicianandSerManagerScreen({Key? key, this.productData, this.userData})
      : super(key: key);

  final ProductModel? productData;
  final UserModel? userData;

  @override
  State<UserViewTechnicianandSerManagerScreen> createState() =>
      _UserViewTechnicianandSerManagerScreenState();
}

class _UserViewTechnicianandSerManagerScreenState
    extends State<UserViewTechnicianandSerManagerScreen> {
  Stream<QuerySnapshot<Map<String, dynamic>>>? servicestream;

  @override
  void initState() {

    if(widget.userData?.role == "technician"){
         servicestream = FirebaseFirestore.instance
        .collection("complaints").where("technicianId",isEqualTo: widget.userData?.uid)
        .orderBy("registerDate", descending: true)
        
        .snapshots();

    }else{
         servicestream = FirebaseFirestore.instance
          .collection("complaints")
          .orderBy("registerDate", descending: true)
          .snapshots();
    }
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: servicestream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 20,
              width: 20,
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator(
                color: kbyoncolor3,
              ),
            );
          }

          List<ComplaintModel> allcomplaintlist = [];

          for (QueryDocumentSnapshot<Map<String, dynamic>> element in snapshot.data?.docs ?? []) {
            ComplaintModel xcomplaints = ComplaintModel.fromMap(
                element.data() as Map<String, dynamic>, element.id,element.data()["productId"]);
            allcomplaintlist.add(xcomplaints);
          }
          return ListView.separated(
            itemCount: allcomplaintlist.length,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                highlightElevation: 0,
                onPressed: () {},
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
                            const Icon(
                              Icons.person,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              allcomplaintlist[index].name ?? "",
                              style: const TextStyle(
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
                            allcomplaintlist[index].status ?? "",
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
                        const Icon(
                          Icons.phone,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(allcomplaintlist[index].phoneNo ?? "",
                            style: TextStyle(
                              color: const Color(0xff230304).withOpacity(0.7),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
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
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      allcomplaintlist[index].registerDate !=
                                              null
                                          ? DateFormat('yyyy-MM-dd').format(
                                              allcomplaintlist[index]
                                                  .registerDate!
                                                  .toDate())
                                          : 'Not Available',
                                      style: const TextStyle(
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          height: 20,
                          child: const VerticalDivider(
                            thickness: 1.5,
                            color: Color(0xff777676),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
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
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      child: Text(
                                        allcomplaintlist[index].closedDate !=
                                                null
                                            ? DateFormat('yyyy-MM-dd').format(
                                                allcomplaintlist[index]
                                                    .registerDate!
                                                    .toDate())
                                            : 'Not Available',
                                        style: const TextStyle(
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
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
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
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        allcomplaintlist[index]
                                                .technicianName ??
                                            '',
                                        style: const TextStyle(
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
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);
            },
          );
        },
      ),
    );
  }
}