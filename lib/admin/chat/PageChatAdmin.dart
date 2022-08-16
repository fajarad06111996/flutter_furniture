import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/admin/chat/widget/WidgetBottomChat.dart';
import 'package:furnitureapp/admin/chat/widget/WidgetChat.dart';

import 'package:furnitureapp/size_helpers.dart';

class PageChatAdmin extends StatefulWidget {
  const PageChatAdmin({Key? key}) : super(key: key);

  @override
  State<PageChatAdmin> createState() => _PageChatAdminState();
}

class _PageChatAdminState extends State<PageChatAdmin> {
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
          "Chat Pengguna",
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: fontType,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 80),
        children: [
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
          WidgetChat(),
        ],
      ),
      // bottomSheet: WidgetBottomChat(),
    );
  }
}
