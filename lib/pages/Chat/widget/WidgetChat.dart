import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

class WidgetChat extends StatefulWidget {
  const WidgetChat({Key? key}) : super(key: key);

  @override
  State<WidgetChat> createState() => _WidgetChatState();
}

class _WidgetChatState extends State<WidgetChat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(right: displayWidth(context) * 0.1),
            child: ClipPath(
              clipper: UpperNipMessageClipper(MessageType.receive),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Text(
                  "contoh chat admin",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: displayWidth(context) * 0.04,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(
              top: displayWidth(context) * 0.04,
              left: displayWidth(context) * 0.01,
            ),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Text(
                  "contoh chat user tes 123 tes 123 contoh chat user tes 123 tes 123contoh chat user tes 123 tes 123contoh chat user tes 123 tes 123contoh chat user tes 123 tes 123contoh chat user tes 123 tes 123",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: displayWidth(context) * 0.04,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
