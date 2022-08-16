import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/widget/alertInput.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

import 'package:furnitureapp/admin/widget/inputText.dart';
import 'package:furnitureapp/admin/widget/button.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PageInsertProductType extends StatefulWidget {
  const PageInsertProductType({Key? key}) : super(key: key);

  @override
  State<PageInsertProductType> createState() => _PageInsertProductTypeState();
}

class _PageInsertProductTypeState extends State<PageInsertProductType> {
  TextEditingController namajenis = new TextEditingController();
  TextEditingController deskripsi = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future insertJenisBarang() async {
    var url = Uri.parse("https://furniture.fad.my.id/jenisbarang/tambah.php");
    var response = await http.post(url, body: {
      'namajenis': namajenis.text,
      'deskripsi': deskripsi.text,
    });

    // ambil response dari file php di conver ke json,decode
    var insertProductType = json.decode(response.body);

    if (insertProductType['status'] == "failed") {
      AlertInputFailed(context);
      print("Gagal Input Data");
    } else {
      AlertInputSuccess(context);
      print("Input Data Berhasil");
      // Navigator.pop(context);
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
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      width: displayWidth(context) * 0.9,
                      padding: EdgeInsets.only(left: 17, right: 15, bottom: 9),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Tambah Jenis",
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
                              label: 'Jenis Barang',
                              controller: namajenis,
                              maxLines: 1,
                            ),
                            inputText(
                              context: context,
                              label: 'Keterangan',
                              maxLines: 3,
                              controller: deskripsi,
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
                                      if (_formKey.currentState!.validate()) {
                                        insertJenisBarang();
                                      }
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
