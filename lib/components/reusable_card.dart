import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  // final void Function()? onPress;
  final VoidCallback? onPress;

  ReusableCard({this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          // color: Color(0xFF1D1E33),
          color: color ?? kActiveCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}