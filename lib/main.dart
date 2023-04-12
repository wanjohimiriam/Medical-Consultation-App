import 'package:flutter/material.dart';
import 'package:medical_consultation_app/pages/Home.dart';
import 'package:medical_consultation_app/pages/signin_or_signup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => const SignInOrSignUp(),
        "/home":(context) => const HomeScreen(),
      },
    )
  );
}