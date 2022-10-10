
import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/utils/app_colours.dart';

class CusCircullarIcon extends StatelessWidget {
  const CusCircullarIcon({
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Icon icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: kLigthText.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: IconButton(
          icon: const Icon(
            Icons.download,
            size: 15,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
