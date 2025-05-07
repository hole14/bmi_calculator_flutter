import 'package:flutter/material.dart';
import 'package:bmi_calculator/tambahan/constraints.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
            )
        ),
      ),
    );
  }
}