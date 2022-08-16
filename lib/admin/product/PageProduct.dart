import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/product/PageDetailProduct.dart';
import 'package:furnitureapp/admin/product/PageEditProduct.dart';
import 'package:furnitureapp/admin/product/PageInsertProduct.dart';
import 'package:furnitureapp/admin/product/widget/AlertDeleteProduct.dart';
import 'package:furnitureapp/admin/widget/button.dart';
import 'package:furnitureapp/admin/widget/fab.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:core';

class PageProduct extends StatefulWidget {
  const PageProduct({Key? key}) : super(key: key);

  @override
  State<PageProduct> createState() => _PageProductState();
}

class _PageProductState extends State<PageProduct> {
  String title = "AlertDialog";

  // ======= TAMPIL DATA =============
  List data = [];

  Future getData() async {
    var url = Uri.parse("https://furniture.fad.my.id/barang/tampil.php");
    var response = await http.get(url);

    // setState(() {
    //   data = json.decode(response.body);
    // });
    if (mounted) {
      setState(() {
        data = json.decode(response.body);
      });
    }

    return "Success!";
  }
  // ===================================

  // =============== DELETE DATA ==============
  Future deleteData(int index) async {
    var url = Uri.parse("https://furniture.fad.my.id/barang/hapus.php");
    http.post(url, body: {'id_barang': data[index]['id_barang']});
  }

  void confirm(int index) {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        'Hapus Data Barang : ' + data[index]['namabarang'],
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: displayWidth(context) * 0.047,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            "Batal",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: displayWidth(context) * 0.037,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          color: Colors.red,
          onPressed: () => Navigator.pop(context),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            "Iya",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: displayWidth(context) * 0.037,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          color: Colors.green,
          onPressed: () {
            deleteData(index);
            print("Berhasil Hapus Data");
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
  // =========================================

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Produk",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: displayWidth(context) * 0.06,
            fontFamily: fontType,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: displayWidth(context) * 0.02),
            child: GestureDetector(
              onTap: () {
                // showSearch(
                //     context: context,
                //     delegate: searchData(
                //       list: searchList,
                //       hintText: 'Ketik Nama',
                //     ));
              },
              child: Icon(
                Icons.search,
                size: displayWidth(context) * 0.065,
                color: kPrimaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: displayWidth(context) * 0.06),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (index) => PageInsertProduct(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                size: displayWidth(context) * 0.08,
                color: kPrimaryColor,
              ),
            ),
          )
        ],
      ),
      body: Container(
        // color: Colors.blue,
        padding: EdgeInsets.only(
          left: displayWidth(context) * 0.04,
          right: displayWidth(context) * 0.04,
        ),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        margin: EdgeInsets.all(7.0),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  print("klik");
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image.network(
                                      "https://furniture.fad.my.id/gambarbarang/${data[index]['gambar']}",
                                      // width: 300,
                                      height: 130,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              ListTile(
                                  title: Text(
                                    '${data[index]['namabarang']}'
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontSize: displayWidth(context) * 0.045,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                        color: kPrimaryColor),
                                  ),
                                  subtitle: Text(
                                    // 'Stok : ' + data[index]['stok'],
                                    'Kategori : ${data[index]['namajenis']}',
                                    style: TextStyle(
                                        fontSize: displayWidth(context) * 0.035,
                                        fontFamily: 'OpenSans',
                                        color: kPrimaryColor),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      buttonIcon(
                                          context: context,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PageEditProduct(
                                                          data: data,
                                                          index: index,
                                                        )));
                                            print('Ubah');
                                          },
                                          pesan: 'Ubah Data',
                                          color: Colors.blue,
                                          icon: Icons.edit),
                                      buttonIcon(
                                          context: context,
                                          onTap: () {
                                            confirm(index);
                                            print('Hapus');
                                          },
                                          pesan: 'Hapus',
                                          color: Colors.red,
                                          icon: Icons.delete),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Loading Data',
                        style: TextStyle(
                            fontSize: displayWidth(context) * 0.035,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      ),
                    ],
                  ));
          },
        ),
      ),
      // floatingActionButton: fabInsert(
      //   context: context,
      //   onPressed: () {},
      //   tooltip: 'Tambah Produk',
      // ),
    );
  }
}

class searchData extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
