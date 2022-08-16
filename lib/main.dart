import 'package:flutter/material.dart';
import 'package:furnitureapp/admin/customer/PageCustomer.dart';
import 'package:furnitureapp/admin/home/PageHomeAdmin.dart';
import 'package:furnitureapp/admin/product/PageDetailProduct.dart';
import 'package:furnitureapp/admin/product/PageProduct.dart';
import 'package:furnitureapp/admin/producttype/PageProductType.dart';
import 'package:furnitureapp/loginregister/login/PageLogin.dart';
import 'package:furnitureapp/user/bottomnavbar/BottomNavBar.dart';
import 'package:furnitureapp/splash/PageSplash.dart';
import 'package:furnitureapp/user/cart/PageCart.dart';
import 'package:furnitureapp/user/detailproduct/PageDetail.dart';
import 'package:furnitureapp/user/home/PageHomeUser.dart';
import 'package:furnitureapp/user/profile/PageEditProfile.dart';
import 'package:furnitureapp/user/profile/PageProfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PageHomeAdmin(username: username, level: level),
      // home: PageProduct(),
      // home: PageProductType(),
      // home: PageCart(),
      // home: PageProfile(),
      home: BottomNavBarUser(username: username),
      // home: PageCustomer(),
      // routes: <String, WidgetBuilder>{
      //   '/PageHomeAdmin': (BuildContext context) => new PageHomeAdmin(
      //         username: username,
      //         level: level,
      //       ),
      //   '/PageHomeUser': (BuildContext context) => new PageHomeUser(
      //         username: username,
      //         // password: password,
      //         // notelp: notelp,
      //         // dibuat: dibuat,
      //         // diperbarui: diperbarui,
      //       ),
      //   '/NavBarUser': (BuildContext context) => new BottomNavBarUser(),
      //   '/': (BuildContext context) => new PageSplash(),
      // },
    );
  }
}
