import 'package:flutter/material.dart';
import 'package:login_page_practice_ii/pages/calculator_page.dart';
import 'package:login_page_practice_ii/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

