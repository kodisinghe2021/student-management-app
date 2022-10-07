import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:proacadamy_student_management_app/components/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proacadamy_student_management_app/controller/data_validation.dart';
import 'package:proacadamy_student_management_app/models/student.dart';
import 'package:proacadamy_student_management_app/views/home_screens/main_pages_handller.dart';
import 'package:proacadamy_student_management_app/views/login_screens/login_screen.dart';

class User with ChangeNotifier {
//#############################################################################//
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firstore = FirebaseFirestore.instance;
//#############################################################################//
  late Student _currentStudent;
//#############################################################################//
  Student get getCurrentStudent => _currentStudent;
//#############################################################################//

//#############################################################################//
//Sign in to the firebase and take User credintial from the firebaseAuth and return it
  Future<String> createUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      UserCredential studentCredintial = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Logger().i(
          'User created success with Uid: --> ${studentCredintial.user!.uid}');
      return studentCredintial.user!.uid;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        errorAlert(context, 'Week password',
            'Password must have at least 6 characters', () {
          Navigator.pop(context);
        });
      } else if (e.code == 'email-already-in-use') {
        errorAlert(context, 'Invalid email', 'This email is aleady regitered.',
            () {
          Navigator.pop(context);
        });
      } else {
        errorAlert(context, 'Somthing went wrong', e.code, () {
          Navigator.pop(context);
        });
      }
    }
    notifyListeners();
    Logger().i('Signin Success...');
    return '';
  }

//#############################################################################//
// upload user data to the cloud firestore. id will be the same as id that provide when registering
  Future<void> svaeUserDataToFirestore(
    BuildContext context,
    String firstName,
    String lastName,
    String birthday,
    String age,
    String gender,
    String mobile,
    String location,
    String school,
    String email,
    String password,
  ) async {
    try {
      if (isValidData(
        context,
        firstName,
        lastName,
        birthday,
        age,
        gender,
        mobile,
        location,
        school,
        email,
        password,
      )) {
        // wait for the creating user
        String uID = await createUser(context, email, password);
        Logger().i('User signIN $uID');

        _firstore.collection('student').doc(uID).set({
          'studentID': uID,
          'firstName': firstName,
          'lastName': lastName,
          'birthday': birthday,
          'age': age,
          'gender': gender,
          'mobile': mobile,
          'location': location,
          'school': school,
          'email': email, //student.email,
        }).then((value) {
          successAlert(context, 'Success', 'Successfully registered with', () {
            Navigator.pushReplacementNamed(context, LoginScreen.pageKey);
          });
        });
      }
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        errorAlert(context, 'Week password',
            'Password must have at least 6 characters', () {
          Navigator.pop(context);
        });
      } else if (e.code == 'email-already-in-use') {
        errorAlert(context, 'Invalid email', 'This email is aleady regitered.',
            () {
          Navigator.pop(context);
        });
      } else {
        errorAlert(context, 'Somthing went wrong', e.code, () {
          Navigator.pop(context);
        });
      }
    }

    notifyListeners();
  }

//#############################################################################//
  // sign in user with email and password
  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await navigateWithuserStatus(context);
    } on FirebaseAuthException catch (e) {
      errorAlert(context, 'ERROR', e.code, () {
        Navigator.pop(context);
      });
    }
  }

//#############################################################################//
  //when user is signin then all data of user will be fetch and save
  Future<void> fetchUserdata(BuildContext context, String uID) async {
    try {
      DocumentSnapshot snapshot =
          await _firstore.collection('student').doc(uID).get();
      Map<String, dynamic> studentData =
          snapshot.data() as Map<String, dynamic>;
      _currentStudent = Student(
        id: studentData['studentID'],
        firstName: studentData['firstName'],
        lastName: studentData['lastName'],
        birthday: studentData['birthday'],
        age: studentData['age'],
        gender: studentData['gender'],
        mobile: studentData['mobile'],
        location: studentData['location'],
        school: studentData['school'],
        email: studentData['email'],
      );
    } on FirebaseException catch (e) {
      errorAlert(context, 'ERROR', e.code, () {
        Navigator.pop(context);
      });
    }
    notifyListeners();
  }

//#############################################################################//
//check user current status, user is currently logged or not
  Future<void> navigateWithuserStatus(BuildContext context) async {
    try {
      _auth.userChanges().listen((user) async {
        if (user != null) {
          await fetchUserdata(context, user.uid);
          Navigator.pushNamed(context, MainScreensHandller.pageKey);
          Logger().w('User logged');
        } else {
          Navigator.pushNamed(context, LoginScreen.pageKey);
        }
      });
    } on FirebaseException catch (e) {
      errorAlert(context, 'ERROR', e.code, () {
        Navigator.pop(context);
      });
    }
    notifyListeners();
  }
}
