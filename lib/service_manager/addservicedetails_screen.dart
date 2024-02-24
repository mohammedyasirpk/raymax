// ignore_for_file: prefer_const_constructors
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/repository/topsnackbar.dart';
import 'package:byon_care/service_manager/dropdowntextfield.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Addservice extends StatefulWidget {
  const Addservice({Key? key, required this.complaintData}) : super(key: key);

  final ComplaintModel complaintData;

  @override
  State<Addservice> createState() => _ServiceState();
}

class _ServiceState extends State<Addservice> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? qrcode;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbyoncolor3,
        title: Text(
          '${widget.complaintData.id != null ? "Edit" : "Add"} Services',
          style: TextStyle(
              color: Colors.white,
              fontFamily: kfontPoppinsSemiBold,
              fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Details',
                  style:
                      TextStyle(fontFamily: kfontPoppinsRegular, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: widget.complaintData.name,
                
                  validator: (value) =>
                      value!.isEmpty ? 'Name cannot be blank' : null,
                  decoration: textFieldDecoration(
                      hint: 'Customer Name', label: 'Customer Name'),
                  onChanged: (value) {
                    widget.complaintData.name = value;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  initialValue: widget.complaintData.phoneNo,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
             
                  validator: (value) =>
                      value!.isEmpty ? 'Phone number cannot be blank' : null,
                  decoration: textFieldDecoration(
                    hint: 'Phone No',
                    label: 'Phone No',
                  ),
                  onChanged: (value) {
                    widget.complaintData.phoneNo = value;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  initialValue: widget.complaintData.address,
                  maxLines: 2,
              
                  validator: (value) =>
                      value!.isEmpty ? 'Address cannot be blank' : null,
                  decoration:
                      textFieldDecoration(hint: 'Address', label: 'Address'),
                  onChanged: (value) {
                    widget.complaintData.address = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Product Details',
                  style:
                      TextStyle(fontFamily: kfontPoppinsRegular, fontSize: 16),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  initialValue: widget.complaintData.qrId,
                
                  decoration: textFieldDecoration(
                      suffix: GestureDetector(
                        onTap: () async {
                          qrcode = await FlutterBarcodeScanner.scanBarcode(
                              '#ff6666', 'Cancel', false, ScanMode.DEFAULT);
                          if (qrcode == "-1") {
                            qrcode = null;
                          }
                          
                           else {
                           widget.complaintData.qrId = qrcode;
                          }
                        },
                        child: Image.asset(
                          'images/qrcodescan.png',
                          height: 20,
                          width: 20,
                          color: Colors.black,
                        ),
                      ),
                      hint: 'Product Id',
                      label: 'Product Id'),
                  onChanged: (value) {
                    widget.complaintData.qrId = value;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  initialValue: widget.complaintData.productData?.productName,
                  decoration: textFieldDecoration(
                      hint: 'Product Name', label: 'Product Name'),
                  onChanged: (value) {
                    widget.complaintData.productData?.productName = value;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  initialValue: widget.complaintData.productData?.modalName,
                  decoration: textFieldDecoration(
                      hint: 'Modal Name', label: 'Modal Name'),
                  onChanged: (value) {
                    widget.complaintData.productData?.modalName = value;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  initialValue: widget.complaintData.complaints,
                  maxLines: 3,
                  validator: (value) =>
                      value!.isEmpty ? 'Complaint cannot be blank' : null,
                  decoration: textFieldDecoration(
                      hint: 'Complaints', label: 'Complaints'),
                  onChanged: (value) {
                    widget.complaintData.complaints = value;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                color: Colors.blueGrey.shade400,
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                color: Colors.red,
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    FirestoreServices().AddOrEditservice(
                                        complaintdata: widget.complaintData);
                                    Navigator.pop(context, true);
                                  } else {
                                    showsnackbar(
                                        'Mandatory field must not be empty!',
                                        context,
                                        SnackbarCondition.failure);
                                  }
                                },
                                child: Text(
                                  widget.complaintData.id != null
                                      ? 'Edit'
                                      : 'Add',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
