import 'package:flutter/material.dart';
import 'task1/implementasi.dart';
//import 'task2/data_dummy.dart';

void main() => runApp(const FoodApp());

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}