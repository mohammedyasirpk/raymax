// ignore_for_file: prefer_const_constructors

import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphContainer extends StatelessWidget {
  const GraphContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    return SizedBox(
      height: 130,
      child: Center(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  height: 90,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kbyoncolor3,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  days[index],
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 15,
            );
          },
          itemCount: days.length,
        ),
      ),
    );
  }
}
