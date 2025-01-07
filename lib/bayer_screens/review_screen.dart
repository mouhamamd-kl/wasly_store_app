import 'package:flutter/material.dart';
import 'package:wasly_store/bayer_widgets/full_rating_container.dart';
import 'package:wasly_store/bayer_widgets/store_profile_container.dart';
import 'package:wasly_template/wasly_template.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StoreProfileContainer(
              wallpaperImagePath: 'assets/images/wallpaper.png',
              profileImagePath: 'assets/images/image.png',
              rate: 4.5,
              numberOfRating: 100,
              storeName: 'Pizza Hut',
              location: 'Damascus - Barzeh',
            ),
            FullRatingContainer(),
            Container(
              height: 126,
              width: 335,
              color: Colors.black,
            ),
            SizedBox(
              width: 335,
              height: 54,
              child: CustomTextButtonActive(text: "Submit", onClick: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
