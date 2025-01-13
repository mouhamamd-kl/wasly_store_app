import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Back_Button extends StatelessWidget {
  final String photo;
  Back_Button({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: Color(0xfff8fafc),
            borderRadius: BorderRadius.circular(80),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('${photo}'),
            color: Colors.black,
            style: ButtonStyle(),
          ),
        );
  }
}
