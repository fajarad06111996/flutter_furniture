import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/pages/CardCart.dart';

import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

class PageCart extends StatefulWidget {
  const PageCart({Key? key}) : super(key: key);

  @override
  State<PageCart> createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Keranjang",
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: fontType,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: displayHeight(context) * 2,
        padding: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: CardCart(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: displayWidth(context) * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: displayWidth(context) * 0.048,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        color: kPrimaryColor),
                  ),
                  Text(
                    "Rp. 1.000.000",
                    style: TextStyle(
                        fontSize: displayWidth(context) * 0.048,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        color: kPrimaryColor),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(1),
                child: SizedBox(
                  height: displayWidth(context) * 0.15,
                  width: displayWidth(context) * 0.99,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Bayar",
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      padding: EdgeInsets.zero,
                      backgroundColor: kPrimaryColor,
                      textStyle: TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontSize: displayWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
