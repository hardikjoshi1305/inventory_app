
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:inventory_management/Views/Login/LoginInPageForm.dart';

class Login extends StatefulWidget{
    const Login({Key  key}):super(key:key);

    @override
    _LoginState createState() =>_LoginState();
}

class _LoginState extends State<Login>{

    @override
    Widget build(BuildContext context){
        return  Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.blueGrey[600],
                    title: Text('Inventory Management'),
                ),
                body:  LoginPageForm(),
            );
    }
}
class HeaderClipperClass extends CustomClipper<Path>{
    @override
    Path getClip(Size size) {
        var path = Path();
        path.lineTo(0.0, size.height-40);
        path.quadraticBezierTo(size.width/4, size.height, size.width/2, size.height);
        path.quadraticBezierTo(size.width-(size.width/4), size.height, size.width,size.height-40);
        path.lineTo(size.width, 0);
        path.close();
        return path;
    }

    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
        return false;
    }

}