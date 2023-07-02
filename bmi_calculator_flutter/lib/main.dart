import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
        primaryColor: const Color(0XFF0A0E21),
        appBarTheme: const AppBarTheme(
          color: Color(0XFF0A0E21),
        ),
      ),
      home: const InputPage(),
    );
  }
}
