import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proacadamy_student_management_app/components/custom_text.dart';
import 'package:proacadamy_student_management_app/utils/app_colours.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.onTap,
    required this.text,
    this.height = 50,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);
  final double height;
  final String text;
  final Function() onTap;
  final bool isLoading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  List<Color> buttonColor = <Color>[
    const Color(0xFF293462),
    const Color(0xff5b0060),
  ];

  void _updateColorDown() {
    setState(() {
      buttonColor = [
        const Color(0xff5b0060),
        const Color(0xFF293462),
      ];
    });
  }

  void _updateColorUp() {
    setState(() {
      buttonColor = [
        const Color(0xFF293462),
        const Color(0xff5b0060),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (tapDownDetails) {
        _updateColorDown();
      },
      onTapUp: (tapUpDetails) {
        _updateColorUp();
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: double.infinity,
              height: widget.height + 3,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: const Color(0xFF293462),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceInOut,
            width: double.infinity,
            margin: const EdgeInsets.only(right: 3),
            height: widget.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: const Alignment(0.8, 1),
                colors: buttonColor,
                tileMode: TileMode.mirror,
              ),
              // color: kNavyBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: widget.isLoading
                  ? const SpinKitThreeInOut(
                      color: kWhite,
                    )
                  : Text(
                      widget.text,
                      style: GoogleFonts.dangrek(
                        fontSize: 20,
                        color: kWhite,
                        letterSpacing: 2.5,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class CusTextButton extends StatelessWidget {
  const CusTextButton({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: CusButtonText(text: text),
    );
  }
}

class CusOutlinedButton extends StatelessWidget {
  CusOutlinedButton({
    required this.text,
    required this.onTap,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : CusButtonText(text: text),
    );
  }
}
