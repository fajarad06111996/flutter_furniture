import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/pages/Chat/widget/WidgetBottomChat.dart';
import 'package:furnitureapp/pages/Chat/widget/WidgetChat.dart';

import 'package:furnitureapp/size_helpers.dart';

class PageChat extends StatefulWidget {
  const PageChat({Key? key}) : super(key: key);

  @override
  State<PageChat> createState() => _PageChatState();
}

class _PageChatState extends State<PageChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            size: displayWidth(context) * 0.065,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          "Chat Admin",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 80),
        children: [
          WidgetChat(),
        ],
      ),
      bottomSheet: WidgetBottomChat(),
    );
  }
}
