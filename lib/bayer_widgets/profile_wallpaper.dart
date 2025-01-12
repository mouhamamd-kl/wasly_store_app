// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProfileWallpaper extends StatelessWidget {
  String wallpaperImagePath;

  ProfileWallpaper({super.key, required this.wallpaperImagePath});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 250,
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(wallpaperImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.9, -0.5),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.9, -0.5),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
