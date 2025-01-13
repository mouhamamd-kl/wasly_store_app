import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasly_store/owis_widgets/custom_switch.dart';

import 'package:wasly_store/owis_widgets/expasion_title.dart';

class OwisMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child:
              // Back_Button(
              //   photo: 'assets/icons/Stroke.svg',
              // ),
              //CustomSwitch(),

              //OrderRequestCard(),
              ExpasionTitle(
            adress: "How i get copun code? ",
            text:
                'When you start and order you can cancel it by clicking the logo on home page. You can find cancel button there',
          ),
        ),
      ),
    );
  }
}
 //customIcon ? SvgPicture.asset('${widget.photo}') : SvgPicture.asset('${widget.photo}')