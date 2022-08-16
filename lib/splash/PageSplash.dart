import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/loginregister/login/PageLogin.dart';
import 'package:flutter/services.dart';
import 'package:furnitureapp/main.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({Key? key}) : super(key: key);

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  bool isConnected = false;
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen(
      (event) {
        setState(
          () {
            isConnected = (event != ConnectivityResult.none);
            splashScreen();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  void splashScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PageLogin(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: isConnected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cek Koneksi Internet",
                    style: TextStyle(
                        fontSize: displayWidth(context) * 0.04,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        color: kPrimaryColor),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tidak Ada Koneksi Jaringan",
                    style: TextStyle(
                      fontSize: displayWidth(context) * 0.04,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
