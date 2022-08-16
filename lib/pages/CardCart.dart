import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:flutter/cupertino.dart';

class CardCart extends StatefulWidget {
  const CardCart({Key? key}) : super(key: key);

  @override
  State<CardCart> createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        cardCart(),
      ],
    );
  }

  Widget cardCart() {
    return Container(
      height: displayHeight(context) * 0.12,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            height: displayHeight(context) * 0.1,
            width: displayWidth(context) * 0.4,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1.jpg'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Meja",
                  style: TextStyle(
                      fontSize: displayWidth(context) * 0.04,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: kPrimaryColor),
                ),
                Text(
                  "Rp. 700.000",
                  style: TextStyle(
                      fontSize: displayWidth(context) * 0.03,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: kPrimaryColor),
                ),
                // Text(
                //   "Stok 1",
                //   style: TextStyle(
                //       fontSize: displayWidth(context) * 0.03,
                //       fontWeight: FontWeight.bold,
                //       fontFamily: 'OpenSans',
                //       color: kPrimaryColor),
                // ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: displayWidth(context) * 0.12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: displayWidth(context) * 0.05,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      height: displayWidth(context) * 0.06,
                      width: displayWidth(context) * 0.06,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Icon(
                          CupertinoIcons.minus,
                          size: displayWidth(context) * 0.025,
                          color: kPrimaryColor,
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: displayWidth(context) * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      height: displayWidth(context) * 0.06,
                      width: displayWidth(context) * 0.06,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Icon(
                          CupertinoIcons.plus,
                          size: displayWidth(context) * 0.025,
                          color: kPrimaryColor,
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
