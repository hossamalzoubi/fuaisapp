import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventory_managemen_fuais/pages/auth.dart';
import 'package:inventory_managemen_fuais/pages/login_page.dart';

import 'components/addstock.dart';
import 'components/enterinventory.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';
import 'pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'addstock': (context) => const AddStock(),
          'enterinventory': (context) => const EnterInventory(),
          'signup_page': (context) => const SignUp(),
          'home_page': (context) => const HomePage(),
          'login_page': (context) => const LogIn(),
        },
        home: const Auth());
  }
}
