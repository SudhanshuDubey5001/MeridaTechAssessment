import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meridatech_assessment/Controller.dart';
import 'package:meridatech_assessment/main.dart';
import 'package:meridatech_assessment/model/ShopUser.dart';
import 'package:meridatech_assessment/pages/auth/AuthScreen_signup.dart';
import 'package:meridatech_assessment/services/auth.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import 'package:meridatech_assessment/utils/Routes.dart';

class AuthScreenSignIn extends StatefulWidget {
  const AuthScreenSignIn({super.key});

  @override
  State<AuthScreenSignIn> createState() => _AuthScreenSignInState();
}

class _AuthScreenSignInState extends State<AuthScreenSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Controller controller = Controller();
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Constants.primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.primaryColor,
                foregroundColor: Colors.white
              ),
              onPressed: () async{
                String email = emailController.text;
                String password = passwordController.text;

                //apply verification logic
                ShopUser user = await _authService.signInWithEmailPassword(email, password);
                if(user==null) print("error signing in");
                else print(user.uid);
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Constants.secondaryColor
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreenSignUp()));
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
