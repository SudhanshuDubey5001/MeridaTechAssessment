import 'package:firebase_auth/firebase_auth.dart';
import 'package:meridatech_assessment/model/ShopUser.dart';

import '../utils/Constants.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  ShopUser _getUserFromFirebase(User user){
    return ShopUser(uid: user.uid);
  }

  // keep track of user is signed in or out by creating a stream
  Stream<ShopUser> get userStream{
    return _auth.authStateChanges()
        .map((User? user) => user!=null? _getUserFromFirebase(user): ShopUser(uid: "-1"));
  }

  Future signInWithEmailPassword(String email, String password) async{
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //sign in success then -
      User? user = credential.user;
      if(user!=null)
        return _getUserFromFirebase(user);
      else return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future createAccountWithEmailAndPassword(email, password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}