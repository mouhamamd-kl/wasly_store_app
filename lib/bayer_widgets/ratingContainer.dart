// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wasly_template/core/styles/custom_color_styles.dart';

class RatingcontainerLight extends StatelessWidget {
  double rate;
  int numberOfRating;
  Color backgroundColor;
  Color foregroundColor;
  double backgroundOpacity;

  RatingcontainerLight({
    required this.rate,
    required this.numberOfRating,
    Color this.backgroundColor = AppColors.backgroundLight,
    Color this.foregroundColor = AppColors.textPrimaryBase,
    double this.backgroundOpacity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 21,
      decoration: BoxDecoration(
        color: backgroundColor.withValues(alpha: backgroundOpacity),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$rate",
            style: TextStyle(
              fontSize: 12,
              color: foregroundColor,
            ),
          ),
          Icon(
            Icons.star,
            size: 15,
            color: Colors.amber,
          ),
          Text(
            "($numberOfRating+)",
            style: TextStyle(
              fontSize: 8,
              color: AppColors.textSecondaryBase,
            ),
          ),
        ],
      ),
    );
  }
}
