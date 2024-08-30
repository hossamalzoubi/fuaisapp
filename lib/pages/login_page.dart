// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_managemen_fuais/constant.dart';

import '../components/loginsignuptextformfield.dart';
import '../helper/showmodalbottomsheet.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/loginImage.png',
                width: 200,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                  'Enter you email and password\nto access the warehouse',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9d9494))),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormFieldLoginSignUp(
                onSave: (val) {
                  email = val!;
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'You must enter an email';
                  } else {
                    return null;
                  }
                },
                labelText: 'email',
                hintText: 'example@example.com',
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormFieldLoginSignUp(
                onSave: (val) {
                  password = val!;
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'You must enter the password';
                  } else {
                    return null;
                  }
                },
                labelText: 'password',
                hintText: '***** *****',
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have any account?',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9d9494))),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('signup_page');
                    },
                    child: const Text(' Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff9d9494))),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await logIn();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: textColor,
                      minimumSize: const Size(double.infinity, 80),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Login',
                      style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20)))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacementNamed('home_page');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customModalBottomSheet(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        customModalBottomSheet(
            context, 'Wrong password provided for that user.');
      }
    }
  }
}
