import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/loginregister/login/PageLogin.dart';
import 'package:furnitureapp/pages/Chat/PageChat.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furnitureapp/user/detailproduct/PageDetail.dart';

import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/widgets/WidgetSearch.dart';
import 'package:furnitureapp/widgets/WidgetSortButton.dart';
import 'package:furnitureapp/model/Product.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/user/widgets/AlertLogOut.dart';

class PageHomeUser extends StatefulWidget {
  const PageHomeUser({
    Key? key,
    this.username,
  }) : super(key: key);

  // final String username;
  // final String level;

  final String? username;

  @override
  State<PageHomeUser> createState() => _PageHomeUserState();
}

class _PageHomeUserState extends State<PageHomeUser> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  List<Product> _product = [
    Product(
      title: 'Kursi + Meja',
      price: '900.000',
      image: '1.jpg',
      desc:
          'Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki',
      stok: '12',
    ),
    Product(
      title: 'Meja',
      price: '700.000',
      image: '2.jpg',
      desc:
          'Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki',
      stok: '6',
    ),
    Product(
      title: 'Meja',
      price: '800.000',
      image: '4.jpg',
      desc:
          'Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki',
      stok: '9',
    ),
    Product(
      title: 'Meja',
      price: '900.000',
      image: '5.jpg',
      desc:
          'Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki',
      stok: '5',
    ),
    Product(
      title: 'Meja',
      price: '1.000.000',
      image: '6.jpg',
      desc:
          'Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki',
      stok: '7',
    ),
    Product(
      title: 'Rak Meja',
      price: '700.000',
      image: '7.jpg',
      desc:
          'Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki, Ini adalah meja dengan empat kaki',
      stok: '8',
    ),
  ];

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  category(context, title: "Semua"),
                  category(context, title: "Meja"),
                  category(context, title: "Kursi"),
                  category(context, title: "Lemari"),
                  category(context, title: "lain-lain", isActivated: true),
                ],
              ),
            ),
            SizedBox(
              height: displayHeight(context) * 0.02,
            ),
            Expanded(
              child: MasonryGridView.count(
                // physics: BouncingScrollPhysics(),
                crossAxisCount: 1,
                mainAxisSpacing: 19,
                crossAxisSpacing: 6,
                itemCount: _product.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PageDetail(
                              product: _product[index],
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        child: productItem(
                          title: _product[index].title,
                          image: _product[index].image,
                          price: _product[index].price,
                          stok: _product[index].stok,
                          // isFavorited: Random().nextBool(),
                        ),
                      ));
                },
              ),
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

  productItem({String? title, image, price, bool? isFavorited, String? stok}) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kPrimaryLightColor,
            offset: Offset.zero,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/$image',
                      width: 900,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: kPrimaryColorTwo),
                  child: Text(
                    'Stok  $stok',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: displayWidth(context) * 0.030,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.037,
                  fontFamily: fontType,
                ),
              ),
              Text(
                '\Rp. $price',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.033,
                  fontFamily: fontType,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
