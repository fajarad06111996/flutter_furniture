import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

import 'package:furnitureapp/admin/widget/inputText.dart';
import 'package:furnitureapp/admin/widget/button.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class PageEditProductType extends StatefulWidget {
  const PageEditProductType({
    Key? key,
    this.index,
    this.data,
  }) : super(key: key);

  final int? index;
  final List? data;

  @override
  State<PageEditProductType> createState() => _PageEditProductTypeState();
}

class _PageEditProductTypeState extends State<PageEditProductType> {
  late TextEditingController namajenis;
  late TextEditingController deskripsi;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    namajenis =
        TextEditingController(text: widget.data![widget.index!]['namajenis']);
    deskripsi =
        TextEditingController(text: widget.data![widget.index!]['deskripsi']);
    super.initState();
  }

  // ================ EDIT DATA ================== //

  Future editData() async {
    var url = Uri.parse("https://furniture.fad.my.id/jenisbarang/ubah.php");
    var response = await http.post(url, body: {
      'id_jenis': widget.data![widget.index!]['id_jenis'],
      'namajenis': namajenis.text,
      'deskripsi': deskripsi.text,
    });
    // print('Update Data Berhasil');
    var updateCustomer = json.decode(response.body);

    if (updateCustomer['status'] == 'failed') {
      AlertUpdateProductTypeFailed(context);
      print('Gagal Ubah Data');
    } else {
      AlertUpdateProductTypeSuccess(context);
      print('Berhasil Ubah Data');
    }
    ;
  }
  // ==============================================

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
                      padding: EdgeInsets.only(left: 17, right: 15, bottom: 9),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Ubah Jenis Barang",
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
                            SizedBox(height: 15),
                            inputText(
                              context: context,
                              label: 'Keterangan',
                              controller: deskripsi,
                              maxLines: 3,
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
                                    label: 'Simpan',
                                    color: kPrimaryColor,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        editData();
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

  AlertUpdateProductTypeSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(
          Duration(seconds: 3),
          () {
            Navigator.of(context).pop(true);
            Navigator.pop(context);
          },
        );
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check,
                    size: displayWidth(context) * 0.3,
                    color: kPrimaryColor,
                  ),
                  Text(
                    "UBAH DATA BERHASIL",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: displayWidth(context) * 0.07,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AlertUpdateProductTypeFailed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(
          Duration(seconds: 3),
          () {
            Navigator.of(context).pop(true);
            // Navigator.pushReplacementNamed(context, '/PageHomeAdmin');
          },
        );
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 90,
                    color: Colors.red,
                  ),
                  Text(
                    "GAGAL UBAH DATA",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Jenis Barang Sudah Digunakan",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 15,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
