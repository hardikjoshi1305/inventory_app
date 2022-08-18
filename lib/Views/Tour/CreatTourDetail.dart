import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';

class CreateTourDetail extends StatefulWidget {
  const CreateTourDetail({Key key}) : super(key: key);

  @override
  State<CreateTourDetail> createState() => _CreateTourDetailState();
}

class _CreateTourDetailState extends State<CreateTourDetail> {
  var expensename,amount,remark,photo,daily_remark,final_dignose,servicereport;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Create Trip"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
              ElevatedButton(onPressed: () async {
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
              }, child: Text("Upload Image")),
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
                      child: const Text('Next'),
                      onPressed: () {
                        // print('data:$tourname');
                        // print('data:$city');
                        // print('data:$problem');
                        // if(validatetourdetail(tourname,city,problem)){
                        //   tourController.creattour(tourname: tourname,problem: problem,city: city);
                        // }
                        //   logincontroller.fetchLogin(number:phoneController.value.text,password:passwordController.value.text);
                        //   // loginuser(phoneController.value.text, passwordController.value.text, context);
                        // }
                      },
                    )
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
