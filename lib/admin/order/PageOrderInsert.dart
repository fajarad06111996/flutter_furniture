import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

import 'package:furnitureapp/admin/widget/inputText.dart';
import 'package:furnitureapp/admin/widget/button.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PageOrderInsert extends StatefulWidget {
  const PageOrderInsert({
    Key? key,
  }) : super(key: key);

  @override
  State<PageOrderInsert> createState() => _PageOrderInsertState();
}

class _PageOrderInsertState extends State<PageOrderInsert> {
  int? index;
  // ============== DROPDOWN BARANG ===============
  List dataBarang = [];
  String? selectedValueBarang;

  Future getAllBarang() async {
    var url = Uri.parse("https://furniture.fad.my.id/barang/tampilall.php");
    var response = await http.get(url);
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      dataBarang = jsonData;
    });

    // print(jsonData);
  }
  // final List dataJenis = ["Aktif", "Tidak Aktif"];
  // =========================================

  // ============== DROPDOWN CUSTOMER ===============
  List dataCustomer = [];
  String? selectedValueCustomer;

  Future getAllCustomer() async {
    var url = Uri.parse("https://furniture.fad.my.id/user/tampil.php");
    var response = await http.get(url);
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      dataCustomer = jsonData;
    });

    // print(jsonData);
  }

  // final List dataJenis = ["Aktif", "Tidak Aktif"];
  // =========================================

  @override
  void initState() {
    super.initState();
    getAllCustomer();
    getAllBarang();
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
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      width: displayWidth(context) * 0.9,
                      padding: EdgeInsets.only(left: 17, right: 15, bottom: 9),
                      child: Form(
                        // key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Tambah Pesanan",
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Pilih Barang",
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: displayWidth(context) * 0.037,
                                  ),
                                ),
                                DropdownButton(
                                  value: selectedValueBarang,
                                  hint: Text(
                                    'Pilih Barang',
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: displayWidth(context) * 0.035,
                                    ),
                                  ),
                                  items: dataBarang
                                      .map(
                                        (data) => DropdownMenuItem(
                                          value: data['id_barang'].toString(),
                                          child: Text(
                                            data['namabarang'] +
                                                ' (Stok : ' +
                                                data['stok'] +
                                                ')',
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  displayWidth(context) * 0.035,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValueBarang = value as String;
                                    });
                                  },
                                ),
                                inputText(
                                    context: context, label: '', maxLines: 1
                                    // controller: deskripsi,
                                    ),
                              ],
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Pilih Customer",
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: displayWidth(context) * 0.037,
                                  ),
                                ),
                                DropdownButton(
                                  value: selectedValueCustomer,
                                  hint: Text(
                                    'Pilih Customer',
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: displayWidth(context) * 0.035,
                                    ),
                                  ),
                                  items: dataCustomer
                                      .map(
                                        (data) => DropdownMenuItem(
                                          value: data['id_user'].toString(),
                                          child: Text(
                                            data['username'],
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  displayWidth(context) * 0.035,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValueCustomer = value as String;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            inputText(
                                context: context,
                                label: 'Total Pembelian',
                                maxLines: 1
                                // controller: deskripsi,
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
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                                buttonInput(
                                    context: context,
                                    label: 'Tambah',
                                    color: kPrimaryColor,
                                    onPressed: () {
                                      // if (_formKey.currentState!.validate()) {
                                      //   insertJenisBarang();
                                      // }
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

class Employee {
  int? id;
  String? firstName;
  String? designation;
  int? salary;

  Employee({this.id, this.firstName, this.designation, this.salary});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: int.parse(json['id']),
        firstName: json['firstName'] as String,
        designation: json['designation'] as String,
        salary: int.parse(json['salary']));
  }
}
