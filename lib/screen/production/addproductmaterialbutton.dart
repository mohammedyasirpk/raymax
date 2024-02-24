// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:byon_care/models/product_model_class.dart';
import 'package:flutter/material.dart';

class AddProductscreencontainer extends StatelessWidget {
  const AddProductscreencontainer({
    Key? key,
  }) : super(key: key);

  // final ProductModel productData;

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Warranty",
                          style: TextStyle(
                              color: Color(0xff777676),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // complaint.registerDate != null
                          //     ? DateFormat('yyyy-MM-dd')
                          //         .format(complaint.registerDate!.toDate())
                          'Not Available',
                          style: TextStyle(
                              color: Color.fromARGB(255, 20, 20, 20),
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Additional.W",
                            style: TextStyle(
                                color: Color(0xff777676),
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            // complaint.closedDate != null
                            //     ? DateFormat('yyyy-MM-dd')
                            //         .format(complaint.registerDate!.toDate())
                            'Not Available',
                            style: TextStyle(
                                color: Color.fromARGB(255, 20, 20, 20),
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Production",
                            style: TextStyle(
                                color: Color(0xff777676),
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not Available',
                            style: TextStyle(
                                color: Color.fromARGB(255, 20, 20, 20),
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
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
  }
}
