import 'package:flutter/material.dart';
import 'package:wasly_store/bayer_widgets/big_product_card_container.dart';
import 'package:wasly_template/core/styles/custom_responsive_text_styles.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Saved",
          style: CustomResponsiveTextStyles.buttonText1,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: BigProductCardContainer(
              imagePath: 'assets/images/screen.png',
              productName: 'Samasung Screen',
              tags: 'Screen - watch - elcetronic',
              deliveryTime: '15 - 20 mins',
              rate: 4.5,
              numberOfRating: 100,
            ),
          );
        },
      ),
    );
  }
}
