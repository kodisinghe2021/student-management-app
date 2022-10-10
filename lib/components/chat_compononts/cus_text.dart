
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalText extends StatelessWidget {
  const NormalText({
    required this.text,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.normal,
    Key? key,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
