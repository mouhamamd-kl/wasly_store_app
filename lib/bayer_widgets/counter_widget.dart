import 'package:flutter/material.dart';
import 'package:wasly_store/bayer_widgets/counter_button.dart';
import 'package:wasly_template/wasly_template.dart';

class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int itemsNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CounterButton(
          imagePath: AppConstants.getIconPath('minusSign.svg'),
          buttonColor: Colors.white,
          borderColor: AppColors.primaryBase,
          function: () {
            setState(() {
              if (itemsNumber > 0) {
                itemsNumber--;
              }
            });
          },
        ),
        Container(
          width: 40,
          alignment: Alignment.center,
          child: Text(
            itemsNumber.toString(),
            style: CustomResponsiveTextStyles.headingH8.copyWith(
              color: AppColors.textPrimaryBase,
            ),
          ),
        ),
        CounterButton(
          imagePath: AppConstants.getIconPath('plusSign.svg'),
          buttonColor: AppColors.primaryBase,
          borderColor: AppColors.primaryBase,
          function: () {
            setState(() {
              itemsNumber++;
            });
          },
        ),
      ],
    );
  }
}
