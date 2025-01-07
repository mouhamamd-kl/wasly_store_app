// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasly_store/bayer_widgets/ratingContainer.dart';
import 'package:wasly_template/wasly_template.dart';

class ProductCardContainer extends StatelessWidget {
  String imagePath;
  String productName;
  String tags;
  String deliveryTime;
  double rate;
  int numberOfRating;
  ProductCardContainer({
    required this.imagePath,
    required this.productName,
    required this.tags,
    required this.deliveryTime,
    required this.rate,
    required this.numberOfRating,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 257,
      height: 215,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Add the image and the rate
          SizedBox(
            width: 257.15,
            height: 137.23,
            child: Stack(
              fit: StackFit.loose,
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  alignment: Alignment.topLeft,
                  child: RatingcontainerLight(
                    rate: rate,
                    numberOfRating: numberOfRating,
                  ),
                ),
              ],
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
