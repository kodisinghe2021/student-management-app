import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proacadamy_student_management_app/utils/app_colours.dart';

class CusCardText extends StatelessWidget {
  const CusCardText({
    required this.text,
    this.size = 12,
    this.spacing = 0,
    this.weight = FontWeight.normal,
    Key? key,
  }) : super(key: key);
  final double size;
  final String text;
  final double spacing;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLigthText.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
          fontSize: size,
          letterSpacing: spacing,
          fontWeight: weight,
        ),
      ),
    );
  }
}
