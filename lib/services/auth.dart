import 'package:firebase_auth/firebase_auth.dart';
import 'package:meridatech_assessment/model/UserSBI.dart';

import '../utils/Constants.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserSBI _getUserFromFirebase(User user) {
    return UserSBI(uid: user.uid);
  }

  // keep track of user is signed in or out by creating a stream
  Stream<UserSBI> get userStream {
    return _auth.authStateChanges().map((User? user) =>
        user != null ? _getUserFromFirebase(user) : UserSBI(uid: "-1"));
  }

  Future signInWithEmailPassword(String email, String password) async {
    if (email == "" || password == "") return UserSBI(uid: '-1');
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //sign in success then -
      print(credential);
      User? user = credential.user;
      if (user != null)
        return _getUserFromFirebase(user);
      else
        return UserSBI(uid: '-2');
    } on FirebaseAuthException catch (e) {
      return UserSBI(uid: '-3');
    }
  }

  Future<String> createAccountWithEmailAndPassword(email, password) async {
    if (email == "" || password == "") return '-1';
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      if (user != null)
        return user.uid;
      else
        return '-2';
    } catch (e) {
      print(e.toString());
      return '-2';
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
