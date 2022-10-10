import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';
import 'package:proacadamy_student_management_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String pageKey = '/splash-screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//#################################################################################//
  //initially doing
  @override
  void initState() {
    animateLogo();
    navigateToSelectedPage();
    super.initState();
  }

//#################################################################################//
  // give a vlue for animate logo with a delay
  Future<void> animateLogo() async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      setState(() {
        _logodiamentionMultiper = 0.2;
      });
    });
  }

  // Navigate to login or home page
  Future<void> navigateToSelectedPage() async {
    Future.delayed(const Duration(milliseconds: 5000), () async {
     Provider.of<User>(context, listen: false).navigateWithuserStatus(context);
      // Navigator.pushReplacementNamed(context, LoginScreen.pageKey);
    });
  }

//#################################################################################//
  double _logodiamentionMultiper = 0.0;
//#################################################################################//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: getScreenSize(context).width,
        height: getScreenSize(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              curve: Curves.easeInCubic,
              duration: const Duration(milliseconds: 2000),
              width: getScreenSize(context).width * _logodiamentionMultiper,
              height: getScreenSize(context).height * _logodiamentionMultiper,
              child: SvgPicture.asset(
                'assets/images/logo.svg',
              ),
            ),
            Text(
              'Proacadamy',
              style: GoogleFonts.acme(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
