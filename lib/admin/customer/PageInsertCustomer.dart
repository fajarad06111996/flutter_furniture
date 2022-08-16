import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/widget/alertInput.dart';
import 'package:furnitureapp/loginregister/login/PageLogin.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

import 'package:furnitureapp/admin/widget/inputText.dart';
import 'package:furnitureapp/admin/widget/button.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PageInsertCustomer extends StatefulWidget {
  const PageInsertCustomer({
    Key? key,
  }) : super(key: key);

  @override
  State<PageInsertCustomer> createState() => _PageInsertCustomerState();
}

class _PageInsertCustomerState extends State<PageInsertCustomer> {
  final List item = [
    "aktif",
    "tidak aktif",
  ];
  String? selectedValue;

  // ==== PASSWORD ======
  bool _hidePassword = true;
  void _viewPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }
  // =====================

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController notelp = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future insertCustomer() async {
    var url = Uri.parse("https://furniture.fad.my.id/user/tambah.php");
    var response = await http.post(url, body: {
      'username': username.text,
      'password': password.text,
      'notelp': notelp.text,
      'status': selectedValue.toString()
    });

    // ambil response dari file php di conver ke json,decode
    var insertCustomer = json.decode(response.body);

    if (insertCustomer['status'] == "failed") {
      AlertInputFailed(context);
      print("Gagal Input Data");
    } else {
      AlertInputSuccess(context);
      print("Input Data Berhasil");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: SizedBox(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Center(
                  child: Container(
                    width: displayWidth(context) * 0.9,
                    padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.05,
                      right: displayWidth(context) * 0.05,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Tambah Pelanggan",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: displayWidth(context) * 0.06,
                              fontFamily: fontType,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.02,
                          ),
                          inputText(
                            context: context,
                            controller: username,
                            label: 'Username',
                            keyboardType: TextInputType.multiline,
                          ),
                          inputText(
                            context: context,
                            controller: password,
                            keyboardType: TextInputType.multiline,
                            label: 'Password',
                          ),
                          inputText(
                              context: context,
                              controller: notelp,
                              label: 'Nomor Telepon',
                              keyboardType: TextInputType.phone),
                          SizedBox(height: displayWidth(context) * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: displayWidth(context) * 0.037,
                                ),
                              ),
                              DropdownButton(
                                value: selectedValue,
                                items: item
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  displayWidth(context) * 0.035,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buttonInput(
                                  context: context,
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  label: 'Batal',
                                  color: Colors.red),
                              buttonInput(
                                context: context,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    insertCustomer();
                                  }
                                },
                                label: 'Simpan',
                                color: kPrimaryColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
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
