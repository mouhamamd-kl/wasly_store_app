import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasly_template/wasly_template.dart';

List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      AppConstants.getCustomerBottomNavigationBarIcons("home.svg"),
    ),
    activeIcon: SvgPicture.asset(
      AppConstants.getCustomerBottomNavigationBarIcons("home_active.svg"),
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      AppConstants.getCustomerBottomNavigationBarIcons("favourite.svg"),
    ),
    activeIcon: SvgPicture.asset(
      AppConstants.getCustomerBottomNavigationBarIcons("favourite_active.svg"),
    ),
    label: 'Food List',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      AppConstants.getCustomerBottomNavigationBarIcons("order.svg"),
    ),
    activeIcon: SvgPicture.asset(
      AppConstants.getCustomerBottomNavigationBarIcons("order_active.svg"),
    ),
    label: 'Profile',
  ),
];
