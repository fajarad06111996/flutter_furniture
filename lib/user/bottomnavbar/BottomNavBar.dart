import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:furnitureapp/loginregister/login/PageLogin.dart';
import 'package:furnitureapp/user/cart/PageCart.dart';
import 'package:furnitureapp/pages/PageDetailOrder.dart';
import 'package:furnitureapp/user/home/PageHomeUser.dart';
import 'package:furnitureapp/user/profile/PageProfile.dart';
import 'package:furnitureapp/size_helpers.dart';

import 'dart:async';

import 'package:furnitureapp/constans.dart';

class BottomNavBarUser extends StatefulWidget {
  const BottomNavBarUser({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  State<BottomNavBarUser> createState() => _BottomNavBarUserState();
}

class _BottomNavBarUserState extends State<BottomNavBarUser> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    PageHomeUser(
      username: username,
    ),
    PageCart(),
    // PageDetailOrder(),
    PageProfile(
      username: username,
    ),
  ];

  @override
  final items = [
    Icon(
      Icons.home,
      size: 25,
    ),
    Icon(
      Icons.shopping_cart_rounded,
      size: 25,
    ),
    // Icon(
    //   Icons.card_travel_sharp,
    //   size: 25,
    // ),
    Icon(
      Icons.person,
      size: 25,
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.white,
          color: kPrimaryColor,
          index: index,
          items: items,
          height: 56,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
      body: screens[index], // ==
    );
  }
}
