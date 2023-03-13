import 'package:flutter/material.dart';
import 'screen/input_page.dart';
// ignore_for_file: prefer_const_constructors


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0D22),
      ),
      ),
      home: InputPage(),
    );
  }
}
