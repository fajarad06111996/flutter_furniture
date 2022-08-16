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
      children: [
        Container(
          padding: EdgeInsets.all(2),
          height: displayWidth(context) * 0.16,
          child: InkWell(
            // splashColor: false,
            onTap: () {
              debugPrint("Tampil Chat");
            },
            child: Row(
              children: [
                Container(
                  width: displayWidth(context) * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/user.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: displayWidth(context) * 0.5,
                      child: Text(
                        "User",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: displayWidth(context) * 0.05,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: displayWidth(context) * 0.5,
                      child: Text(
                        "This is the example of TextOverflow ellipsis, In the end there are the dots",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: displayWidth(context) * 0.045,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: displayWidth(context) * 0.06,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Container(
                      child: Text(
                        "20:00",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: displayWidth(context) * 0.03,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      height: displayWidth(context) * 0.06,
                      width: displayWidth(context) * 0.06,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "1",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: displayWidth(context) * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Divider(),
        SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
