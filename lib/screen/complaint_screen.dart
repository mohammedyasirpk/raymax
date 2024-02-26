// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/repository/topsnackbar.dart';
import 'package:byon_care/service_manager/dropdowntextfield.dart';
import 'package:byon_care/services/showmassege.dart';
import 'package:byon_care/servicess/firebase_services.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'production/widget/add_button_loading.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;


  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  String? qrcode;
  final complaintController = TextEditingController();
  final addressController = TextEditingController();
  bool? isloading = false;
  bool? scanner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Register a Complaint',
          style: TextStyle(
            fontFamily: kfontPoppinsMedium,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '  Qr Code',
                  style:
                      TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                ),
              ),
              InkWell(
                onTap: () async {
                  qrcode = await _scanQRCode();
                  setState(() {
                    scanner = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: DottedBorder(
                    radius: Radius.circular(20),
                    color: Colors.grey,
                    strokeWidth: 1,
                    dashPattern: [4, 7],
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      child: qrcode == null || qrcode == ""
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  'images/qrcodescan.png',
                                  height: 30,
                                  width: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Scan Product Qr code',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: kfontRobotoRegular,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            )
                          : Center(
                              child: Text(
                                qrcode == null || qrcode == ""
                                    ? "Scan Product Qr code"
                                    : qrcode ?? "Scan Product Qr Code",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: kfontPoppinsMedium),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '  Complaints',
                    style:
                        TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                maxLines: 5,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                controller: complaintController,
                decoration: textFieldDecoration(
                  hint: '',
                  label: '',
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '  Address',
                    style:
                        TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 5,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                controller: addressController,
                decoration: textFieldDecoration(
                  hint: '',
                  label: '',
                ),
              ),
              SizedBox(
                height: 35,
              ),
              MaterialButton(
                onPressed: () async {
                  if (_areFieldsValid()) {
                    final productDataForThisQrid =
                        await FirestoreServices().getproductbyqrcode(qrcode!);
                    if (productDataForThisQrid == null ) {
                      showsnackbar("Qr ID is Not Valid", context,SnackbarCondition.failure);
                      return;
                    }
                    
                    if(productDataForThisQrid.purchaseDateTime == null){
                      showsnackbar("This Product Not Sold Yet", context, SnackbarCondition.failure);
                      return;
                    }
                    ComplaintModel complaintModel = ComplaintModel(
                      
                      name: widget.userModel.name,
                      phoneNo: widget.userModel.phoneNo,
                      productData: productDataForThisQrid,
                      qrId: qrcode ?? "",
                      complaints: complaintController.text,
                      address: addressController.text,
                    );
                    String? userEmail =
                        FirebaseAuth.instance.currentUser?.email;

                    String? phoneNo = widget.userModel.phoneNo;
                    String? name = widget.userModel.name;

                    await FirestoreServices().submitComplaint(
                      complaintModel: complaintModel,
                      userEmail: userEmail,
                      name: name,
                      phoneNo: phoneNo,
                      status: 'open',
                    );

                    showsnackbar("Submitted SuccessFully", context,SnackbarCondition.success);
                    Navigator.pop(context);
                  } else if (qrcode == null || qrcode == "") {
                    showsnackbar("Please Scan QrCode", context,SnackbarCondition.warning);
                  } else if (complaintController.text.isEmpty) {
                    showsnackbar("Please Enter Complaints", context,SnackbarCondition.warning);
                  } else if (addressController.text.isEmpty) {
                    showsnackbar("Please Enter Your Address", context,SnackbarCondition.warning);
                  }
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                minWidth: 235,
                height: 44,
                color: kbyoncolor3,
                child: isloading == true
                    ? AddButtonLoading()
                    : Text(
                        'Submit',
                        style: const TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 17,
                          fontFamily: 'Avenir-Heavy',
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _scanQRCode() async {
    String? qrcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', false, ScanMode.DEFAULT);
    return qrcode != "-1" ? qrcode : '';
  }

  bool _areFieldsValid() {
    return qrcode != null &&
        qrcode!.isNotEmpty &&
        complaintController.text.isNotEmpty &&
        addressController.text.isNotEmpty;
  }
}
