import 'package:flutter/material.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

buttonInput({
  required BuildContext context,
  String? label,
  Color? color,
  required VoidCallback? onPressed,
}) {
  return Container(
    height: displayWidth(context) * 0.11,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(90),
      child: ElevatedButton(
        child: Text(
          '$label',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: displayWidth(context) * 0.033,
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          textStyle: TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    ),
  );
}

buttonIcon({
  required BuildContext context,
  final GestureTapCallback? onTap,
  Color? color,
  IconData? icon,
  String? pesan,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Tooltip(
        message: pesan,
        child: Icon(
          icon,
          color: color,
          size: displayWidth(context) * 0.05,
        ),
      ),
    ),
  );
}
