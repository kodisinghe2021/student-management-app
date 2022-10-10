import 'package:flutter/widgets.dart';

Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;

enum Days {
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
}
