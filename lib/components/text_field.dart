import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/utils/app_colours.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.lableText,
    this.icon,
    this.helperText,
    this.suffixIcon,
    this.isObsecure = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? helperText;
  final String lableText;
  final Icon? icon;
  final Widget? suffixIcon;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure,
      controller: controller,
      decoration: InputDecoration(
        helperText: helperText,
        labelStyle: const TextStyle(
          color: kbtnright,
        ),
        labelText: lableText,
        // label: Text('lable'),
        icon: icon,
        //Icon(Icons.accessibility_new_sharp, color: kbtnright),
        suffixIcon: suffixIcon,
        //Icon(Icons.access_alarms_outlined, color: kbtnright),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kbtnright, width: 0.7),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kbtnleft, width: 0.7),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
