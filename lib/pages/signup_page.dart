import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/loginsignuptextformfield.dart';
import '../constant.dart';
import '../helper/showmodalbottomsheet.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                'assets/images/signUpImage.png',
                width: 200,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sign up',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text('Enter your data to register in\nour warehouse',
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
                  const Text('Already have any account?',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9d9494))),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(' Sign In',
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
                      await signUp();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: textColor,
                      minimumSize: const Size(double.infinity, 80),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Sign up',
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

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushReplacementNamed('home_page');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        customModalBottomSheet(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        customModalBottomSheet(
            context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
