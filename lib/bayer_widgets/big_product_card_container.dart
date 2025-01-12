// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasly_store/bayer_widgets/ratingContainer.dart';
import 'package:wasly_template/wasly_template.dart';

class BigProductCardContainer extends StatelessWidget {
  String imagePath;
  String productName;
  String tags;
  String deliveryTime;
  double rate;
  int numberOfRating;
  BigProductCardContainer({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.tags,
    required this.deliveryTime,
    required this.rate,
    required this.numberOfRating,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 334 / 215,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Add the image and the rate
          AspectRatio(
            aspectRatio: 334 / 137,
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(imagePath),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.9, -0.8),
                    child: RatingcontainerLight(
                      rate: rate,
                      numberOfRating: numberOfRating,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Add the name of the product
          Text(
            productName,
            style: CustomResponsiveTextStyles.headingH6
                .copyWith(color: AppColors.textPrimaryBase),
          ),
          //Add the tags of the product
          Text(
            tags,
            style: CustomResponsiveTextStyles.paragraph4.copyWith(
              color: AppColors.textSecondaryBase,
            ),
          ),
          //Add the  type and the time of delivery
          Row(
            children: [
              SvgPicture.asset(
                AppConstants.getIconPath("bike.svg"),
                width: 18,
                height: 18,
              ),
              Text(
                "Free Delivery",
                style: CustomResponsiveTextStyles.paragraph4
                    .copyWith(color: AppColors.textPrimaryBase),
              ),
              Spacer(flex: 1),
              SvgPicture.asset(
                AppConstants.getIconPath("timer.svg"),
                width: 18,
                height: 18,
              ),
              Text(
                deliveryTime,
                style: CustomResponsiveTextStyles.paragraph4
                    .copyWith(color: AppColors.textPrimaryBase),
              ),
              Spacer(flex: 2),
            ],
          )
        ],
      ),
    );
  }
}
