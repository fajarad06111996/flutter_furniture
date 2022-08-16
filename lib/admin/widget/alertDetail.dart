import 'package:flutter/material.dart';
import 'package:furnitureapp/admin/customer/PageCustomer.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

enum DialogsAction { cancel }

AlertDetail(
    {required BuildContext context,
    String? username,
    password,
    level,
    notelp,
    status,
    dibuat,
    diperbarui,
    judul}) {
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
                    judul,
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
                detailBarisText(
                    context: context, text1: "Username", text2: username),
                detailBarisText(
                    context: context, text1: "Password", text2: password),
                detailBarisText(
                    context: context, text1: "Hak Akses", text2: level),
                Divider(),
                detailBarisText(
                    context: context, text1: "No. Telp", text2: notelp),
                // detailBarisText(
                //     context: context, text1: "Status Akun", text2: status),
                Divider(),
                detailBarisText(
                    context: context, text1: "Dibuat", text2: dibuat),
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

detailBarisText({
  required BuildContext context,
  String? text1,
  String? text2,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text1!,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 11,
          color: kPrimaryColor,
        ),
      ),
      SizedBox(height: displayHeight(context) * 0.02),
      Text(
        text2!,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          // letterSpacing: 1,
          color: kPrimaryColor,
        ),
      )
    ],
  );
}
