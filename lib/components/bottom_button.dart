import 'package:flutter/material.dart';

import '../constants.dart';



class BottomButton extends StatelessWidget {

  final String? title;
  final VoidCallback? onTab;

  BottomButton({
    required this.title, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        child: Center(
          child: Text(
            title!,
            style: kLargeButtonStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}