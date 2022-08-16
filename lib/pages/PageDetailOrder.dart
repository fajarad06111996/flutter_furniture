import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageDetailOrder extends StatefulWidget {
  const PageDetailOrder({Key? key}) : super(key: key);

  @override
  State<PageDetailOrder> createState() => _PageDetailOrderState();
}

class _PageDetailOrderState extends State<PageDetailOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Halaman detail order",
        ),
      ),
    );
  }
}
