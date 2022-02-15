import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../controllers/bottom_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBar>(
      builder: (_) {
        return Scaffold(
          body: _.screen,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.indigo,
            items: <BottomNavigationBarItem>[
              methodBottomNavigationBarItem(
                  _, 0, Icons.dashboard_outlined, 'Dashboard'),
              methodBottomNavigationBarItem(
                  _, 1, Icons.wallet_travel, 'Wallet'),
              methodBottomNavigationBarItem(
                  _, 2, Icons.bar_chart_sharp, 'Chart'),
              methodBottomNavigationBarItem(_, 3, Icons.person, 'User'),
            ],
            currentIndex: _.selectedIndex,
            onTap: _.onItemTapped,
          ),
        );
      },
    );
  }

  BottomNavigationBarItem methodBottomNavigationBarItem(
      BottomNavBar _, int _selectedIndex, IconData _icon, String _label) {
    return BottomNavigationBarItem(
      icon: Container(
          width: 30,
          height: 35,
          alignment: (_.selectedIndex == _selectedIndex)
              ? const Alignment(0, -1)
              : const Alignment(0, 1),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: (_.selectedIndex == _selectedIndex)
                    ? Colors.indigo
                    : Colors.transparent,
                width: 4.0,
              ),
              left: const BorderSide(
                color: Colors.transparent,
                width: 3.0,
              ),
              right: const BorderSide(
                color: Colors.transparent,
                width: 3.0,
              ),
            ),
          ),
          child: Icon(_icon)),
      label: _label,
    );
  }
}
