import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Controller/UserController.dart';
import 'package:mime/mime.dart';

class Createuser extends StatefulWidget {
  const Createuser({Key key}) : super(key: key);

  @override
  State<Createuser> createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {
  String name, email, password, status, city, wallet_amount, photo,phone =" ";

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        title: Text("Create User"),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [

                Container(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) => name = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value){phone=value;},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefix: Text('+91'),
                      prefixIcon: Icon(Icons.phone_android),
                      labelText: 'Mobile Number',
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => email = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) => password = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) => city = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => wallet_amount = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Wallet Amount',
                    prefixIcon: Icon(Icons.wallet),
                  ),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // 1. Pick an image file
                      final filePicked = await FilePicker.platform.pickFiles();
                      if (filePicked != null) {
                        final file = filePicked.files.single; // PlatformFile
                        final mimeType = lookupMimeType(file.name) ?? '';

                        /// 2. Get presigned data somewhere
                        // const url = 'https://s3.amazonaws.com/......';
                        // final fields = {
                        //   'bucket': '...',
                        //   'X-Amz-Algorithm': 'AWS4-HMAC-SHA256',
                        //   'X-Amz-Credential': '...',
                        //   'X-Amz-Date': '...',
                        //   'Policy': '...',
                        //   'X-Amz-Signature': '...',
                        //   'x-amz-meta-userid': '...',
                        //   'Content-Type': mimeType,
                        //   'file': dio.MultipartFile.fromBytes(file.bytes ?? []),
                        // };

                        /// 3. Send file to AWS s3
                        // final formData = dio.FormData.fromMap(fields);
                        // await dio.Dio().post(url, data: formData);
                      }
                    },
                    child: Text("Upload Image")),
                // TextField(
                //   keyboardType: TextInputType.text,
                //   onChanged: (value) => photo = value,
                //   onTap:
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Photo',
                //     prefixIcon: Icon(Icons.image),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Create'),
                        onPressed: () {
                          print('pressed');
                          if (validatetourdetail(name, email, password, status,
                              city, wallet_amount)) {

                            userController.createuser(name:name.toString(),email: email.toString(), phone: phone.toString(),password:password.toString(), status:status.toString(),
                                city:city.toString(), wallet_amount:wallet_amount.toString(),photo: photo.toString());
                          }
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      )

    );
  }

  bool validatetourdetail(name, email, password, status, city, wallet_amount) {
    if (name.toString().isEmpty ||
        email.toString().isEmpty ||
        password.toString().isEmpty ||
        city.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the require Details");
      return false;
    } else {
      return true;
    }
  }
}
