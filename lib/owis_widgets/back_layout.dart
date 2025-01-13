import 'package:flutter/material.dart';
import 'package:wasly_store/owis_widgets/back_button.dart';

class BackLayout extends StatelessWidget {
  const BackLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Back_Button(
        photo: 'assets/icons/Menu (2).svg',
      ),
    ));
  }
}
