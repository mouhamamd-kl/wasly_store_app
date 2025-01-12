// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterButton extends StatelessWidget {
  String imagePath;
  Color buttonColor;
  Color borderColor;
  VoidCallback function;

  CounterButton({
    super.key,
    required this.imagePath,
    required this.buttonColor,
    required this.borderColor,
    required this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(100),
          color: buttonColor),
      child: IconButton(
        icon: SvgPicture.asset(imagePath),
        style: ButtonStyle(),
        onPressed: function,
      ),
    );
  }
}
