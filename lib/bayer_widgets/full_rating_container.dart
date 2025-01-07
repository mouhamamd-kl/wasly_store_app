import 'package:flutter/material.dart';
import 'package:wasly_template/core/styles/custom_responsive_text_styles.dart';
import 'package:wasly_template/wasly_template.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

class FullRatingContainer extends StatefulWidget {
  @override
  State<FullRatingContainer> createState() => _FullRatingContainerState();
}

class _FullRatingContainerState extends State<FullRatingContainer> {
  double rating = 1;
  double roundToNearestHalf(double value) {
    return (value * 2).round() / 2;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 230,
      height: 102,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Rate Our Service",
            style: CustomResponsiveTextStyles.headingH6.copyWith(
              color: AppColors.textPrimaryBase,
            ),
          ),
          PannableRatingBar(
            minRating: 1,
            maxRating: 5,
            rate: rating,
            items: List.generate(
              5,
              (index) => const RatingWidget(
                selectedColor: AppColors.ratingColor,
                unSelectedColor: Colors.grey,
                child: Icon(
                  Icons.star,
                  size: 48,
                ),
              ),
            ),
            onChanged: (value) {
              // the rating value is updated on tap or drag.
              setState(() {
                print(roundToNearestHalf(value));
                rating = roundToNearestHalf(value);
              });
            },
          ),
          Text(
            "very Good",
            style: CustomResponsiveTextStyles.headingH10.copyWith(
              color: AppColors.primaryBase,
            ),
          ),
        ],
      ),
    );
  }
}
