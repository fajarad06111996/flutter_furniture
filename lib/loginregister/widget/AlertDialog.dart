import 'package:flutter/material.dart';
import 'package:furnitureapp/admin/home/PageHomeAdmin.dart';
import 'package:furnitureapp/constans.dart';

AlertAdmin({
  required BuildContext context,
  String? username,
  String? password,
  String? notelp,
  String? dibuat,
  String? diperbarui,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.of(context).pop(true);
          Navigator.pushReplacementNamed(context, '/PageHomeAdmin');
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
                  size: 90,
                  color: kPrimaryColor,
                ),
                Text(
                  "LOGIN BERHASIL",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

AlertUser({
  required BuildContext context,
  String? username,
  String? password,
  String? notelp,
  String? dibuat,
  String? diperbarui,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.of(context).pop(true);
          Navigator.pushReplacementNamed(context, '/NavBarUser');
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
                  size: 90,
                  color: kPrimaryColor,
                ),
                Text(
                  "LOGIN BERHASIL",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

AlertUserNotActive({required BuildContext context, required String username}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(
        Duration(seconds: 4),
        () {
          Navigator.of(context).pop(true);
          // Navigator.pushReplacementNamed(context, '/PageHomeUser');
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
                  Icons.cancel_outlined,
                  size: 90,
                  color: Colors.red,
                ),
                Text(
                  "LOGIN GAGAL",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Status Akun Anda Tidak Aktif Harap Hubungi Admin",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 14,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
