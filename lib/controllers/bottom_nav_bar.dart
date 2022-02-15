import 'package:cryptocurrency_app/ui/screens/bottom_nav/wallet_landscape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cryptocurrency_app/ui/screens/bottom_nav/wallet.dart';
import 'package:cryptocurrency_app/controllers/system_bar.dart';
import 'package:cryptocurrency_app/ui/screens/bottom_nav/dashboard.dart';
import 'package:cryptocurrency_app/ui/screens/bottom_nav/user.dart';

class BottomNavBar extends GetxController {
  int selectedIndex = 0;
  Widget screen = const Dashboard();
  final SystemBar s = Get.find();
  void onItemTapped(int index) {
    selectedIndex = index;
    switch (selectedIndex) {
      case 0:
        screen = const Dashboard();
        s.sistemBar(Colors.indigo, Brightness.light);
        break;
      case 1:
        if (Get.height > Get.width) {
          screen = const Wallet();
        } else {
          screen = const WalletLandscape();
        }
        s.sistemBar(Colors.transparent, Brightness.dark);
        break;
      case 2:
        if (Get.height > Get.width) {
          screen = const Wallet();
        } else {
          screen = const WalletLandscape();
        }
        s.sistemBar(Colors.transparent, Brightness.dark);
        break;

      default:
        {
          screen = const User();
          s.sistemBar(Colors.blue, Brightness.dark);
        }
    }
    update();
  }
}
