import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:furnitureapp/constans.dart';

import 'package:furnitureapp/size_helpers.dart';

class WidgetSearch extends StatelessWidget {
  const WidgetSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: displayWidth(context) * 0.0001,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Mau Cari Apa ???...',
            hintStyle: TextStyle(
              fontFamily: fontType,
              color: kPrimaryColor,
              fontSize: displayWidth(context) * 0.04,
            ),
            prefixIcon: Icon(
              Icons.search,
              size: displayWidth(context) * 0.06,
              color: kPrimaryColor,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(1),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 1.9),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
