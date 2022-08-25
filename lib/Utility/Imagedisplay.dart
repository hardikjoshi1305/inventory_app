import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Imagedisplay extends StatefulWidget {
  const Imagedisplay({Key key}) : super(key: key);

  @override
  State<Imagedisplay> createState() => _ImagedisplayState();
}

String imgurl = Get.arguments as String;

class _ImagedisplayState extends State<Imagedisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agour"),
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Image(
          width: double.infinity,
          height: double.infinity,
          image: NetworkImage(
              "http://pankrutiinfotech.com/inventory_app/public/SendPart/" +
                  imgurl),
        ),
      ),
    );
  }
}
