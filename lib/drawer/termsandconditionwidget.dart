import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constents.dart';

class ChildreWidget extends StatelessWidget {
  const ChildreWidget(
      {Key? key, required this.subtitleText, required this.paragrapghText})
      : super(key: key);

  final String subtitleText;
  final String paragrapghText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subtitleText,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 16, color: kbyoncolor3)),
        const SizedBox(
          height: 5,
        ),
        Text(
          
          paragrapghText,textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w400, height: 1.5),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}