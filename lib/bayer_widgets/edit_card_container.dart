// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wasly_template/wasly_template.dart';

class EditCardContainer extends StatelessWidget {
  String productName;
  String description;
  String imagePath;
  EditCardContainer({
    required this.productName,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 216,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 160,
            height: 168,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            productName,
            style: CustomResponsiveTextStyles.headingH8
                .copyWith(color: AppColors.textPrimaryBase),
          ),
          Text(
            description,
            style: CustomResponsiveTextStyles.paragraph4.copyWith(
              color: AppColors.textSecondaryBase,
            ),
          ),
        ],
      ),
    );
  }
}
