
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constents.dart';
import '../models/complaints_model.dart';
import '../models/usermodel.dart';
import 'ServieViewScreen.dart';


class ComplainServiceContainer extends StatefulWidget {
const ComplainServiceContainer({
    Key? key,
    required this.complaint,
    required this.userData
  }) : super(key: key);


final UserModel userData;
  final ComplaintModel complaint;

  @override
  State<ComplainServiceContainer> createState() => _ComplainServiceContainerState();
}

class _ComplainServiceContainerState extends State<ComplainServiceContainer> {



  @override
  Widget build(BuildContext context) {

  



    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      highlightElevation: 0,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServieViewScreen(
                complaintid: widget.complaint,
                userData: widget.userData,
               
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
                  const Icon(
                    Icons.person,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.complaint.name ?? "",
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
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(12))),
                child: Text(
                  widget.complaint.status ?? "",
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
              Text(widget.complaint.phoneNo ?? "",
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
                            widget.complaint.registerDate != null
                                ? DateFormat('yyyy-MM-dd')
                                    .format(widget.complaint.registerDate!.toDate())
                                : 'Not Available',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 20, 20, 20),
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
                              widget.complaint.closedDate != null
                                  ? DateFormat('yyyy-MM-dd')
                                      .format(widget.complaint.registerDate!.toDate())
                                  : 'Not Available',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 20, 20, 20),
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
                            widget.complaint.technicianName ?? "Not available",
                                                          style: const TextStyle(
                              color: Color.fromARGB(255, 20, 20, 20),
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
  }
}