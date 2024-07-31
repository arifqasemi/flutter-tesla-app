import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constrian.dart';
import 'package:myapp/controllers/home.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/controllers/home.dart';

class BottomNavigation extends StatefulWidget {
   BottomNavigation({super.key,required this.controller,required this.onTap});
  final HomeController controller;

  final ValueChanged onTap;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap:widget.onTap,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: List.generate(
                navSr.length,
                (index) => BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      navSr[index],
                      // ignore: deprecated_member_use
                      color:widget.controller.selectedBottomTab == index ? primaryColor :Colors.red,
                      ),
                    label: ''),
              ),
            );
  }
}