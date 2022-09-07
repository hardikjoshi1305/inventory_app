import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Controller/UserController.dart';

class Createuser extends StatefulWidget {
  const Createuser({Key key}) : super(key: key);

  @override
  State<Createuser> createState() => _CreateuserState();
}

class _CreateuserState extends State<Createuser> {
  String name,
      email,
      password,
      status,
      deviceid,
      photo,
      wallet_amount,
      phone = " ";
  var isvisible = false;
  var isvisibleid = "0";

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create User"),
        ),
        body: Container(
          child: Obx(() => Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Opacity(
                    opacity:
                        1, // You can reduce this when loading to give different effect
                    child: AbsorbPointer(
                      absorbing: userController.isLoading.value,
                      child: SingleChildScrollView(
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
                                    labelText: 'User ID',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    onChanged: (value) {
                                      phone = value;
                                    },
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
                                // TextField(
                                //   keyboardType: TextInputType.emailAddress,
                                //   onChanged: (value) => email = value,
                                //   decoration: const InputDecoration(
                                //     border: OutlineInputBorder(),
                                //     labelText: 'Email',
                                //     prefixIcon: Icon(Icons.email),
                                //   ),
                                // ),
                                // Container(
                                //   height: 20,
                                // ),
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
                                // TextField(
                                //   keyboardType: TextInputType.visiblePassword,
                                //   onChanged: (value) => deviceid = value,
                                //   decoration: const InputDecoration(
                                //     border: OutlineInputBorder(),
                                //     labelText: 'Device ID',
                                //     prefixIcon: Icon(Icons.location_on),
                                //   ),
                                // ),
                                // Container(
                                //   height: 20,
                                // ),
                                TextField(
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  onChanged: (value) =>
                                      wallet_amount = value.toString(),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Wallet Amount',
                                    prefixIcon: Icon(Icons.wallet),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                ),
                                CheckboxListTile(
                                  title: Text("Inventory visible to user ?"),
                                  value: isvisible,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isvisible = newValue;
                                      isvisibleid = newValue ? "1" : "0";
                                      print(
                                          "isvisible" + isvisibleid.toString());
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity
                                      .trailing, //  <-- leading Checkbox
                                ),
                                Container(
                                  height: 20,
                                ),
                                // ElevatedButton(
                                //     onPressed: () async {
                                //       // 1. Pick an image file
                                //       final filePicked = await FilePicker.platform.pickFiles();
                                //       if (filePicked != null) {
                                //         final file = filePicked.files.single; // PlatformFile
                                //         final mimeType = lookupMimeType(file.name) ?? '';
                                //
                                //         /// 2. Get presigned data somewhere
                                //         // const url = 'https://s3.amazonaws.com/......';
                                //         // final fields = {
                                //         //   'bucket': '...',
                                //         //   'X-Amz-Algorithm': 'AWS4-HMAC-SHA256',
                                //         //   'X-Amz-Credential': '...',
                                //         //   'X-Amz-Date': '...',
                                //         //   'Policy': '...',
                                //         //   'X-Amz-Signature': '...',
                                //         //   'x-amz-meta-userid': '...',
                                //         //   'Content-Type': mimeType,
                                //         //   'file': dio.MultipartFile.fromBytes(file.bytes ?? []),
                                //         // };
                                //
                                //         /// 3. Send file to AWS s3
                                //         // final formData = dio.FormData.fromMap(fields);
                                //         // await dio.Dio().post(url, data: formData);
                                //       }
                                //     },
                                //     child: Text("Upload Image")),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: ElevatedButton(
                                        child: const Text('Create'),
                                        onPressed: () {
                                          print('pressed');
                                          if (validatetourdetail(
                                              name,
                                              phone,
                                              password,
                                              deviceid,
                                              wallet_amount,
                                              isvisibleid)) {
                                            userController.createuser(
                                              name: name.toString(),
                                              phone: phone.toString(),
                                              password: password.toString(),
                                              deviceid: deviceid.toString(),
                                              wallet_amount:
                                                  wallet_amount.toString(),
                                              isvisibleid:
                                                  isvisibleid.toString(),
                                              // photo: photo.toString()
                                            );
                                          }
                                        },
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: userController.isLoading.value ? 1.0 : 0,
                    child: CircularProgressIndicator(),
                  ),
                ],
              )),
        ));
  }

  bool validatetourdetail(
      name, phone, password, deviceid, wallet_amount, String isvisibleid) {
    if (name.toString().isEmpty ||
        phone.toString().isEmpty ||
        password.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the require Details");
      return false;
    } else {
      return true;
    }
  }
}
