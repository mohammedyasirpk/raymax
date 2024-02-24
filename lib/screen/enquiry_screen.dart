// ignore_for_file: prefer_const_constructors
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/enquiry_model.dart';
import 'package:byon_care/services/showmassege.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Enquiryscreen extends StatelessWidget {
  const Enquiryscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    bool? isloading = false;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Enquiry',
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
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  '  Message',
                  style:
                      TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0XFF8E8E93).withOpacity(.12),
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              ),
              child: Center(
                child: TextField(
                  maxLines: 5,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  controller: messageController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10, right: 10),
                    hintText: '',
                    helperStyle: TextStyle(
                      color: const Color(0XFF919192).withOpacity(.40),
                      fontSize: 17,
                      fontFamily: kfontPoppinsRegular,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () async {
                if (messageController.text.isNotEmpty) {
                  EnquiryModel enquiryModel = EnquiryModel(
                    message: messageController.text,
                  );
                  String? userEmail = FirebaseAuth.instance.currentUser?.email;
                  await FirestoreServices().submitEnquiry(
                    enquiryModel: enquiryModel,
                    userEmail: userEmail ?? '',
                  );
                  showmassege('Submitted Successfully');
                  Navigator.pop(context);
                } else {
                  showmassege('Please enter a message');
                }
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              minWidth: 235,
              height: 44,
              color: kbyoncolor3,
              child: isloading == true
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 3.0,
                          ),
                        ),
                      ],
                    )
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
    );
  }
}
