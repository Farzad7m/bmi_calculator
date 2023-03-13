import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;

  RoundIconButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6,
      fillColor: Color(0xFF4c4E5E),
      shape: CircleBorder(),
      onPressed: onPress,
    );
  }
}