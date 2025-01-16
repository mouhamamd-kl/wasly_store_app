import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you're using GetX

class StoreNavigationBar extends StatelessWidget {
  final RxInt selectedIndex;
  final ValueChanged<int> onTap;

  StoreNavigationBar({
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex.value,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Balance'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'Food List'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
