
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Controller/LoginController.dart';

final formKey = GlobalKey<FormState>();

class LoginPageForm extends StatefulWidget {
  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  // TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController,emailController = TextEditingController();
var password;
  // LoginController loginController = Get.put(LoginController());
  final LoginController logincontroller  = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return   Padding(
          padding: const EdgeInsets.all(10),
          child:Obx((){
            if(logincontroller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }else{
              return  ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        '',
                        style: TextStyle(fontSize: 20),
                      )),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextField(
                  //     controller: phoneController,
                  //     keyboardType: TextInputType.phone,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       prefix: Text('+91'),
                  //       prefixIcon: Icon(Icons.phone_android),
                  //       labelText: 'Mobile Number',
                  //     ),
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Id',
                        prefixIcon: Icon(Icons.email),

                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      onChanged: (value){password= value;},
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),

                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text('',),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          if(validatelogindetail(emailController.value.text,password.toString())){
                            logincontroller.fetchLogin(email:emailController.value.text,password:password.toString());
                            // loginuser(phoneController.value.text, passwordController.value.text, context);
                          }
                        },
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          //signup screen
                        },
                      )
                    ],
                  ),
                ],
              );

            }
          })
      )
    ;
  }

     validatelogindetail(String email,String password){
       Pattern pattern =
           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
       RegExp regex = new RegExp(pattern);
    if(email.isEmpty){
       Fluttertoast.showToast(msg: "Email cannot be empty");
       return false;
    }else if(password.isEmpty){
       Fluttertoast.showToast(msg: "Password cannot be empty");
       return false;
    }else{
       return true;
    }
  }

}
