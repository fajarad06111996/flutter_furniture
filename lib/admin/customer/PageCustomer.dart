import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/customer/PageEditCustomer.dart';
import 'package:furnitureapp/admin/customer/PageInsertCustomer.dart';
import 'package:furnitureapp/admin/customer/widget/AlertDetailCustomer.dart';

import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';
// import 'package:furnitureapp/admin/customer/widget/AlertDeleteCustomer.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:core';

class PageCustomer extends StatefulWidget {
  const PageCustomer({Key? key}) : super(key: key);

  @override
  State<PageCustomer> createState() => _PageCustomerState();
}

class _PageCustomerState extends State<PageCustomer> {
  // ============= SEARCH DATA ===============
  List searchList = [];

  Future showAllSearch() async {
    var url = Uri.parse("https://furniture.fad.my.id/user/tampil.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var i = 0; i < jsonData.length; i++) {
        searchList.add(jsonData[i]['username']);
      }
      print(searchList);
      // return jsonData;
    }
  }

  // ======================================

  // ======= TAMPIL DATA =============
  List data = [];

  Future getData() async {
    var url = Uri.parse("https://furniture.fad.my.id/user/tampil.php");
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

  // ============= HAPUS DATA ============
  void deleteData(int index) async {
    var url = Uri.parse("https://furniture.fad.my.id/user/hapus.php");
    http.post(url, body: {'id_user': data[index]['id_user']});
  }

  void confirm(int index) {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        "Hapus Data dengan Username : ${data[index]['username']} ??",
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
  // ==================================

  Color getColor(int selector) {
    if (selector % 2 == 0) {
      return Colors.blue;
    } else {
      return Colors.blueGrey;
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    showAllSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Data Pelanggan",
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
            size: displayWidth(context) * 0.06,
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
      // body: new ListView.builder(
      //   itemCount: data == null ? 0 : data.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return new Card(
      //       child: new Text(data[index]["username"]),
      //     );
      //   },
      // ),
      body: Container(
        padding: EdgeInsets.only(
          left: displayWidth(context) * 0.04,
          right: displayWidth(context) * 0.04,
        ),
        width: 400,
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    // itemCount: bulan.length,
                    itemCount: data.length,
                    itemBuilder: (context, int index) {
                      // final i = data[index];
                      return GestureDetector(
                        onTap: () {
                          AlertDetailCustomer(
                            context: context,
                            username: data[index]['username'].toUpperCase(),
                            password: data[index]['password'],
                            level: data[index]['level'],
                            notelp: data[index]['notelp'],
                            status: data[index]['status'],
                            dibuat: data[index]['dibuat'],
                            diperbarui: data[index]['diperbarui'],
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: getColor(index),
                                    child: Text(
                                      data[index]['username'][0].toUpperCase(),
                                      // list[index][0], // ambil karakter pertama text
                                      style: TextStyle(
                                          fontSize:
                                              displayWidth(context) * 0.04,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                          color: Colors.white),
                                    ),
                                  ),
                                  title: Text(
                                    '${data[index]["username"]}'.toLowerCase(),
                                    style: TextStyle(
                                        fontSize: displayWidth(context) * 0.05,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                        color: kPrimaryColor),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Telp. ' + data[index]["notelp"],
                                        style: TextStyle(
                                            fontSize:
                                                displayWidth(context) * 0.035,
                                            fontFamily: 'OpenSans',
                                            color: kPrimaryColor),
                                      ),
                                    ],
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
                                                  PageEditCustomer(
                                                data: data,
                                                index: index,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          child: Tooltip(
                                            message: 'Ubah',
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                              size:
                                                  displayWidth(context) * 0.05,
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
                                              size:
                                                  displayWidth(context) * 0.05,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
      floatingActionButton: buttonInsert(),
    );
  }

  Widget buttonInsert() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageInsertCustomer(),
          ),
        );
      },
      backgroundColor: kPrimaryColor,
      child: Icon(
        Icons.add,
        size: displayWidth(context) * 0.06,
      ),
      mini: true,
      tooltip: "Tambah Pelanggan",
    );
  }
}

class searchData extends SearchDelegate<String> {
  String? hintText;
  List? list;
  searchData({required this.list, this.hintText});

  @override
  String? get searchFieldLabel => hintText;
  // InputDecorationTheme? get inputDecorationTheme => inputDecoration;

  // List searchUsername = List();

  Future showAllSearch() async {
    var url = Uri.parse("https://furniture.fad.my.id/user/cari.php");
    var response = await http.post(url, body: {'username': query});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData!;
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
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
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
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
  Widget buildResults(
    BuildContext context,
  ) {
    // return Text('Data ke $query');
    return FutureBuilder(
      future: showAllSearch(),
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
                      data1: 'Username',
                      spasi: ':',
                      data2: list['username']),
                  barisData(
                      context: context,
                      data1: 'Password',
                      spasi: ':',
                      data2: list['password']),
                  Divider(),
                  barisData(
                      context: context,
                      data1: 'No. Telp',
                      spasi: ':',
                      data2: list['notelp']),
                  Divider(),
                  barisData(
                    context: context,
                    data1: 'dibuat',
                    spasi: ':',
                    data2: list['dibuat'],
                  )
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
    // return Text('data');
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
                Text(
                  data2!,
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
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
