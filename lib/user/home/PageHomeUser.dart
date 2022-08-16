import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/loginregister/login/PageLogin.dart';
import 'package:furnitureapp/pages/Chat/PageChat.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furnitureapp/user/detailproduct/PageDetailProduct.dart';

import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/widgets/WidgetSearch.dart';
import 'package:furnitureapp/widgets/WidgetSortButton.dart';
import 'package:furnitureapp/model/Product.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/user/widgets/AlertLogOut.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:core';

class PageHomeUser extends StatefulWidget {
  const PageHomeUser({
    Key? key,
    required this.username,
  }) : super(key: key);

  // final String username;
  // final String level;

  final String username;

  @override
  State<PageHomeUser> createState() => _PageHomeUserState();
}

class _PageHomeUserState extends State<PageHomeUser> {
  // ======= TAMPIL DATA JENIS BARANG =============
  List dataJenis = [];

  Future getDataJenis() async {
    var url = Uri.parse("https://furniture.fad.my.id/jenisbarang/tampil.php");
    var response = await http.get(url);

    // setState(() {
    //   data = json.decode(response.body);
    // });
    if (mounted) {
      setState(() {
        dataJenis = json.decode(response.body);
      });
    }

    return "Success!";
  }
  // ===================================

  // ======= TAMPIL DATA BARANG =============
  List dataBarang = [];

  Future getDataBarang() async {
    var url = Uri.parse("https://furniture.fad.my.id/barang/tampil.php");
    var response = await http.get(url);

    // setState(() {
    //   data = json.decode(response.body);
    // });
    if (mounted) {
      setState(() {
        dataBarang = json.decode(response.body);
      });
    }

    return "Success!";
  }
  // ===================================

  // Untuk Load Data secara otomatis
  @override
  void initState() {
    super.initState();
    getDataBarang();
    getDataJenis();
  }

  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hai, $username",
          style: TextStyle(
            fontSize: displayWidth(context) * 0.04,
            fontWeight: FontWeight.bold,
            fontFamily: fontType,
            color: kPrimaryColor,
          ),
        ),
        // centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: displayWidth(context) * 0.03),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageChat(),
                  ),
                );
              },
              child: Icon(
                Icons.chat_outlined,
                size: displayWidth(context) * 0.07,
                color: kPrimaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
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
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: displayWidth(context) * 0.075,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontFamily: fontType,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 13),
              child: Row(
                children: [
                  WidgetSearch(), //=== include
                  WidgetSortButton(), //=== include
                ],
              ),
            ),
            Text(
              "Kategori",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: displayWidth(context) * 0.045,
                fontFamily: fontType,
              ),
            ),
            SizedBox(
              height: displayHeight(context) * 0.01,
            ),
            Container(
              // color: Colors.amber,
              height: displayWidth(context) * 0.11,
              child: FutureBuilder(
                  future: getDataJenis(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataJenis.length,
                            itemBuilder: (context, int index) {
                              return Container(
                                padding: EdgeInsets.all(1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Container(
                                          height: displayWidth(context) * 0.07,
                                          width: displayWidth(context) * 0.17,
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${dataJenis[index]['namajenis']}'
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                letterSpacing: 1,
                                                color: Colors.white,
                                                // fontWeight: FontWeight.bold,
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.027,
                                                fontFamily: fontType,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center();
                  }),
            ),
            Divider(),
            SizedBox(
              height: displayHeight(context) * 0.01,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getDataBarang(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: dataBarang.length,
                            itemBuilder: (context, int index) {
                              return Card(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PageDetailProduct()));
                                    print("Klik Barang");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Stack(
                                              children: [
                                                Center(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(7)),
                                                    child: Image.network(
                                                        "https://furniture.fad.my.id/gambarbarang/${dataBarang[index]['gambar']}",
                                                        width: displayWidth(
                                                                context) *
                                                            0.9,
                                                        height: displayWidth(
                                                                context) *
                                                            0.4,
                                                        fit: BoxFit.fill),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: Colors.red),
                                                child: Text(
                                                  'Stok : ${dataBarang[index]['stok']}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.03,
                                                      fontFamily: fontType,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: displayHeight(context) * 0.01,
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${dataBarang[index]['namabarang']}'
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.03,
                                                fontFamily: fontType,
                                              ),
                                            ),
                                            Text(
                                              '\Rp.  ${dataBarang[index]['harga']}',
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.039,
                                                fontFamily: fontType,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Loading Data',
                                style: TextStyle(
                                    fontSize: displayWidth(context) * 0.035,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                              ),
                            ],
                          ));
                  }),
            ),
            SizedBox(
              height: displayHeight(context) * 0.03,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBarUser(),
    );
  }

  category(
    BuildContext context, {
    String? title,
    bool isActivated = false,
  }) {
    return Container(
      padding: EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: isActivated ? kPrimaryColor : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: displayWidth(context) * 0.037,
              fontFamily: fontType,
            ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(0, displayHeight(context) * 0.005, 0, 0),
            height: displayHeight(context) * 0.003,
            width: displayWidth(context) * 0.19,
            decoration: isActivated
                ? BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(90),
                  )
                : BoxDecoration(),
          ),
        ],
      ),
    );
  }
}
