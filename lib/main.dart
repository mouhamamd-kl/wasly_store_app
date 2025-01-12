import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasly_store/bayer_screens/store_details.dart';

void main() {
  runApp(BayerApp());
}

class BayerApp extends StatelessWidget {
  const BayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoreDetails(),
    );
  }
}
