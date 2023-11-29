import 'package:flutter/material.dart';
import 'package:meridatech_assessment/utils/Constants.dart';

import '../../model/ShopUser.dart';
import '../../services/auth.dart';
import 'AuthScreen_signin.dart';

class AuthScreenSignUp extends StatefulWidget {
  const AuthScreenSignUp({super.key});

  @override
  State<AuthScreenSignUp> createState() => _AuthScreenSignUpState();
}

class _AuthScreenSignUpState extends State<AuthScreenSignUp> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController1 = TextEditingController();
    TextEditingController passwordController2 = TextEditingController();


    AuthService _authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
              decoration: InputDecoration(labelText: 'Email ID'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController1,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController2,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primaryColor,
                  foregroundColor: Colors.white),
              onPressed: () async {
                if (!isButtonPressed) {
                  setState(() {
                    isButtonPressed = true;
                  });
                  // Retrieve text from controllers
                  String email = emailController.text;
                  String password = passwordController1.text;
                  String passwordConfirm = passwordController2.text;
                  if (password == passwordConfirm) {
                    String result = await _authService
                        .createAccountWithEmailAndPassword(email, password);
                    setState(() {
                      isButtonPressed = false;
                    });
                    switch (result) {
                      case '1':
                        Navigator.pop(context);
                        break;
                      case '-1':
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Some fields are empty'),
                        ));
                        break;
                      case '-2':
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Some error occurred'),
                        ));
                        break;
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('Passwords do not match!'),
                    ));
                    setState(() {
                      isButtonPressed = false;
                    });
                  }
                }
              },
              child: !isButtonPressed? Text('Sign Up'): CircularProgressIndicator(color: Colors.white,),
            ),
            SizedBox(height: 16.0),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Constants.secondaryColor),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
