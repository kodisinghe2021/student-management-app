//check wther the given phone number is valid or not
import 'package:flutter/widgets.dart';
import 'package:proacadamy_student_management_app/components/aler.dart';

bool isValidMobileNumber(String mobile) {
  if (mobile.length == 10 &&
      mobile.startsWith('07') &&
      int.tryParse(mobile) != null) {
    return true;
  }
  return false;
}

//check wther the given nic number is valid or not
bool isValidNICNumber(String nic, String birthYear) {
  if (nic.length == 10 && birthYear.substring(0, 2) == nic.substring(0, 2)) {
    return true;
  }
  if (nic.length == 12 && birthYear.substring(0, 2) == nic.substring(2, 4)) {
    return true;
  }
  return false;
}

//check wther the given email is valid or not
bool isValidEmail(String email) {
  if (email.contains('@') && email.contains('.')) {
    return true;
  }
  return false;
}

//check wther the given password is enough strong or not
bool isStrongPassword(String password) {
  if (password.length > 6) {
    return true;
  }
  return false;
}

//  firstName: _firstName.text,
//                                   lastName: _lastName.text,
//                                   birthday:
//                                       '${date.year}/${date.month}/${date.day}',
//                                   age:
//                                       '${ageCalculator(date).years}-${ageCalculator(date).months}-${ageCalculator(date).days}',
//                                   gender:
//                                       genderConvertToString(selectedGender),
//                                   mobile: _mobileNumber.text,
//                                   location: Provider.of<LocationProvider>(
//                                           context,
//                                           listen: false)
//                                       .getAddress,
//                                   school: _school.text,
//                                   email: _email.text,
isEmptyValueAvailable(
  BuildContext context,
  String fName,
  String lName,
  String birthday,
  String age,
  String gender,
  String mobile,
  String location,
  String school,
  String email,
  String password,
) {
  if (fName == '') {
    warningAlert(
      context,
      'Empty field',
      'first Name empty',
      (() => Navigator.pop(context)),
    );
     return false;
  }
  if (lName == '') {
    warningAlert(
      context,
      'Empty field',
      'last Name empty',
      (() => Navigator.pop(context)),
    );
     return false;
  }
    if (birthday == '') {
    warningAlert(
      context,
      'Empty field',
      'Birthday not selected',
      (() => Navigator.pop(context)),
    );
     return false;
  }
    if (age == '') {
    warningAlert(
      context,
      'Empty field',
      'age empty',
      (() => Navigator.pop(context)),
    );
     return false;
  }
    if (gender == '') {
    warningAlert(
      context,
      'Empty field',
      'gender not selected',
      (() => Navigator.pop(context)),
    );
     return false;
  }
    if (mobile == '') {
    warningAlert(
      context,
      'Empty field',
      'mobile empty',
      (() => Navigator.pop(context)),
    );
     return false;
  }
    if (location == '') {
    warningAlert(
      context,
      'Empty field',
      'location not selected',
      (() => Navigator.pop(context)),
    );
     return false;
  }
    if (school == '') {
    warningAlert(
      context,
      'Empty field',
      'school empty',
      (() => Navigator.pop(context)),
    );
     return false;
  }
    if (email == '') {
    warningAlert(
      context,
      'Empty field',
      'email empty',
      (() => Navigator.pop(context)),
    );
     return false;
  }
    if (password == '') {
    warningAlert(
      context,
      'Empty field',
      'password empty',
      (() => Navigator.pop(context)),
    );
     return false;
  }
  if (fName == '' ||
      lName == '' ||
      birthday == '' ||
      age == '' ||
      gender == '' ||
      mobile == '' ||
      location == '' ||
      school == '' ||
      email == '' ||
      password == '') {
    return false;
  }
  return true;
}
