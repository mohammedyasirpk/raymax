import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMyProductTile extends StatelessWidget {
  const AddMyProductTile({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/qrcodescan.png",
                      color: kbyoncolor3,
                      width: 60,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start Product warranty",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black)),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "To start product warranty, simply scan the QR code located on its back.",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: " ", // Add space here
                              style: TextStyle(
                                // Adjust space width here
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
