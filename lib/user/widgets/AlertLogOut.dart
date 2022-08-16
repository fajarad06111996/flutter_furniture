import 'package:flutter/material.dart';
import 'package:furnitureapp/admin/home/PageHomeAdmin.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

void alertLogOut({
  required BuildContext context,
}) {
  AlertDialog alertDialog = AlertDialog(
    content: Text(
      'Yakin Ingin Keluar ??',
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
            letterSpacing: 1,
            fontFamily: 'OpenSans',
            fontSize: displayWidth(context) * 0.037,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        color: Colors.red,
        onPressed: () {
          print('Batal');
          Navigator.pop(context);
        },
      ),
      RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          "Iya",
          style: TextStyle(
            letterSpacing: 1,
            fontFamily: 'OpenSans',
            fontSize: displayWidth(context) * 0.037,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        color: Colors.green,
        onPressed: () {
          print("Log Out");
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        },
      ),
    ],
  );

  showDialog(builder: (context) => alertDialog, context: context);
}
