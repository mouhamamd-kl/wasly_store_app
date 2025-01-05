import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wasly_template/wasly_template.dart';

class OnboardingScreen extends StatelessWidget {
  final VoidCallback onFinish;
  const OnboardingScreen({Key? key, required this.onFinish}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0, color: Colors.black54);
    const titleStyle = TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    const pageDecoration = PageDecoration(
      titleTextStyle: titleStyle,
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.symmetric(horizontal: 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      imageAlignment: Alignment.topCenter,
      bodyFlex: 2,
      imageFlex: 4,
    );
    return OnboardingPage(
      onFinish: onFinish,
      pages: [
        PageModel(
            title: 'Manage Your Store with Ease',
            bodyText:
                "Track your orders, analyze customer feedback, and monitor your store's performance seamlessly",
            imagePath:
                AppConstants.getAssetPath('store/onBoarding/Heading.png'),

            // "packages/wasly_template/assets/images/store/onBoarding/Heading.png",
            titleHighlightColor: AppColors.primaryBase,
            titleOriginalColor: AppColors.textPrimaryBase,
            titleStyle: CustomResponsiveTextStyles.headingH3,
            bodyStyle: CustomResponsiveTextStyles.paragraph3.copyWith(
              color: AppColors.textSecondaryBase,
            ),
            pageDecoration: pageDecoration),
        PageModel(
            title: 'Track Your Orders in Real-Time',
            bodyText:
                'Stay updated with your current orders and their statuses.',
            imagePath:
                AppConstants.getAssetPath('store/onBoarding/Heading-1.png'),
            // "packages/wasly_template/assets/images/store/onBoarding/Heading-1.png",
            titleHighlightColor: AppColors.primaryBase,
            titleOriginalColor: AppColors.textPrimaryBase,
            titleStyle: CustomResponsiveTextStyles.headingH3,
            bodyStyle: CustomResponsiveTextStyles.paragraph3.copyWith(
              color: AppColors.textSecondaryBase,
            ),
            pageDecoration: pageDecoration),
        PageModel(
          title: 'Customer Reviews Matter!',
          bodyText:
              'Discover how customers appreciate your service! Genuine reviews highlight food quality, service, and overall value',
          imagePath:
              AppConstants.getAssetPath('store/onBoarding/Heading-2.png'),
          // "packages/wasly_template/assets/images/store/onBoarding/Heading-2.png",
          titleHighlightColor: AppColors.primaryBase,
          titleOriginalColor: AppColors.textPrimaryBase,
          titleStyle: CustomResponsiveTextStyles.headingH3,
          bodyStyle: CustomResponsiveTextStyles.paragraph3.copyWith(
            color: AppColors.textSecondaryBase,
          ),
          pageDecoration: pageDecoration,
        ),
      ],
    );
  }
}
