import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/widget/alertInput.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

import 'package:furnitureapp/admin/widget/inputText.dart';
import 'package:furnitureapp/admin/widget/button.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ffi';
import 'dart:convert';

enum ImageSourceType { galery, camera }

class PageInsertProduct extends StatefulWidget {
  PageInsertProduct({Key? key}) : super(key: key);

  // final List data;
  // final int index;

  @override
  State<PageInsertProduct> createState() => _PageInsertProductState();
}

class _PageInsertProductState extends State<PageInsertProduct> {
  // ============== DROPDOWN JENIS BARANG ===============
  List dataJenis = [];
  String? selectedValue;

  Future getAllName() async {
    var url = Uri.parse("https://furniture.fad.my.id/jenisbarang/tampil.php");
    var response = await http.get(url);
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      dataJenis = jsonData;
    });

    // print(jsonData);
  }
  // final List dataJenis = ["Aktif", "Tidak Aktif"];
  // =========================================

  @override
  void initState() {
    super.initState();
    getAllName();
  }

  final _formKey = GlobalKey<FormState>();
  // TextEditingController gambar = new TextEditingController();

  // TextEditingController id_jenis = new Text
  TextEditingController namabarang = new TextEditingController();
  TextEditingController stok = new TextEditingController();
  TextEditingController deskripsibarang = new TextEditingController();
  TextEditingController harga = new TextEditingController();

  File? _gambar;
  ImagePicker? picker = ImagePicker();

  Future pilihGambar() async {
    var pickedImage = await picker?.getImage(source: ImageSource.gallery);
    setState(() {
      _gambar = File(pickedImage!.path);
    });
  }

  // Future ambilGambar() async {
  //   var photoImage = await picker?.getImage(source: ImageSource.camera);
  //   setState(() {
  //     _gambar = File(photoImage!.path);
  //   });
  // }

  Future uploadGambar() async {
    var uri = Uri.parse("https://furniture.fad.my.id/barang/tambah.php");
    var request = http.MultipartRequest('POST', uri);
    // request.fields['id_barang'] = widget.data[widget.index]['id_barang'];
    request.fields['id_jenis'] = selectedValue.toString();
    request.fields['namabarang'] = namabarang.text;
    request.fields['stok'] = stok.text;
    request.fields['harga'] = stok.text;
    request.fields['deskripsibarang'] = deskripsibarang.text;
    var pic = await http.MultipartFile.fromPath("gambar", _gambar!.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      AlertInputSuccess(context);
      print('Gambar Berhasil di Upload');
    } else {
      AlertInputSuccess(context);
      print('Gagal Upload Gambar');
    }
    setState(() {});
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
                              "Tambah Barang",
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
                            Container(
                              height: 150,
                              width: displayWidth(context) * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: _gambar != null
                                  ? Image.file(
                                      _gambar!,
                                      height: 150,
                                      width: 300,
                                      fit: BoxFit.fitHeight,
                                    )
                                  : Container(
                                      height: 150,
                                      width: 300,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                displayHeight(context) * 0.09,
                                          ),
                                          Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'OpenSans',
                                              fontSize:
                                                  displayWidth(context) * 0.034,
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                displayHeight(context) * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  pilihGambar();
                                                  print('Pilih Gambar');
                                                },
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.camera,
                                                    ),
                                                    Text(
                                                      "Pilih Galeri",
                                                      style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontFamily: 'OpenSans',
                                                        fontSize: displayWidth(
                                                                context) *
                                                            0.034,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.02,
                            ),
                            inputText(
                              context: context,
                              controller: namabarang,
                              label: 'Nama Barang',
                              keyboardType: TextInputType.multiline,
                            ),
                            inputText(
                              context: context,
                              controller: stok,
                              label: 'Stok',
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                            ),
                            inputText(
                              context: context,
                              controller: harga,
                              label: 'Harga',
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                            ),
                            inputText(
                              context: context,
                              controller: deskripsibarang,
                              label: 'Deskripsi',
                              height: displayHeight(context) * 0.15,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.01,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Jenis Barang",
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: displayWidth(context) * 0.037,
                                  ),
                                ),
                                DropdownButton(
                                  value: selectedValue,
                                  hint: Text(
                                    'Pilih ',
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: displayWidth(context) * 0.035,
                                    ),
                                  ),
                                  items: dataJenis
                                      .map(
                                        (data) => DropdownMenuItem(
                                          value: data['id_jenis'].toString(),
                                          child: Text(
                                            data['namajenis'],
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
                                      selectedValue = value as String;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: displayHeight(context) * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buttonInput(
                                    context: context,
                                    label: 'Batal',
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.red),
                                buttonInput(
                                    context: context,
                                    label: 'Tambah',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        print("Input");
                                        uploadGambar();
                                      }
                                    },
                                    color: kPrimaryColor),
                              ],
                            ),
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
