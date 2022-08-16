import 'package:flutter/material.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

// enum DialogsAction { yes, cancel }

AlertInputSuccess(BuildContext context) {
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
                  size: 90,
                  color: kPrimaryColor,
                ),
                Text(
                  "INPUT DATA BERHASIL",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 25,
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

AlertInputFailed(BuildContext context) {
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
                  "GAGAL INPUT DATA",
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
                  "Data Sudah Digunakan",
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
