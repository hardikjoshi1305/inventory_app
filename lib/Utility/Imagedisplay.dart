import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Imagedisplay extends StatefulWidget {
  final String imgurl;
  const Imagedisplay({this.imgurl, Key key}) : super(key: key);

  @override
  State<Imagedisplay> createState() => _ImagedisplayState();
}

// String imgurl = Get.arguments as String;

class _ImagedisplayState extends State<Imagedisplay> {
  @override
  Widget build(BuildContext context) {
    print("img" + widget.imgurl);
    return Scaffold(
      appBar: AppBar(
        title: Text("Agour"),
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
          "http://pankrutiinfotech.com/inventory_app/public/" + widget.imgurl,
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
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
        ),
      ),
    );
  }
}
