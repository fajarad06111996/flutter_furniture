import 'package:flutter/material.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

void confirm({
  required BuildContext context,
  required int index,
  required VoidCallback? onPressed,
  String? pesan,
}) {
  AlertDialog alertDialog = AlertDialog(
    content: Text(
      'pesan',
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
        onPressed: onPressed,
      ),
    ],
  );

  showDialog(builder: (context) => alertDialog, context: context);
}

//  onPressed: () {
//           deleteData(index);
//           print("Berhasil Hapus Data");
//           Navigator.pop(context);
//         },
