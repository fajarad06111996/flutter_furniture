import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/loginregister/login/PageLogin.dart';
import 'package:furnitureapp/user/profile/PageEditProfile.dart';
import 'package:furnitureapp/user/widgets/textFormField.dart';

import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:core';

class PageProfile extends StatefulWidget {
  @override
  PageProfile({
    Key? key,
    this.username,
    this.password,
    this.notelp,
    this.dibuat,
    this.diperbarui,
  }) : super(key: key);

  final String? username;
  final String? password;
  final String? notelp;
  final String? dibuat;
  final String? diperbarui;

  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  TextEditingController usernameText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController notelpText = TextEditingController();
  TextEditingController dibuatText = TextEditingController();
  TextEditingController diperbaruiText = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      usernameText.text = username;
      passwordText.text = password;
      notelpText.text = notelp;
      dibuatText.text = dibuat;
      diperbaruiText.text = diperbarui;
    });
  }

  @override
  Widget build(BuildContext context) {
    var index;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Pengguna",
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: GestureDetector(
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    imageAvatar(context),
                  ],
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.01,
              ),
              inputText(
                context: context,
                label: 'Username',
                readOnly: true,
                controller: usernameText,
              ),
              SizedBox(
                height: displayHeight(context) * 0.01,
              ),
              inputText(
                context: context,
                label: 'Password',
                readOnly: true,
                controller: passwordText,
              ),
              SizedBox(
                height: displayHeight(context) * 0.01,
              ),
              inputText(
                context: context,
                label: 'Nomor Telepon',
                readOnly: true,
                controller: notelpText,
              ),
              SizedBox(
                height: displayHeight(context) * 0.01,
              ),
              inputText(
                context: context,
                label: 'Dibuat',
                readOnly: true,
                controller: dibuatText,
              ),
              SizedBox(
                height: displayHeight(context) * 0.01,
              ),
              inputText(
                context: context,
                label: 'Diperbarui',
                readOnly: true,
                controller: diperbaruiText,
              ),
              SizedBox(
                height: displayHeight(context) * 0.04,
              ),
              btnEditProfile(
                context,
                'Ubah',
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageEditProfile()));
                  print("Klik");
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  imageAvatar(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.3,
      height: displayHeight(context) * 0.19,
      decoration: BoxDecoration(
        border: Border.all(
          width: displayWidth(context) * 0.01,
          color: kPrimaryColor,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/user.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  btnEditProfile(
    BuildContext context,
    String? text,
    VoidCallback? onPressed,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: displayWidth(context) * 0.6),
      child: SizedBox(
        height: displayWidth(context) * 0.13,
        width: displayWidth(context) * 0.07,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: displayWidth(context) * 0.035,
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
                letterSpacing: 1,
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
          ),
        ),
      ),
    );
  }
}
