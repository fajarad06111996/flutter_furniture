import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'package:furnitureapp/constans.dart';

import 'package:furnitureapp/size_helpers.dart';

class WidgetSortButton extends StatelessWidget {
  const WidgetSortButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: displayWidth(context) * 0.04),
      padding: EdgeInsets.all(displayWidth(context) * 0.04),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: RotatedBox(
        quarterTurns: 40,
        child: Icon(
          Icons.tune,
          color: Colors.white,
          size: displayWidth(context) * 0.05,
        ),
      ),
    );
  }
}
