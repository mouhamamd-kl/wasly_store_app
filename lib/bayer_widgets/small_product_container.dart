// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wasly_template/wasly_template.dart';

class SmallProductContainer extends StatelessWidget {
  String productImagePath;
  String productName;
  String productDiscription;
  SmallProductContainer({
    super.key,
    required this.productImagePath,
    required this.productName,
    required this.productDiscription,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 150 / 232,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 150 / 168,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(productImagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Text(
            productName,
            style: CustomResponsiveTextStyles.headingH8
                .copyWith(color: AppColors.textPrimaryBase),
            textAlign: TextAlign.center,
          ),
          Text(
            productDiscription,
            style: CustomResponsiveTextStyles.paragraph4
                .copyWith(color: AppColors.textSecondaryBase),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
