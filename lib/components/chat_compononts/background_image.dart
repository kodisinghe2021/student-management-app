import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/components/custom_images.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int heigthInt = (getScreenSize(context).height * 0.8).toInt();
    int widthInt = (getScreenSize(context).width * 0.99).toInt();
    return SizedBox(
      width: getScreenSize(context).width,
      height: getScreenSize(context).height,
      child: NetworkCicularImage(
        imageUrl:
            'https://picsum.photos/id/279/${widthInt.toString()}/${heigthInt.toString()}',
        width: 40,
        height: 40,
        fit: BoxFit.fill,
      ),
    );
  }
}
