import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:proacadamy_student_management_app/components/custom_buttons.dart';
import 'package:proacadamy_student_management_app/components/custom_text.dart';
import 'package:proacadamy_student_management_app/components/text_field.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';
import 'package:proacadamy_student_management_app/utils/app_colours.dart';
import 'package:proacadamy_student_management_app/views/login_screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String pageKey = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//#############################################################################//
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isSecure = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: getScreenSize(context).height,
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
                  top: 180,
                  left: getScreenSize(context).width * 0.2,
                  right: getScreenSize(context).width * 0.2,
                  child: const Icon(
                    Icons.person,
                    size: 200,
                    color: kPrimeryColor,
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
                        CustomHeadingText(text: 'Login'),
                      ],
                    ),
                  ],
                ),
                //#############################################################################//
                Positioned(
                  top: 400,
                  child: SizedBox(
                    width: getScreenSize(context).width,
                    height: getScreenSize(context).height * 0.6,
                    child: Column(
                      children: [
                        SizedBox(
                          width: getScreenSize(context).width * 0.8,
                          child: CustomTextField(
                              controller: _email, lableText: 'Email'),
                        ),
                        const SizedBox(height: 20),
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
                                Logger().i('Tapped');
                              },
                              text: 'Login'),
                        ),
                        const SizedBox(height: 15),
                        CusTextButton(
                            text: 'Not Account? Register here',
                            onTap: () {
                              Logger().i('Tapped');
                              Navigator.pushNamed(
                                  context, RegistrationScreen.pageKey);
                            }),
                        CusTextButton(
                            text: 'Forgot password',
                            onTap: () {
                              Logger().i('Tapped');
                            }),
                      ],
                    ),
                  ),
                ),
                //#############################################################################//
              ],
            ),
          ),
        ),
      ),
    );
  }
}
