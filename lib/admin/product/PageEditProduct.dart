import 'dart:io';
import 'dart:ffi';
import 'dart:convert';

import 'package:furnitureapp/admin/widget/alertInput.dart';
import 'package:furnitureapp/admin/widget/alertUpdate.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/admin/widget/button.dart';
import 'package:furnitureapp/admin/widget/inputText.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

class PageEditProduct extends StatefulWidget {
  PageEditProduct({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  final int index;
  final List data;

  @override
  State<PageEditProduct> createState() => _PageEditProductState();
}

class _PageEditProductState extends State<PageEditProduct> {
  late TextEditingController namabarang;
  late TextEditingController stok;
  late TextEditingController harga;
  late TextEditingController deskripsibarang;

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

  // ==================== UPLOAD GAMBAR ===============
  File? _gambar;
  ImagePicker picker = ImagePicker();

  Future pilihGambar() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _gambar = File(pickedImage!.path);
    });
  }
  // =======================================================

  @override
  void initState() {
    super.initState();
    // id_jenis =
    //     TextEditingController(text: widget.data[widget.index]['id_jenis']);
    namabarang =
        TextEditingController(text: widget.data[widget.index]['namabarang']);
    stok = TextEditingController(text: widget.data[widget.index]['stok']);
    harga = TextEditingController(text: widget.data[widget.index]['harga']);
    deskripsibarang = TextEditingController(
        text: widget.data[widget.index]['deskripsibarang']);

    getAllName();
  }

  Future editData() async {
    var url = Uri.parse("https://furniture.fad.my.id/barang/ubah.php");
    var request = http.MultipartRequest('POST', url);
    request.fields['id_barang'] = widget.data[widget.index]['id_barang'];
    request.fields['id_jenis'] = selectedValue.toString();
    request.fields['namabarang'] = namabarang.text;
    request.fields['stok'] = stok.text;
    request.fields['harga'] = harga.text;
    request.fields['deskripsibarang'] = deskripsibarang.text;

    var pic = await http.MultipartFile.fromPath("gambar", _gambar!.path);
    request.files.add(pic);

    var response = await request.send();

    if (response.statusCode == 200) {
      AlertUpdateSuccess(context);
      print("Update Success");
    } else {
      AlertInputFailed(context);
      print("Update Gagal");
    }

    setState(() {});
  }

  // ======= TAMPIL DATA =============
  List data = [];

  Future getData() async {
    var url = Uri.parse("https://furniture.fad.my.id/barang/tampil.php");
    var response = await http.get(url);

    // setState(() {
    //   data = json.decode(response.body);
    // });
    if (mounted) {
      data = json.decode(response.body);
    }

    return "Success!";
  }
  // ===================================

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
      // resizeToAvoidBottomInset: false,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Ubah Data Produk",
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
                                  ? Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: FileImage(_gambar!))))
                                  : Image.network(
                                      "https://furniture.fad.my.id/gambarbarang/${widget.data[widget.index]['gambar']}",
                                      height: 150,
                                      width: 300,
                                      fit: BoxFit.fitHeight,
                                    ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: displayHeight(context) * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      pilihGambar();
                                      print('Pilih Klik');
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.camera,
                                        ),
                                        Text(
                                          'Ganti Gambar',
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontFamily: 'OpenSans',
                                            fontSize:
                                                displayWidth(context) * 0.034,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.02,
                            ),
                            inputText(
                              controller: namabarang,
                              context: context,
                              label: 'Nama Barang',
                              maxLines: 1,
                              keyboardType: TextInputType.multiline,
                            ),
                            inputText(
                              controller: stok,
                              context: context,
                              label: 'Stok',
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                            ),
                            inputText(
                              controller: harga,
                              context: context,
                              label: 'Harga',
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                            ),
                            inputText(
                              controller: deskripsibarang,
                              context: context,
                              label: 'Deskripsi',
                              height: displayHeight(context) * 0.15,
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
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
                                SizedBox(
                                  height: 30,
                                  child: DropdownButton(
                                    value: selectedValue,
                                    hint: Text(
                                      widget.data[widget.index]['namajenis'],
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: displayWidth(context) * 0.035,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: dataJenis
                                        .map(
                                          (data) => DropdownMenuItem(
                                            value: data['id_jenis'],
                                            child: Text(
                                              data['namajenis'],
                                              style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold,
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
                            SizedBox(height: displayHeight(context) * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buttonInput(
                                    context: context,
                                    label: 'Batal',
                                    color: Colors.red,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      print('Batal');
                                    }),
                                buttonInput(
                                  context: context,
                                  label: 'Simpan',
                                  color: kPrimaryColor,
                                  onPressed: () {
                                    editData();
                                    print('Simpan');
                                  },
                                ),
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
