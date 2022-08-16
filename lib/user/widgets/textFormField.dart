import 'package:flutter/material.dart';
import 'package:furnitureapp/size_helpers.dart';
import 'package:furnitureapp/constans.dart';

inputText({
  required BuildContext context,
  String? label,
  double? height,
  TextInputType? keyboardType,
  FormFieldValidator? validator,
  TextEditingController? controller,
  int? maxLines,
  bool? enabled,
  required bool readOnly,
}) {
  return SizedBox(
    height: height,
    child: TextFormField(
      enableInteractiveSelection: true,
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: TextStyle(
        fontFamily: 'OpenSans',
        color: kPrimaryColor,
        fontSize: displayWidth(context) * 0.04,
      ),
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: 'Tulis Disini',
        labelText: '$label',
        labelStyle: TextStyle(
          fontFamily: 'OpenSans',
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: displayWidth(context) * 0.037,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        // border: InputBorder.none,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "${label} Tidak Boleh Kosong";
        } else {
          return null;
        }
      },
    ),
  );
}

editText({
  required BuildContext context,
  String? label,
  double? height,
  TextInputType? keyboardType,
  FormFieldValidator? validator,
  TextEditingController? controller,
  int? maxLines,
  bool? enabled,
  required bool readOnly,
}) {
  return SizedBox(
    height: height,
    child: TextFormField(
      enableInteractiveSelection: true,
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: TextStyle(
        fontFamily: 'OpenSans',
        color: kPrimaryColor,
        fontSize: displayWidth(context) * 0.04,
      ),
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: 'Tulis Disini',
        labelText: '$label',
        labelStyle: TextStyle(
          fontFamily: 'OpenSans',
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: displayWidth(context) * 0.037,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        // border: InputBorder.none,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "${label} Tidak Boleh Kosong";
        } else {
          return null;
        }
      },
    ),
  );
}
