import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

class PageDetailProduct extends StatefulWidget {
  const PageDetailProduct({Key? key}) : super(key: key);

  @override
  State<PageDetailProduct> createState() => _PageDetailProductState();
}

class _PageDetailProductState extends State<PageDetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Produk",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: displayWidth(context) * 0.06,
            fontFamily: fontType,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      ),
      body: Column(
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
                  'a',
                  style: TextStyle(
                    fontSize: displayWidth(context) * 0.05,
                    fontWeight: FontWeight.bold,
                    // color: kPrimaryColor,
                    fontFamily: fontType,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: displayWidth(context) * 0.05,
                  ),
                  Container(
                    padding: EdgeInsets.all(displayWidth(context) * 0.009),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(displayWidth(context) * 0.01),
                          bottomLeft:
                              Radius.circular(displayWidth(context) * 0.03),
                          topRight:
                              Radius.circular(displayWidth(context) * 0.03),
                          bottomRight:
                              Radius.circular(displayWidth(context) * 0.01),
                        ),
                        color: kPrimaryColorTwo),
                    child: Text(
                      ' \Stok',
                      style: TextStyle(
                          fontSize: displayWidth(context) * 0.037,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            height: displayHeight(context) * 0.3,
            padding: EdgeInsets.only(left: 18, top: 28),
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
    );
  }

  Widget _productImage() {
    return Stack(
      children: [
        Container(
          width: 500.0,
          height: displayWidth(context) * 0.7,
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
            'a',
            style: TextStyle(
              fontSize: displayWidth(context) * 0.04,
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
                fontSize: displayWidth(context) * 0.05,
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
