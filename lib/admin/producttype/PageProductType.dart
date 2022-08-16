import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/product/PageInsertProduct.dart';
import 'package:furnitureapp/admin/producttype/PageEditProductType.dart';
import 'package:furnitureapp/admin/producttype/PageInsertProductType.dart';
import 'package:furnitureapp/admin/widget/fab.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/admin/product/widget/AlertDeleteProduct.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:core';

class PageProductType extends StatefulWidget {
  PageProductType({Key? key, this.index, this.data}) : super(key: key);

  final List? data;
  final int? index;

  @override
  State<PageProductType> createState() => _PageProductTypeState();
}

class _PageProductTypeState extends State<PageProductType> {
  // ============= SEARCH DATA ===============
  // List searchList = [];

  // Future showAllSearch() async {
  //   var url = Uri.parse("https://furniture.fad.my.id/jenisbarang_tampil.php");
  //   var response = await http.get(url);

  //   setState(() {
  //     if (response.statusCode == 200) {
  //       var jsonData = json.decode(response.body);
  //       for (var i = 0; i < jsonData.length; i++) {
  //         searchList.add(jsonData[i]['nama']);
  //       }
  //       print(searchList);
  //       // return jsonData;
  //     }
  //   });
  // }

  List searchList = [];

  Future showAllSearch() async {
    var url = Uri.parse("https://furniture.fad.my.id/jenisbarang/tampil.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var i = 0; i < jsonData.length; i++) {
        searchList.add(jsonData[i]['namajenis']);
      }
      print(searchList);
      // return jsonData;
    }
  }

  // ============== TAMPIL DATA ===============
  List data = [];

  Future showData() async {
    var url = Uri.parse("https://furniture.fad.my.id/jenisbarang/tampil.php");
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
  // =========================================

  // ================= HAPUS DATA =================
  void deleteData(int index) async {
    var url = Uri.parse("https://furniture.fad.my.id/jenisbarang/hapus.php");
    http.post(
      url,
      body: {
        'id_jenis': data[index]['id_jenis'],
      },
    );
  }

  void confirm(int index) {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        "Hapus Data : ${data[index]['namajenis']} ??",
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
            borderRadius: BorderRadius.circular(20.0),
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
            borderRadius: BorderRadius.circular(20.0),
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
  // ==============================================

  @override
  void initState() {
    super.initState();
    showAllSearch();
    showData();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Jenis Barang",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: displayWidth(context) * 0.06,
            fontFamily: fontType,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
            padding: EdgeInsets.only(right: displayWidth(context) * 0.06),
            child: GestureDetector(
              onTap: (() {
                showSearch(
                    context: context,
                    delegate: searchData(
                      list: searchList,
                      hintText: 'Ketik Nama',
                    ));
              }),
              child: Icon(
                Icons.search,
                size: displayWidth(context) * 0.065,
                color: kPrimaryColor,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(
              left: displayWidth(context) * 0.04,
              right: displayWidth(context) * 0.04,
            ),
            child: FutureBuilder(
              future: showData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (() {
                              DetailProType(
                                  context: context,
                                  namajenis: data[index]['namajenis'],
                                  deskripsi: data[index]['deskripsi'],
                                  dibuat: data[index]['dibuat'],
                                  diperbarui: data[index]['diperbarui']);
                              print("Klik Detail");
                            }),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  data[index]['namajenis'],
                                  style: TextStyle(
                                      fontSize: displayWidth(context) * 0.06,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                      color: kPrimaryColor),
                                ),
                                subtitle: Text(
                                  overflow: TextOverflow.ellipsis,
                                  '${data[index]["deskripsi"]}',
                                  style: TextStyle(
                                      fontSize: displayWidth(context) * 0.035,
                                      fontFamily: 'OpenSans',
                                      color: kPrimaryColor),
                                ),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PageEditProductType(
                                                data: data,
                                                index: index,
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        child: Tooltip(
                                          message: 'Ubah',
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                            size: displayWidth(context) * 0.05,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => confirm(index),
                                      child: Container(
                                        child: Tooltip(
                                          message: 'Hapus',
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: displayWidth(context) * 0.05,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        // itemCount: g,
                      )
                    : Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
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
        ],
      ),
      floatingActionButton: fabInsert(
        context: context,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (index) => PageInsertProductType(),
            ),
          );
        },
        tooltip: 'Tambah Jenis Produk',
      ),
    );
  }

  DetailProType(
      {required BuildContext context,
      String? namajenis,
      deskripsi,
      dibuat,
      diperbarui}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)), //this right here
          child: Container(
            height: displayHeight(context) * 0.29,
            width: displayWidth(context) * 0.01,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Detail Jenis Barang",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jenis Barang",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 11,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        namajenis!,
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 11,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          deskripsi,
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 11,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dibuat',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 11,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        dibuat,
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Diperbarui',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 11,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        diperbarui,
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 1,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  // detailBarisText(
                  //     context: context, text1: "Diperbarui", text2: diperbarui),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class searchData extends SearchDelegate<String> {
  String? hintText;
  List? list;
  searchData({required this.list, this.hintText});

  @override
  String? get searchFieldLabel => hintText;

  Future showSearch() async {
    var url = Uri.parse("https://furniture.fad.my.id/jenisbarang/cari.php");
    var response = await http.post(url, body: {'namajenis': query});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData!;
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      Padding(
        padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
        child: GestureDetector(
          onTap: () {
            query = "";
            showSuggestions(context);
          },
          child: Icon(
            Icons.close,
            size: displayWidth(context) * 0.065,
            color: kPrimaryColor,
          ),
        ),
      ),
      // Padding(
      //   padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
      //   child: GestureDetector(
      //     onTap: () {
      //       showAllSearch();
      //       print('Refresh Page');
      //     },
      //     child: Icon(
      //       Icons.refresh,
      //       size: displayWidth(context) * 0.065,
      //       color: kPrimaryColor,
      //     ),
      //   ),
      // )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return GestureDetector(
      onTap: () {
        // close(context, null);
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: displayWidth(context) * 0.06,
        color: kPrimaryColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(
      future: showSearch(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var list = snapshot.data[index];
              return ListTile(
                  title: Column(
                children: [
                  barisData(
                      context: context,
                      data1: 'Jenis Barang',
                      spasi: ':',
                      data2: list['namajenis']),
                  barisData(
                      context: context,
                      data1: 'Keterangan',
                      spasi: ':',
                      data2: list['deskripsi']),
                  Divider(),
                  barisData(
                      context: context,
                      data1: 'Dibuat',
                      spasi: ':',
                      data2: list['dibuat']),
                  Divider(),
                ],
              ));
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    var listData = query.isEmpty
        ? list
        : list?.where((element) => element.contains(query)).toList();
    return listData!.isEmpty
        ? Center(
            child: Text(
              "Nama Tidak Ditemukan",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: displayWidth(context) * 0.04,
                fontFamily: fontType,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  query = listData[index];
                  showResults(context);
                },
                title: Text(
                  listData[index],
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: displayWidth(context) * 0.04,
                    fontFamily: fontType,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
  }

  barisData(
      {required BuildContext context,
      String? data1,
      String? data2,
      String? spasi}) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 80,
            // color: Colors.amber,
            child: Row(
              children: [
                Text(
                  data1!,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: displayWidth(context) * 0.04,
                    fontFamily: fontType,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 10,
            child: Row(
              children: [
                Text(
                  spasi!,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: displayWidth(context) * 0.04,
                    fontFamily: fontType,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    data2!,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: displayWidth(context) * 0.04,
                      fontFamily: fontType,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
