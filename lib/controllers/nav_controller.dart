import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wasly_store/screens/balance/balance_screen.dart';
import 'package:wasly_store/screens/foodlist/food_list_screen.dart';
import 'package:wasly_store/screens/home_store_screen.dart';
import 'package:wasly_store/screens/profile/edit_profile_screen.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [
    HomeStoreScreen(),
    BalanceScreen(),
    FoodListScreen(),
    EditProfileScreen(),
  ];

  void updateIndex(int index) {
    if (selectedIndex != index) {
      selectedIndex.value = index;
      StatefulWidget screen = pages[index];
      Get.offAll(
        () => screen,
      );
    }
  }
}
