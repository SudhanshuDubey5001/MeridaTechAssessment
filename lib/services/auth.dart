import 'package:firebase_auth/firebase_auth.dart';
import 'package:meridatech_assessment/model/ShopUser.dart';

import '../utils/Constants.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ShopUser _getUserFromFirebase(User user) {
    return ShopUser(uid: user.uid);
  }

  // keep track of user is signed in or out by creating a stream
  Stream<ShopUser> get userStream {
    return _auth.authStateChanges().map((User? user) =>
        user != null ? _getUserFromFirebase(user) : ShopUser(uid: "-1"));
  }

  Future signInWithEmailPassword(String email, String password) async {
    if (email == "" || password == "") return ShopUser(uid: '-1');
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
        return ShopUser(uid: '-2');
    } on FirebaseAuthException catch (e) {
      return ShopUser(uid: '-3');
    }
  }

  Future<String> createAccountWithEmailAndPassword(email, password) async {
    if (email == "" || password == "") return '-1';
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return '1';
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
