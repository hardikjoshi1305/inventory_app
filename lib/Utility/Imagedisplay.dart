import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Imagedisplay extends StatefulWidget {
  final String imgurl;
  const Imagedisplay({this.imgurl, Key key}) : super(key: key);

  @override
  State<Imagedisplay> createState() => _ImagedisplayState();
}

// String imgurl = Get.arguments as String;
var url = "http://192.168.0.8/inventorymanagement/public/";

// var url = "http://pankrutiinfotech.com/inventory_app/public/";
class _ImagedisplayState extends State<Imagedisplay> {
  @override
  Widget build(BuildContext context) {
    print("img" + widget.imgurl);
    return Scaffold(
      appBar: AppBar(
        title: Text("Agour"),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
          url + widget.imgurl,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 70,
                color: Colors.red,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  error.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
