import 'package:flutter/cupertino.dart';

class CustomSwitch extends StatefulWidget {
  CustomSwitch({super.key});
  void bool = false;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        thumbColor: Color(0xfff5f2fb),
        activeColor: Color(0xff7b4cdf),
        value: isSwitch,
        onChanged: (bool value) {
          setState(() {
            isSwitch = value;
          });
        });
  }
}
