import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

dynamic confirmAlert(
    BuildContext context, String title, String text, Function() confirm) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.confirm,
    title: title,
    text: text,
    animType: CoolAlertAnimType.rotate,
    confirmBtnText: 'Ok',
    cancelBtnText: 'Cancel',
    onConfirmBtnTap: () {},
    onCancelBtnTap: () {
      Navigator.pop(context);
    },
  );
}

dynamic errorAlert(
    BuildContext context, String title, String text, Function() confirm) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: title,
    text: text,
    animType: CoolAlertAnimType.rotate,
    confirmBtnText: 'Ok',
    cancelBtnText: 'Cancel',
    onConfirmBtnTap: () {},
    onCancelBtnTap: () {
      Navigator.pop(context);
    },
  );
}

dynamic warningAlert(
    BuildContext context, String title, String text, Function() confirm) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.warning,
    title: title,
    text: text,
    animType: CoolAlertAnimType.rotate,
    confirmBtnText: 'Ok',
    cancelBtnText: 'Cancel',
    onConfirmBtnTap: () {},
    onCancelBtnTap: () {
      Navigator.pop(context);
    },
  );
}
