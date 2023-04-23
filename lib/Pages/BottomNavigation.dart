import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testproject/Pages/Home.dart';
import 'package:testproject/Pages/Profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List pages = [Home(), Home(), Home(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0367FF),
        onTap: (i){
          setState(() {
            _selectedIndex = i;
            print(i);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Padding(padding: const EdgeInsets.only(top: 5),child: SvgPicture.asset('lib/images/bottomlogo.svg'),), label: ''),
          BottomNavigationBarItem(icon: Padding(padding: const EdgeInsets.only(bottom: 3),child: SvgPicture.asset('lib/images/bottomcategory.svg', color: _selectedIndex == 1 ? Color(0xFF0367FF) : Colors.black)), label: 'Category'),
          BottomNavigationBarItem(icon: Padding(padding: const EdgeInsets.only(bottom: 3),child: SvgPicture.asset('lib/images/bottombasket.svg', color: _selectedIndex == 2 ? Color(0xFF0367FF) : Colors.black)), label: 'Basket'),
          BottomNavigationBarItem(icon: Padding(padding: const EdgeInsets.only(bottom: 3),child: SvgPicture.asset('lib/images/bottomprofile.svg', color: _selectedIndex == 3 ? Color(0xFF0367FF) : Colors.black)), label: 'Profile'),
        ]
      ),
    );
  }
}