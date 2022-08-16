import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

import 'package:furnitureapp/constans.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  bool _hidePassword = true;

  String email = "";
  String username = "";
  String noTelp = "";
  String pass = "";

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
                    padding: EdgeInsets.only(top: 10.0),
                    child: Image.asset(
                      'assets/images/register.png',
                      alignment: Alignment.topCenter,
                      scale: 8,
                    ),
                  ),
                ), // Gambar untuk Background aplikasi
                iconBackButton(context),
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
                        'DAFTAR AKUN BARU',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                        // Text('Login'),
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
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      // controller: ,
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
                                        }
                                        if (value.length < 6) {
                                          return "Username Minimal 6 Karakter";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      // controller: ,
                                      keyboardType: TextInputType.number,
                                      cursorColor: kPrimaryColor,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: kPrimaryColor,
                                        ),
                                        labelText: "Nomor Telepon",
                                        labelStyle: TextStyle(
                                            fontFamily: 'OpenSans',
                                            color: kPrimaryColor),
                                        border: myinputborder(),
                                        enabledBorder: myinputborder(),
                                        focusedBorder: myfocusborder(),
                                      ),
                                      // onChanged: (value) =>
                                      //     setState(() => noTelp = value),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Nomor Telepon Tidak Boleh Kosong";
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
                                      //     setState(() => pass = value),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password Tidak Boleh Kosong";
                                        }
                                        if (value.length < 6) {
                                          return "Password Kurang Dari 6 Karakter";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: size.width * 0.9,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: ElevatedButton(
                                          child: Text(
                                            'DAFTAR',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              print("Sukses");
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
                                                  fontFamily: 'OpenSans')),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
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
          ),
        ),
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
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(90)),
        borderSide: BorderSide(
          color: kPrimaryColor,
          width: 2,
        ));
  }

  iconBackButton(BuildContext context) {
    return IconButton(
      color: Colors.white,
      iconSize: 28,
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  void _viewPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }
}
