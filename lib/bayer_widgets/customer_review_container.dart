// ignore_for_file: must_be_immutable

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:wasly_template/wasly_template.dart';

class CustomerReviewContainer extends StatefulWidget {
  bool isExpanded = false;
  String userImagePath;
  String username;
  String reviewDate;
  String review;
  double rate;

  CustomerReviewContainer({
    super.key,
    required this.userImagePath,
    required this.username,
    required this.reviewDate,
    required this.review,
    required this.rate,
  });
  @override
  State<CustomerReviewContainer> createState() =>
      _CustomerReviewContainerState();
}

class _CustomerReviewContainerState extends State<CustomerReviewContainer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(widget.userImagePath),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth / 2.4,
                    child: Text(
                      widget.username,
                      style: CustomResponsiveTextStyles.headingH9.copyWith(
                        color: AppColors.textPrimaryBase,
                      ),
                    ),
                  ),
                  Text(
                    widget.reviewDate,
                    style: CustomResponsiveTextStyles.paragraph5.copyWith(
                      color: AppColors.textPrimaryBase,
                    ),
                  ),
                ],
              ),
              Spacer(),
              PannableRatingBar(
                rate: widget.rate,
                items: List.generate(
                  5,
                  (index) => RatingWidget(
                    selectedColor: AppColors.ratingColor,
                    unSelectedColor: AppColors.surfaceDark,
                    child: Icon(
                      Icons.star,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: RichText(
                text: TextSpan(
              children: [
                WidgetSpan(
                  child: AnimatedSizeAndFade(
                    child: widget.isExpanded
                        ? fullDiscription()
                        : shortDiscription(),
                  ),
                ),
                if (!widget.isExpanded)
                  WidgetSpan(
                    child: GestureDetector(
                      child: Text(
                        '\tRead More',
                        style: CustomResponsiveTextStyles.paragraph5.copyWith(
                          color: AppColors.primaryBase,
                        ),
                      ),
                      onTap: () => setState(() {
                        widget.isExpanded = true;
                      }),
                    ),
                  ),
                if (widget.isExpanded)
                  WidgetSpan(
                    child: GestureDetector(
                      child: Text(
                        '\tRead Less',
                        style: CustomResponsiveTextStyles.paragraph5.copyWith(
                          color: AppColors.primaryBase,
                        ),
                      ),
                      onTap: () => setState(() {
                        widget.isExpanded = false;
                      }),
                    ),
                  ),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Text shortDiscription() {
    return Text(
      'Short Discription',
      style: CustomResponsiveTextStyles.paragraph5.copyWith(
        color: AppColors.textSecondaryBase,
      ),
    );
  }

  Text fullDiscription() {
    return Text(
      widget.review,
      style: CustomResponsiveTextStyles.paragraph5.copyWith(
        color: AppColors.textSecondaryBase,
      ),
    );
  }
}
