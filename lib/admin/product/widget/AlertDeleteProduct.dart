import 'package:flutter/material.dart';
import 'package:furnitureapp/admin/product/PageProduct.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: displayWidth(context) * 0.04,
            ),
          ),
          content: Text(
            body,
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: displayWidth(context) * 0.05,
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Batal',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.037,
                ),
              ),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogsAction.yes),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Iya',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: displayWidth(context) * 0.037,
                ),
              ),
            )
          ],
        );
      },
    );
    return (action != null) ? action : DialogsAction.cancel;
  }
}
