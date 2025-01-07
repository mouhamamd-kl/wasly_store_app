// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wasly_store/bayer_widgets/ratingContainer.dart';
import 'package:wasly_template/core/styles/custom_responsive_text_styles.dart';
import 'package:wasly_template/wasly_template.dart';

class StoreProfileContainer extends StatelessWidget {
  String wallpaperImagePath;
  String profileImagePath;
  String storeName;
  String location;
  double rate;
  int numberOfRating;

  StoreProfileContainer({
    required this.wallpaperImagePath,
    required this.profileImagePath,
    required this.storeName,
    required this.location,
    required this.rate,
    required this.numberOfRating,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: screenHeight / 2.15,
      width: screenWidth,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 375 / 250,
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(wallpaperImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: SizedBox(
              width: 228,
              height: 210,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(profileImagePath),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Text(
                      storeName,
                      style: CustomResponsiveTextStyles.headingH5
                          .copyWith(color: AppColors.textPrimaryBase),
                      textAlign: TextAlign.center,
                      maxLines: 2, // Ensures the text wraps to the next line
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    location,
                    style: CustomResponsiveTextStyles.paragraph1
                        .copyWith(color: AppColors.textSecondaryBase),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 33,
            right: 50,
            child: RatingcontainerLight(
              rate: 4.5,
              numberOfRating: 100,
              backgroundOpacity: 0,
            ),
          )
        ],
      ),
    );
  }
}
