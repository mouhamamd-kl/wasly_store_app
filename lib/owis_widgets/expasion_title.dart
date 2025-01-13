import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpasionTitle extends StatefulWidget {
  ExpasionTitle({
    super.key,
    required this.adress,
    required this.text,
  });
  final String adress;
  final String text;

  @override
  State<ExpasionTitle> createState() => _ExpasionTitleState();
}

class _ExpasionTitleState extends State<ExpasionTitle> {
  bool customIcon = false;
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Color(0xfff5f2fb),
          ),
        ),
        elevation: 4, // Optional: adds a shadow effect
        child: ExpansionTile(
          collapsedBackgroundColor: Color(0xfff5f2fb),
          backgroundColor: Color(0xfff5f2fb),
          title: Text('${widget.adress}'),
          trailing: IconButton(
            icon: customIcon
                ? SvgPicture.asset('assets/icons/Stroke 1.svg')
                : SvgPicture.asset('assets/icons/Stroke 2.svg'), onPressed: () {  },
          ),
          // onExpansionChanged: (bool expanded) {
          //   setState(() {
          //     _isExpanded = expanded;
          //     customIcon =
          //         !expanded; // Toggle customIcon based on expansion state
          //   });
         // },
          children: <Widget>[
            ListTile(
              title: Text('${widget.text}'),
            )
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => customIcon = expanded);
          },
        ),
      ),
    );
  }
}
