import 'package:flutter/material.dart';
import 'package:meridatech_assessment/utils/Constants.dart';

import '../../services/auth.dart';
import 'AuthScreen_signin.dart';

class AuthScreenSignUp extends StatelessWidget {
  const AuthScreenSignUp({super.key});

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
              decoration: InputDecoration(labelText: 'Email'),
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
                foregroundColor: Colors.white
              ),
              onPressed: () async{
                // Retrieve text from controllers
                String email = emailController.text;
                String password = passwordController1.text;
                String passwordConfirm = passwordController2.text;
                if(password == passwordConfirm){
                  await _authService.createAccountWithEmailAndPassword(email, password);
                  Navigator.pop(context);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Passwords do not match!'),
                      )
                  );
                }
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Constants.secondaryColor
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreenSignIn()));
              },
              child: Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
