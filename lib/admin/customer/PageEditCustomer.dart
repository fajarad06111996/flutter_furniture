import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/customer/PageCustomer.dart';
import 'package:furnitureapp/admin/widget/alertUpdate.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

import 'package:furnitureapp/admin/widget/inputText.dart';
import 'package:furnitureapp/admin/widget/button.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PageEditCustomer extends StatefulWidget {
  const PageEditCustomer({
    Key? key,
    this.index,
    this.data,
  }) : super(key: key);

  final int? index;
  final List? data;

  @override
  State<PageEditCustomer> createState() => _PageEditCustomerState();
}

class _PageEditCustomerState extends State<PageEditCustomer> {
  String dropdownValue = 'Aktif';
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController notelp;
  late TextEditingController status;

  final _formkey = GlobalKey<FormState>();

  final List item = [
    "aktif",
    "tidak aktif",
  ];

  // ============== DROPDOWN User ===============
  List dataUser = [];
  String? selectedValue;

  Future getAllName() async {
    var url = Uri.parse("https://furniture.fad.my.id/user/tampil.php");
    var response = await http.get(url);
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      dataUser = jsonData;
    });

    // print(jsonData);
  }
  // =================================================

  // ================ EDIT DATA ================== //
  Future editData() async {
    var url = Uri.parse("https://furniture.fad.my.id/user/ubah.php");
    var response = await http.post(url, body: {
      'id_user': widget.data![widget.index!]['id_user'],
      'username': username.text,
      'password': password.text,
      'notelp': notelp.text,
      'status': selectedValue.toString(),
    });
    // print('Update Data Berhasil');
    var updateCustomer = json.decode(response.body);

    if (updateCustomer['status'] == 'failed') {
      AlertUpdateFailed(context);
      print('Gagal Ubah Data');
    } else {
      AlertUpdateSuccess(context);
      print('Berhasil Ubah Data');
    }
  }
  // =========================================================

  @override
  void initState() {
    username =
        TextEditingController(text: widget.data![widget.index!]['username']);
    password =
        TextEditingController(text: widget.data![widget.index!]['password']);
    notelp = TextEditingController(text: widget.data![widget.index!]['notelp']);
    // status = TextEditingController(text: widget.data![widget.index!]['status']);
    getAllName();
    super.initState();
  }

  // ============================================= //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      width: displayWidth(context) * 0.9,
                      padding: EdgeInsets.only(
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05,
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Text(
                              "Ubah Customer",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: displayWidth(context) * 0.06,
                                fontFamily: fontType,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            inputText(
                                context: context,
                                maxLines: 1,
                                label: 'Nama',
                                controller: username,
                                keyboardType: TextInputType.text),
                            inputText(
                                context: context,
                                maxLines: 1,
                                label: 'Password',
                                controller: password,
                                keyboardType: TextInputType.text),
                            inputText(
                                context: context,
                                maxLines: 1,
                                label: 'No. Telepon / Handphone',
                                controller: notelp,
                                keyboardType: TextInputType.phone),
                            // inputText(
                            //     context: context,
                            //     maxLines: 1,
                            //     label: 'Status',
                            //     controller: status,
                            //     keyboardType: TextInputType.phone),
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
                                    fontSize: displayWidth(context) * 0.031,
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  child: DropdownButton(
                                    value: selectedValue,
                                    hint: Text(
                                      widget.data![widget.index!]['status'],
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        color: kPrimaryColor,
                                        fontSize: displayWidth(context) * 0.035,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: item
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                color: kPrimaryColor,
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.035,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value as String;

                                        print(selectedValue);
                                      });
                                    },
                                  ),
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
                                    label: 'Batal',
                                    color: Colors.red,
                                    onPressed: () => Navigator.pop(context)),
                                buttonInput(
                                    context: context,
                                    label: 'Ubah',
                                    color: kPrimaryColor,
                                    onPressed: () {
                                      editData();
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
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
