import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:logger/logger.dart';
import 'package:proacadamy_student_management_app/components/aler.dart';
import 'package:proacadamy_student_management_app/components/custom_buttons.dart';
import 'package:proacadamy_student_management_app/components/custom_text.dart';
import 'package:proacadamy_student_management_app/components/text_field.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';
import 'package:proacadamy_student_management_app/controller/data_validation.dart';
import 'package:proacadamy_student_management_app/models/student.dart';
import 'package:proacadamy_student_management_app/providers/location_provider.dart';
import 'package:proacadamy_student_management_app/utils/app_colours.dart';
import 'package:proacadamy_student_management_app/views/login_screens/login_screen.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String pageKey = '/page-key';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
//#############################################################################//
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _school = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
//###############################################################################//
  DateTime date = DateTime(
    DateTime.now().year - 18,
    DateTime.now().month,
    DateTime.now().day,
  );
  final DateTime firstDate = DateTime(
    DateTime.now().year - 35,
    DateTime.now().month,
    DateTime.now().day,
  );
  final DateTime lastDate = DateTime(
    DateTime.now().year - 18,
    DateTime.now().month,
    DateTime.now().day,
  );
//###############################################################################//
  bool _isCalandeShow = false;
  bool _isSecure = false;
  bool _isLocationLoading = false;
//###############################################################################//
  String _address = '';
//###############################################################################//
  Gender? _selectedGender;
  late Student _student;
//###############################################################################//
  DateDuration ageCalculator(DateTime birthday) {
    return AgeCalculator.dateDifference(
        fromDate: birthday, toDate: DateTime.now());
  }

  String genderConvertToString(Gender? selectedGender) {
    switch (selectedGender) {
      case Gender.Male:
        return 'male';
      case Gender.Female:
        return 'female';
      case Gender.Others:
        return 'other';
      default:
        return '';
    }
  }

//###############################################################################//
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: getScreenSize(context).width,
            child: Stack(
              children: [
                //#############################################################################//
                SizedBox(
                  width: getScreenSize(context).width,
                  child: SvgPicture.asset(
                    'assets/images/top-wave-1.svg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                //#############################################################################//
                Positioned(
                  top: 100,
                  right: getScreenSize(context).width * 0.1,
                  child: const Icon(
                    Icons.person_add,
                    size: 100,
                    color: kWhite,
                  ),
                ),
                //#############################################################################//
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        CustomHeadingText(
                          text: 'Registration',
                          fontSize: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: getScreenSize(context).height * 1.3),
                //#############################################################################//
                Positioned(
                  top: 250,
                  child: SizedBox(
                    width: getScreenSize(context).width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
//#############################################################################//
//~~~~~~~~~~~~~~~~~~~~~~~~~~   First name         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
                          SizedBox(
                            width: getScreenSize(context).width * 0.8,
                            child: CustomTextField(
                              controller: _firstName,
                              lableText: 'First Name',
                            ),
                          ),
                          const SizedBox(height: 10),
//~~~~~~~~~~~~~~~~~~~~~~~~~~   Last Name          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
                          SizedBox(
                            width: getScreenSize(context).width * 0.8,
                            child: CustomTextField(
                              controller: _lastName,
                              lableText: 'Last Name',
                            ),
                          ),
                          const SizedBox(height: 10),
//~~~~~~~~~~~~~~~~~~~~~~~~~  Date picker for Birthday    ~~~~~~~~~~~~~~~~~~~~~~//
                          SizedBox(
                            width: getScreenSize(context).width * 0.8,
                            height: 50,
                            child: CusOutlinedButton(
                                text: _isCalandeShow
                                    ? 'My Birthday:  ${date.year} / ${date.month} / ${date.day} '
                                    : 'Select Birthday',
                                onTap: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: firstDate,
                                      lastDate: lastDate);

                                  if (selectedDate == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      date = selectedDate;
                                      _isCalandeShow = true;
                                    });
                                  }
                                }),
                          ),
                          const SizedBox(height: 10),
//~~~~~~~~~~~~~~~~~~~~~~~~~  Show warning about age limit ~~~~~~~~~~~~~~~~~~~~~//
                          const Text(
                            '*age should be in 18 -35',
                            style: TextStyle(
                                fontSize: 10, color: Colors.redAccent),
                          ),
                          const SizedBox(height: 10),
//~~~~~~~~~~~~~~~~~~~~~~~~~  Date picker for Birthday    ~~~~~~~~~~~~~~~~~~~~~~//
                          Container(
                            width: getScreenSize(context).width * 0.8,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kbtnleft,
                                width: 0.7,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              color: kLightVaiyo,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CusButtonText(
                                text: 'My age:  ${ageCalculator(date)}',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
//~~~~~~~~~~~~~~~~~~~~~~~~~   Gender selector             ~~~~~~~~~~~~~~~~~~~~~~//
                          Container(
                            width: getScreenSize(context).width * 0.8,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kbtnleft,
                                width: 0.7,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              color: kLightVaiyo,
                            ),
                            child: GenderPickerWithImage(
                              showOtherGender: true,
                              verticalAlignedText: false,
                              selectedGender: Gender.Male,
                              selectedGenderTextStyle: const TextStyle(
                                  color: Color(0xFF8b32a8),
                                  fontWeight: FontWeight.bold),
                              unSelectedGenderTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              onChanged: (Gender? gender) {
                                _selectedGender = gender;
                                Logger().i(_selectedGender.toString());
                              },
                              equallyAligned: true,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              isCircular: true,
                              // default : true,
                              opacityOfGradient: 0.4,
                              padding: const EdgeInsets.all(3),
                              size: 30, //default : 40
                            ),
                          ),
//~~~~~~~~~~~~~~~~~~~~~~~~~   mobile number       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
                          const SizedBox(height: 20),
                          SizedBox(
                            width: getScreenSize(context).width * 0.8,
                            child: CustomTextField(
                              controller: _mobileNumber,
                              lableText: 'Mobile Number',
                              helperText: '+947********',
                            ),
                          ),
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~  Set My Current location    ~~~~~~~~~~~~~~~~~~~~//
                          SizedBox(
                              width: getScreenSize(context).width * 0.8,
                              height: 50,
                              child: CusOutlinedButton(
                                  isLoading: _isLocationLoading,
                                  text: 'Set My Location',
                                  onTap: () async {
                                    setState(() {
                                      _isLocationLoading = true;
                                    });

                                    await Provider.of<LocationProvider>(context,
                                            listen: false)
                                        .setUSerCoordinates(context);
                                    setState(() {
                                      _isLocationLoading = false;
                                    });
                                    // ignore: use_build_context_synchronously
                                    confirmAlert(context, 'Location',
                                        'Get my current location', () {
                                      _address = Provider.of<LocationProvider>(
                                              context,
                                              listen: false)
                                          .getAddress;
                                    });
                                    Logger().i('Address got : $_address');
                                    // CoolAlert.show(
                                    //   context: context,
                                    //   type: CoolAlertType.confirm,
                                    //   title: 'Select Location',
                                    //   text: 'Get my current location',
                                    //   animType: CoolAlertAnimType.rotate,
                                    //   confirmBtnText: 'Ok',
                                    //   cancelBtnText: 'Cancel',
                                    //   onConfirmBtnTap: () {
                                    //     Provider.of<LocationProvider>(context,
                                    //             listen: false)
                                    //         .setUSerCoordinates();
                                    //   },
                                    //   onCancelBtnTap: () {
                                    //     Navigator.pop(context);
                                    //   },
                                    // );
                                    // _address = Provider.of<LocationProvider>(
                                    //         context,
                                    //         listen: false)
                                    //     .getAddress;
                                  }
                                  //   Navigator.pushNamed(
                                  //       context, LocationScreen.pageKey);
                                  // },
                                  )),
                          const SizedBox(height: 10),
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~  School/University          ~~~~~~~~~~~~~~~~~~~~//
                          SizedBox(
                            width: getScreenSize(context).width * 0.8,
                            child: CustomTextField(
                                controller: _school,
                                lableText: 'School/University'),
                          ),
                          const SizedBox(height: 10),
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~  email      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
                          SizedBox(
                            width: getScreenSize(context).width * 0.8,
                            child: CustomTextField(
                                controller: _email, lableText: 'Email'),
                          ),
                          const SizedBox(height: 10),
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~  password    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
                          SizedBox(
                            width: getScreenSize(context).width * 0.8,
                            child: CustomTextField(
                              isObsecure: !_isSecure,
                              controller: _password,
                              lableText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isSecure = !_isSecure;
                                  });
                                },
                                icon: _isSecure
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: getScreenSize(context).width * 0.75,
                            child: CustomButton(
                                onTap: () {
                                  if (isEmptyValueAvailable(
                                    context,
                                    _firstName.text,
                                    _lastName.text,
                                    '${date.year}/${date.month}/${date.day}',
                                    "${ageCalculator(date).years}-${ageCalculator(date).months}-${ageCalculator(date).days}",
                                    genderConvertToString(_selectedGender),
                                    _mobileNumber.text,
                                    _address,
                                    _school.text,
                                    _email.text,
                                    _password.text,
                                  )) {
                                    _student = Student(
                                      firstName: _firstName.text,
                                      lastName: _lastName.text,
                                      birthday:
                                          '${date.year}/${date.month}/${date.day}',
                                      age:
                                          '${ageCalculator(date).years}-${ageCalculator(date).months}-${ageCalculator(date).days}',
                                      gender: genderConvertToString(
                                          _selectedGender),
                                      mobile: _mobileNumber.text,
                                      location: Provider.of<LocationProvider>(
                                              context,
                                              listen: false)
                                          .getAddress,
                                      school: _school.text,
                                      email: _email.text,
                                    );
                                    Logger().i(
                                        '${_student.firstName} / ${_student.lastName} / ${_student.age} / ${_student.birthday} / ${_student.location} / ${_student.gender} / ${_student.email} / ${_student.mobile} / ${_student.school} / ${_student.gender} / ${_student.email} / ${_student.mobile}');
                                  } else {
                                    Logger().w('Empty field there');
                                  }
                                },
                                text: 'Login'),
                          ),
                          const SizedBox(height: 15),
                          CusTextButton(
                              text: 'Already have an account? Login here',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, LoginScreen.pageKey);
                                Logger().i('Tapped');
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
