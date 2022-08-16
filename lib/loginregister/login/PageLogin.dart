import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:furnitureapp/admin/home/PageHomeAdmin.dart';
import 'package:furnitureapp/loginregister/register/PageRegister.dart';
import 'package:furnitureapp/user/bottomnavbar/BottomNavBar.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';
import 'package:flutter/services.dart';
import 'package:furnitureapp/user/home/PageHomeUser.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnitureapp/loginregister/widget/AlertDialog.dart';

// variabel untuk parsing
String username = '';
String level = '';
String password = '';
String notelp = '';
String dibuat = '';
String diperbarui = '';

// String status = '';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key, this.index, this.data}) : super(key: key);

  final List? data;
  final int? index;

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  // ======= HIDE/UNHIDE PASSWORD ========
  bool _hidePassword = true;
  void _viewPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }
  // ===================================

  final _formKey = GlobalKey<FormState>();

  String msg = '';
  late int index;

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Future login() async {
    var url = "https://furniture.fad.my.id/loginregister/login.php";

    final response = await http.post(
      Uri.parse(url),
      body: {
        "username": user.text,
        "password": pass.text,
      },
    );

    var dataUser = json.decode(response.body);

    if (dataUser.length == 0) {
      setState(() {
        tampil(); //
      });
    } else {
      if (dataUser[0]['level'] == 'admin') {
        AlertAdmin(
          context: context,
          username: username,
          password: password,
          notelp: notelp,
          dibuat: dibuat,
          diperbarui: diperbarui,
        ); //
        print(dataUser);
      } else if (dataUser[0]['level'] == 'user') {
        AlertUser(
          context: context,
          username: username,
          password: password,
          notelp: notelp,
          dibuat: dibuat,
          diperbarui: diperbarui,
        );
        print(dataUser);
      }

      setState(() {
        username = dataUser[0]['username'];
        password = dataUser[0]['password'];
        notelp = dataUser[0]['notelp'];
        dibuat = dataUser[0]['dibuat'];
        diperbarui = dataUser[0]['diperbarui'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height / 2,
                color: kPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    'assets/images/login.png',
                    alignment: Alignment.topCenter,
                    scale: 8,
                  ),
                ),
              ), // Gambar untuk Background aplikasi

              Padding(
                padding: EdgeInsets.only(top: 250.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff575861)),
                    ),
                  ),
                ),
              ), // Untuk page title
              Padding(
                padding: EdgeInsets.only(top: 300),
                child: Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: user,
                                    cursorColor: kPrimaryColor,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: kPrimaryColor,
                                      ),
                                      labelText: "Username",
                                      labelStyle: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: kPrimaryColor),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                    ),
                                    // onChanged: (value) =>
                                    //     setState(() => username = value),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Username Tidak Boleh Kosong";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    obscureText: _hidePassword,
                                    controller: pass,
                                    cursorColor: kPrimaryColor,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: kPrimaryColor,
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: _viewPassword,
                                        child: Icon(
                                          _hidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: kPrimaryColor),
                                      border: myinputborder(),
                                      enabledBorder: myinputborder(),
                                      focusedBorder: myfocusborder(),
                                    ),
                                    // onChanged: (value) =>
                                    //     setState(() => password = value),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Password Tidak Boleh Kosong";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: size.width * 0.999,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(90),
                                      child: ElevatedButton(
                                        child: Text(
                                          'MASUK',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'OpenSans',
                                              fontSize: 15),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            login();
                                            // debugPrint("login");
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: kPrimaryColor,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 20),
                                          textStyle: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Belum Punya Akun ??',
                                          style: const TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignUp(),
                                          ),
                                        ),
                                        child: Text(
                                          'Daftar',
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Opensans'),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(90)),
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2,
      ),
    );
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(90)),
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2,
      ),
    );
  }

  // untuk toast
  tampil() {
    Widget toast1 = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.red,
      ),
      child: Text(
        "Username atau Password salah",
        style: TextStyle(
          fontSize: displayWidth(context) * 0.037,
          // fontWeight: FontWeight.bold,
          fontFamily: fontType,
          color: Colors.white,
        ),
      ),
    );

    fToast.showToast(
      child: toast1,
      toastDuration: Duration(seconds: 3),
    );

    Widget toast2 = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Text(
        "Login Gagal !!!",
        style: TextStyle(
          fontSize: displayWidth(context) * 0.037,
          // fontWeight: FontWeight.bold,
          fontFamily: fontType,
          color: Colors.white,
        ),
      ),
    );

    fToast.showToast(
      child: toast2,
      toastDuration: Duration(seconds: 3),
    );
  }
}
