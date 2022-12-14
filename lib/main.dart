import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/providers/course_provider.dart';
import 'package:proacadamy_student_management_app/providers/location_provider.dart';
import 'package:proacadamy_student_management_app/providers/user_provider.dart';
import 'package:proacadamy_student_management_app/views/home_screens/main_pages_handller.dart';
import 'package:proacadamy_student_management_app/views/location_controller.dart';
import 'package:proacadamy_student_management_app/views/login_screens/login_screen.dart';
import 'package:proacadamy_student_management_app/views/login_screens/registration_screen.dart';
import 'package:proacadamy_student_management_app/views/splash_screen/splash_screen.dart';
import 'package:proacadamy_student_management_app/views/student_list/student_list.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => LocationProvider()),
         ChangeNotifierProvider(create: (context) => User()),
        ChangeNotifierProvider(create: (context) => CoursesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.pageKey: (context) => const SplashScreen(),
        LoginScreen.pageKey: (context) => const LoginScreen(),
        RegistrationScreen.pageKey: (context) => const RegistrationScreen(),
        LocationScreen.pageKey: (context) => const LocationScreen(),
        MainScreensHandller.pageKey: (context) => const MainScreensHandller(),
        StudentList.pageKey: (context) => const StudentList(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
