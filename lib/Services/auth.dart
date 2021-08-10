import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  //To create a new Firebase Auth instance, call the instance getter on FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error);
      return null;
    }
  }

  // Stream<User?> get user {
  //   return _auth.authStateChanges();
  //   //here we don't have to necessarily use map. We can def use firebase user instance.
  // }

  //sign in with email and password
  Future signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //register with email

  Future registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      print("sucess");

      return result.user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
