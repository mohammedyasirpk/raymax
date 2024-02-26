// ignore_for_file: unnecessary_cast, prefer_const_constructors
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/service_manager/dropdowntextfield.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool?> judgeSubmitConfirmBottomSheet(
  context,
  ComplaintModel complaintData,
) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 5),
                child: const Text(
                  'Edit Service Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextFormField(
                  initialValue: complaintData.complaints,
                  decoration: textFieldDecoration(
                    hint: 'Complaints',
                    label: 'Complaints',
                  ),
                  onChanged: (value) {
                    complaintData.complaints = value;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextFormField(
                  initialValue: complaintData.component,
                  decoration: textFieldDecoration(
                    hint: 'Component',
                    label: 'Component',
                  ),
                  onChanged: (value) {
                    complaintData.component = value;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButtonFormField<String>(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration:
                    textFieldDecoration(hint: 'Status', label: 'Status'),
                items: (["open", 'pending', 'closed'] as List<String>)
                    .map((e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (value) {
                  complaintData.status = value!;
                },
                value: complaintData.status,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: textFieldDecoration(
                    hint: 'Service Charges',
                    label: 'Service Charges',
                  ),
                  onChanged: (value) {

                    complaintData.servicecharges = int.tryParse(value) ?? 0;
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              color: Colors.red,
                              onPressed: () {
                                FirestoreServices()
                                    .editServiceDetails(complaintData);
                                Navigator.pop(
                                  context,
                                  true,
                                );
                              },
                              child: const Text(
                                'Edit',
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
        );
      });
    },
  );
}
