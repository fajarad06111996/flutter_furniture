import 'package:flutter/material.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

fabInsert({
  required BuildContext context,
  required VoidCallback? onPressed,
  final String? tooltip,
}) {
  return FloatingActionButton(
    onPressed: onPressed,
    backgroundColor: kPrimaryColor,
    child: Icon(
      Icons.add,
      size: displayWidth(context) * 0.06,
    ),
    mini: true,
    tooltip: tooltip,
  );
}
