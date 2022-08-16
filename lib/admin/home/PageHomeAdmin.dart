import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/chat/PageChatAdmin.dart';
import 'package:furnitureapp/admin/customer/PageCustomer.dart';
import 'package:furnitureapp/admin/order/PageOrder.dart';
import 'package:furnitureapp/admin/product/PageProduct.dart';
import 'package:furnitureapp/admin/producttype/PageProductType.dart';
import 'package:furnitureapp/admin/report/PageReport.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/loginregister/login/PageLogin.dart';
import 'package:furnitureapp/size_helpers.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PageHomeAdmin extends StatefulWidget {
  PageHomeAdmin({
    Key? key,
    required this.username,
    required this.level,
  }) : super(key: key);

  final String username;
  final String level;

  @override
  State<PageHomeAdmin> createState() => _PageHomeAdminState();
}

class _PageHomeAdminState extends State<PageHomeAdmin> {
  @override
  void initState() {
    super.initState();
    // showTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: displayWidth(context) * 0.03),
          child: Text(
            "Hai, $username",
            style: TextStyle(
              fontSize: displayWidth(context) * 0.045,
              fontWeight: FontWeight.bold,
              fontFamily: fontType,
              color: kPrimaryColor,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: displayWidth(context) * 0.04),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageChatAdmin(),
                  ),
                );
              },
              child: Icon(
                Icons.mark_unread_chat_alt,
                size: displayWidth(context) * 0.07,
                color: kPrimaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
            child: GestureDetector(
              onTap: () {
                alertLogOut(context: context);
              },
              child: Icon(
                Icons.logout,
                size: displayWidth(context) * 0.07,
                color: kPrimaryColor,
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
          //   child: GestureDetector(
          //     child: CircleAvatar(
          //       backgroundColor: kPrimaryColor,
          //       radius: displayWidth(context) * 0.03,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(50.0),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: displayWidth(context) * 0.04,
              left: displayWidth(context) * 0.23,
            ),
            child: Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: displayWidth(context) * 0.075,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontFamily: fontType,
                // shadows: [
                //   Shadow(
                //       offset: Offset(1, 20),
                //       blurRadius: 5,
                //       color: kPrimaryColor),
                // ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.07),
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(10),
                children: [
                  cardMenu(
                    context: context,
                    text: "Produk",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageProduct()));
                    },
                    image: 'assets/images/furniture.png',
                  ),
                  cardMenu(
                    context: context,
                    text: "Jenis Barang",
                    // text2: '${total.length}',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageProductType()));
                    },
                    image: 'assets/images/checklist.png',
                  ),
                  cardMenu(
                    context: context,
                    text: "Pelanggan",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageCustomer()));
                    },
                    image: 'assets/images/teamwork.png',
                  ),
                  cardMenu(
                    context: context,
                    text: "Pesanan",
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PageOrder()));
                    },
                    image: 'assets/images/checkout.png',
                  ),
                  cardMenu(
                    context: context,
                    text: "Lap. Penjualan",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageReport()));
                    },
                    image: 'assets/images/report.png',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void alertLogOut({
    required BuildContext context,
    String? pesan,
  }) {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        'Yakin Ingin Keluar ??',
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: displayWidth(context) * 0.047,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            "Batal",
            style: TextStyle(
              letterSpacing: 1,
              fontFamily: 'OpenSans',
              fontSize: displayWidth(context) * 0.037,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          color: Colors.red,
          onPressed: () {
            print('Batal');
            Navigator.pop(context);
          },
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            "Iya",
            style: TextStyle(
              letterSpacing: 1,
              fontFamily: 'OpenSans',
              fontSize: displayWidth(context) * 0.037,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          color: Colors.green,
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            print("Log Out");
          },
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  cardMenu({
    required BuildContext context,
    String? text,
    String? text2,
    GestureTapCallback? onTap,
    String? image,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        splashColor: kPrimaryColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Icon(
              //   widget.icon,
              //   size: displayWidth(context) * 0.17,
              //   color: kPrimaryColor,
              // ),
              Image.asset(
                '$image',
                height: displayWidth(context) * 0.23,
                width: displayWidth(context) * 0.21,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: displayHeight(context) * 0.01,
              ),
              Text(
                '$text',
                style: TextStyle(
                  fontSize: displayWidth(context) * 0.04,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontType,
                  color: kPrimaryColor,
                ),
              ),
              // Text(
              //   '$text2',
              //   style: TextStyle(
              //     fontSize: displayWidth(context) * 0.04,
              //     fontFamily: fontType,
              //     color: kPrimaryColor,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
