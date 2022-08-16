import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/pages/Chat/PageChat.dart';
import 'package:photo_view/photo_view.dart';

import 'package:furnitureapp/constans.dart';
import '../home/PageHomeUser.dart';
import 'package:furnitureapp/size_helpers.dart';

import 'package:furnitureapp/model/Product.dart';

class PageDetailProduct extends StatefulWidget {
  PageDetailProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<PageDetailProduct> createState() => _PageDetailProductState();
}

class _PageDetailProductState extends State<PageDetailProduct> {
  // late final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            size: displayWidth(context) * 0.065,
            color: kPrimaryColor,
          ),
        ),
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
                size: displayWidth(context) * 0.065,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(right: 5, left: 5),
        child: Column(
          children: [
            _productImage(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: displayWidth(context) * 0.05,
                ),
                Expanded(
                  child: Text(
                    'Tes',
                    style: TextStyle(
                      fontSize: displayWidth(context) * 0.05,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontFamily: fontType,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: displayWidth(context) * 0.04),
                  child: Container(
                    padding: EdgeInsets.all(displayWidth(context) * 0.009),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(displayWidth(context) * 0.03),
                          bottomLeft:
                              Radius.circular(displayWidth(context) * 0.01),
                          topRight:
                              Radius.circular(displayWidth(context) * 0.01),
                          bottomRight:
                              Radius.circular(displayWidth(context) * 0.03),
                        ),
                        color: kPrimaryColorTwo),
                    child: Text(
                      'Tes',
                      style: TextStyle(
                          fontSize: displayWidth(context) * 0.037,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Row(
            //       children: [
            //         SizedBox(
            //           width: displayWidth(context) * 0.05,
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

            Container(
              height: displayHeight(context) * 0.3,
              padding: EdgeInsets.only(left: 18, top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: _productDescription(),
            ),
            SizedBox(
              height: displayHeight(context) * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left: displayWidth(context) * 0.06),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: btnBuy(),
            ),
          ],
        ),
      ),
    );
  }

  _productImage() {
    return Stack(
      children: [
        Container(
          width: 500.0,
          height: displayWidth(context) * 0.8,
          child: PhotoView(
            backgroundDecoration: BoxDecoration(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _productDescription() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(
            '',
            style: TextStyle(
              fontSize: displayWidth(context) * 0.038,
              fontFamily: 'OpenSans',
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: displayHeight(context) * 0.09,
        ),
      ],
    );
  }

  Widget btnBuy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
              height: MediaQuery.of(context).size.height * 0.029,
              child: OutlinedButton(
                onPressed: () {},
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: displayWidth(context) * 0.04,
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.zero,
                  backgroundColor: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(
              width: displayWidth(context) * 0.03,
            ),
            Text(
              "1",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: displayWidth(context) * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: displayWidth(context) * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
              height: MediaQuery.of(context).size.height * 0.029,
              child: OutlinedButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: displayWidth(context) * 0.04,
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.zero,
                  backgroundColor: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: displayWidth(context) * 0.036),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.5,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "Beli",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: displayWidth(context) * 0.04,
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
    );
  }
}
