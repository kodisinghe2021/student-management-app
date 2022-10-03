import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHandling {
//###############################################################################//
  //get a instance of the Firebase Auth class
  final FirebaseAuth _auth = FirebaseAuth.instance;
//###############################################################################//

  Future<void> userSignIN(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    userCredential.user!.email;
  }
//###############################################################################//

}
