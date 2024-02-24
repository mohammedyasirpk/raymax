// ignore_for_file: prefer_const_constructors

import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';

void privacypoliypolicybottomsheet(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
      context: context,
      builder: (builder) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
            ),
            margin: const EdgeInsets.only(top: 75),
            padding: const EdgeInsets.only(
                left: 13.5, right: 13.5, top: 30.0, bottom: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Privacy Policy & T&C',
                      style: TextStyle(
                          color: kbyoncolor2,
                          fontSize: 17,
                          fontFamily: kfontPoppinsMedium),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac placerat nisi. Donec efficitur ipsum in efficitur facilisis. In id tempor sapien, nec viverra est. Morbi mattis nibh mattis massa egestas, id interdum erat tincidunt. Aliquam elementum ut nibh vitae venenatis. Duis efficitur at nulla et tempor. Suspendisse felis quam, gravida nec ultricies sit amet, consectetur sit amet purus. Curabitur et arcu sed urna pharetra lacinia. Sed lobortis congue lorem, eget efficitur tellus feugiat mattis. Ut tempus tincidunt varius. Cras vulputate fermentum lorem, in semper mauris imperdiet at. Morbi volutpat, leo et elementum dictum, justo nunc aliquet orci, blandit mollis lacus augue vel dui. Vestibulum semper turpis ipsum, in volutpat ante vestibulum id. In sagittis vestibulum efficitur. Nam sed orci ut magna ullamcorper luctus. Nam tempor, leo a pulvinar pellentesque, nisl ligula mollis nibh, non porta nibh nisi nec enim.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 16,
                    color: kbyoncolor2,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Praesent lacinia nisl ac turpis consequat facilisis. Curabitur efficitur nisi odio. Fusce lacinia id sem ac lacinia. Praesent blandit nisl at ipsum scelerisque, eu facilisis odio vulputate. Nam ullamcorper arcu eu ligula lacinia porta. Integer sed risus elit. Donec eu auctor justo. Praesent ultrices lectus purus, suscipit feugiat odio ornare sit amet. Quisque molestie quis turpis in interdum. Fusce elit eros, semper nec gravida placerat, pellentesque sit amet mi. Nam volutpat non nunc id placerat. In eleifend tempus erat, non iaculis tortor egestas ornare.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kbyoncolor2,
                      fontSize: 16,
                      height: 1.5,
                      fontFamily: kfontPoppinsRegular),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(22.0))),
                      height: 44,
                      minWidth: 127,
                      color: kbyoncolor1,
                      child: const Text(
                        'Close',
                        style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontSize: 17,
                            fontFamily: kfontPoppinsLight),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
