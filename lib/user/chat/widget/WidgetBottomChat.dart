import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/size_helpers.dart';

class WidgetBottomChat extends StatelessWidget {
  const WidgetBottomChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: displayWidth(context) * 0.05,
              top: displayWidth(context) * 0.03,
              bottom: displayWidth(context) * 0.03,
            ),
            child: Container(
              alignment: Alignment.centerRight,
              width: displayWidth(context) * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Ketik disini.....",
                  hintStyle: TextStyle(
                    fontFamily: fontType,
                    color: kPrimaryColor,
                    fontSize: displayWidth(context) * 0.045,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                  size: displayWidth(context) * 0.09,
                ),
              )),
        ],
      ),
    );
  }
}
