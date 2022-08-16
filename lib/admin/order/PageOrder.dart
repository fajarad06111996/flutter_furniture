import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/order/PageOrderInsert.dart';
import 'package:furnitureapp/admin/widget/fab.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:core';

class PageOrder extends StatefulWidget {
  const PageOrder({Key? key}) : super(key: key);

  @override
  State<PageOrder> createState() => _PageOrderState();
}

class _PageOrderState extends State<PageOrder> {
  // late int index;
  // ======= TAMPIL DATA =============
  List dataPesanan = [];

  Future getDataOrder() async {
    var url = Uri.parse("https://furniture.fad.my.id/pesanan/tampil.php");
    var response = await http.get(url);

    // setState(() {
    //   data = json.decode(response.body);
    // });

    if (mounted) {
      setState(() {
        dataPesanan = json.decode(response.body);
      });
    }

    return "Success!";
  }
  // ===================================

  Color getColor(int selector) {
    if (selector % 2 == 0) {
      return Colors.blue;
    } else {
      return Colors.blueGrey;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Data Pesanan",
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
                // showSearch(
                //     context: context,
                //     delegate: searchData(
                //       list: searchList,
                //       hintText: 'Ketik Nama',
                //     ));
              }),
              child: Icon(Icons.search,
                  size: displayWidth(context) * 0.065, color: kPrimaryColor),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(
          left: displayWidth(context) * 0.05,
          right: displayWidth(context) * 0.05,
        ),
        width: displayWidth(context) * 1,
        child: FutureBuilder(
          future: getDataOrder(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: dataPesanan.length,
                    itemBuilder: (context, int index) {
                      // final i = data[index];
                      return GestureDetector(
                        onTap: () {
                          print("Klik Pesanan");
                        },
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: displayWidth(context) * 0.54,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: displayWidth(context) * 0.35,
                                    width: displayWidth(context) * 0.35,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                          "https://furniture.fad.my.id/gambarbarang/${dataPesanan[index]['gambar']}",
                                          // width: 300,

                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  title: Text(
                                    '${dataPesanan[index]['namabarang']}'
                                        .toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: displayWidth(context) * 0.05,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                        color: kPrimaryColor),
                                  ),
                                  subtitle: Text(
                                    '${dataPesanan[index]['username']}',
                                    style: TextStyle(
                                        fontSize: displayWidth(context) * 0.035,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         PageEditCustomer(
                                          //       data: data,
                                          //       index: index,
                                          //     ),
                                          //   ),
                                          // );
                                          print('Ubah Klik');
                                        },
                                        child: Tooltip(
                                          message: 'Ubah',
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                            size: displayWidth(context) * 0.05,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        // onTap: () => confirm(index),
                                        onTap: () {
                                          print('Hapus Klik');
                                        },
                                        child: Tooltip(
                                          message: 'Hapus',
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: displayWidth(context) * 0.05,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: displayWidth(context) * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: displayWidth(context) * 0.06,
                                    right: displayWidth(context) * 0.06,
                                  ),
                                  child: Column(
                                    children: [
                                      barisData(
                                          text1: 'Jumlah Beli',
                                          text2:
                                              'X ${dataPesanan[index]['jumlah']}',
                                          fontSize:
                                              displayWidth(context) * 0.041),
                                      barisData(
                                          text1: 'Total Harga',
                                          text2:
                                              'Rp. ${dataPesanan[index]['total']}',
                                          fontSize:
                                              displayWidth(context) * 0.041),
                                      Divider(),
                                      barisData(
                                          text1: 'Status',
                                          text2: 'On Proses',
                                          fontSize:
                                              displayWidth(context) * 0.041),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10)
                              ],
                            ),
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
      floatingActionButton: fabInsert(
          context: context,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageOrderInsert(),
              ),
            );
            print("Insert Klik");
          }),
    );
  }

  barisData({
    String? text1,
    String? text2,
    double? fontSize,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1!,
          style: TextStyle(
              fontSize: displayWidth(context) * 0.035,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              color: kPrimaryColor),
        ),
        Text(
          text2!,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              color: kPrimaryColor),
        ),
      ],
    );
  }
}
