// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wasly_store/bayer_widgets/profile_wallpaper.dart';
import 'package:wasly_store/bayer_widgets/ratingContainer.dart';
import 'package:wasly_template/wasly_template.dart';

class StoreProfileContainer extends StatelessWidget {
  String wallpaperImagePath;
  String profileImagePath;
  String storeName;
  String location;
  double rate;
  int numberOfRating;
  ////////////////////
  bool inCenter;
  Alignment? positionOfTheInfoInTheStack;
  Alignment? positionOfTheRating;
  CrossAxisAlignment? positionOfTheInfoInTheColumn;
  Alignment? positionOfTheStoreName;
  StoreProfileContainer({
    super.key,
    required this.wallpaperImagePath,
    required this.profileImagePath,
    required this.storeName,
    required this.location,
    required this.rate,
    required this.numberOfRating,
    this.inCenter = true,
  }) {
    switch (inCenter) {
      case true:
        positionOfTheInfoInTheStack = Alignment(-0.1, 1);
        positionOfTheInfoInTheColumn = CrossAxisAlignment.center;
        positionOfTheStoreName = Alignment.center;
        positionOfTheRating = Alignment(0.62, 0.83);
        break;
      case false:
        positionOfTheInfoInTheStack = Alignment.bottomLeft;
        positionOfTheInfoInTheColumn = CrossAxisAlignment.start;
        positionOfTheStoreName = Alignment.centerLeft;
        positionOfTheRating = Alignment(-0.09, 0.83);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        width: screenWidth,
        child: Stack(
          children: [
            ProfileWallpaper(wallpaperImagePath: wallpaperImagePath),
            Align(
              alignment: positionOfTheInfoInTheStack!,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                height: screenWidth / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: positionOfTheInfoInTheColumn!,
                  children: [
                    Container(
                      width: screenWidth / 3.1,
                      height: screenWidth / 3.1,
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
                    Container(
                      width: screenWidth / 3.1,
                      alignment: positionOfTheStoreName,
                      child: Text(
                        storeName,
                        style: CustomResponsiveTextStyles.headingH5
                            .copyWith(color: AppColors.textPrimaryBase),
                        textAlign: TextAlign.center,
                        maxLines: 2,
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
            Align(
              alignment: positionOfTheRating!,
              child: RatingcontainerLight(
                rate: rate,
                numberOfRating: numberOfRating,
                backgroundOpacity: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
