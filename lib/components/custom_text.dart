import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proacadamy_student_management_app/utils/app_colours.dart';

class CustomHeadingText extends StatelessWidget {
  const CustomHeadingText({
    required this.text,
    this.fontSize = 50,
    Key? key,
  }) : super(key: key);
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class CusButtonText extends StatelessWidget {
  const CusButtonText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.acme(fontSize: 15, color: kLigthText),
    );
  }
}
