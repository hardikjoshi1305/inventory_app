import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/TourController.dart';
import 'package:mime/mime.dart';
import 'package:image_picker/image_picker.dart';

class CreateTourDetail extends StatefulWidget {
  const CreateTourDetail({Key key}) : super(key: key);

  @override
  State<CreateTourDetail> createState() => _CreateTourDetailState();
}

class _CreateTourDetailState extends State<CreateTourDetail> {
  var expensename,
      amount,
      remark,
      photo,
      daily_remark,
      final_dignose,
      servicereport,
      img_path;
  var item = Get.arguments;

  @override
  Widget build(BuildContext context) {
    TourController tourController = Get.put(TourController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Details"),
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: item[0] == 1
                ? Column(
                    children: [
                      Container(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) => expensename = value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expense Name',
                          prefixIcon: Icon(Icons.money),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) => amount = value,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                          prefixIcon: Icon(Icons.currency_rupee_outlined),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            try {
                              var image = await ImagePicker.pickImage(
                                  source: ImageSource.gallery);
                              // print("object" + image.toString());
                              print("object" + image.absolute.path);
                              img_path = image.absolute.path;
                            } catch (exception) {
                              print("object" + exception.toString());
                            }

                            // 1. Pick an image file
                            // final filePicked = await FilePicker
                            //   .platform.pickFiles();
                            // if (filePicked != null) {
                            //   final file =
                            //       filePicked.files.single; // PlatformFile
                            //   final mimeType = lookupMimeType(file.name) ?? '';
                            //   print("file" + file.toString());
                            //
                            //   /// 2. Get presigned data somewhere
                            //   // const url = 'https://s3.amazonaws.com/......';
                            //   // final fields = {
                            //   //   'bucket': '...',
                            //   //   'X-Amz-Algorithm': 'AWS4-HMAC-SHA256',
                            //   //   'X-Amz-Credential': '...',
                            //   //   'X-Amz-Date': '...',
                            //   //   'Policy': '...',
                            //   //   'X-Amz-Signature': '...',
                            //   //   'x-amz-meta-userid': '...',
                            //   //   'Content-Type': mimeType,
                            //   //   'file': dio.MultipartFile.fromBytes(file.bytes ?? []),
                            //   // };
                            //
                            //   /// 3. Send file to AWS s3
                            //   // final formData = dio.FormData.fromMap(fields);
                            //   // await dio.Dio().post(url, data: formData);
                            // }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [Icon(Icons.image), Text("Upload Image")],
                          )),
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
                      Expanded(
                        child: Container(),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (validation(expensename, amount, img_path)) {
                                tourController.createexpense(
                                    tour_id: item[1],
                                    expenses_name: expensename,
                                    amount: amount.toString(),
                                    photo: img_path.toString());
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ),
                    ],
                  )
                : item[0] == 2
                    ? Expanded(
                        child: Column(children: [
                        Container(
                          height: 60,
                        ),
                        SizedBox(
                          height: 100,
                          child: TextField(
                            style: TextStyle(height: 3.0, color: Colors.black),
                            keyboardType: TextInputType.text,
                            onChanged: (value) => expensename = value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Daily Remark',
                              prefixIcon: Icon(Icons.comment),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (validation2(remark)) {
                                  tourController.createremark(
                                      tour_id: item[1],
                                      dailyremark: remark.toString());
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        )
                      ]))
                    : item[0] == 3
                        ? Expanded(
                            child: Column(children: [
                            Container(
                              height: 60,
                            ),
                            SizedBox(
                              height: 100,
                              child: TextField(
                                style:
                                    TextStyle(height: 3.0, color: Colors.black),
                                keyboardType: TextInputType.text,
                                onChanged: (value) => expensename = value,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Service Report',
                                  prefixIcon: Icon(Icons.comment),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Submit'),
                                ),
                              ),
                            )
                          ]))
                        : Expanded(
                            child: Column(children: [
                            Container(
                              height: 60,
                            ),
                            SizedBox(
                              height: 100,
                              child: TextField(
                                style:
                                    TextStyle(height: 3.0, color: Colors.black),
                                keyboardType: TextInputType.text,
                                onChanged: (value) => expensename = value,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Final Dignose',
                                  prefixIcon: Icon(Icons.comment),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Submit'),
                                ),
                              ),
                            )
                          ]))),
      ),
    );
  }

  bool validation(expensename, amount, imgpath) {
    if (expensename.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter expense name");
      return false;
    } else if (amount.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter amount");
      return false;
    } else if (imgpath.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please Any Select Image");
      return false;
    } else {
      return true;
    }
  }

  bool validation2(remark) {
    if (remark.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Remark");
      return false;
    } else {
      return true;
    }
  }
}
