// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';

class ClosedServiceScreen extends StatelessWidget {

  const ClosedServiceScreen(List<dynamic> complaints, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          margin: EdgeInsets.all(0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'kayla',
                    style:
                        TextStyle(fontSize: 17, fontFamily: kfontPoppinsMedium),
                  ),
                  Text(
                    '  item.qrId ?? ' '',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: kfontPoppinsRegular,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '7736848926',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: kfontPoppinsMedium,
                    fontSize: 13),
              ),
              Text(
                ' item.address ?? ' '',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: kfontPoppinsMedium,
                    fontSize: 13),
              ),
              Text(
                'item.complaints ?? ""',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: kfontPoppinsMedium,
                    fontSize: 13),
              )
            ],
          ),
        );
      },
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    );
  }
}
