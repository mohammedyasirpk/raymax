import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screen/production/widget/add_button_loading.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double? width;
  final VoidCallback function;
  final bool isLoading;

  const CustomButton(
      { Key? key,
      required this.text,
      required this.width,
      required this.function,
      required this.isLoading}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 45.63,
      child: ElevatedButton(
        onPressed: widget.function,
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 34.2, vertical: 9)),
            backgroundColor:
                MaterialStatePropertyAll(Theme.of(context).primaryColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
        child: widget.isLoading
            ? const SizedBox(width: 30,
              child: AddButtonLoading()
            )
            : Text(
                widget.text,
                style: GoogleFonts.nunitoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
      ),
    );
  }
}
