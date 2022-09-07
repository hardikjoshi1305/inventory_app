import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Model/AssignInventoryResponse.dart';
import 'package:inventory_management/Model/InventoryStatusResponse.dart'
    as status;

class ReturnInventory extends StatefulWidget {
  const ReturnInventory({Key key}) : super(key: key);

  @override
  State<ReturnInventory> createState() => _ReturnInventoryState();
}

class _ReturnInventoryState extends State<ReturnInventory> {
  Datum usermodel = Get.arguments as Datum;
  InventoryController inventoryController = Get.find();
  String valueselected = "";
  String statusid = "";
  String imgpatth = "";
  String remark = "";
  TextEditingController te_imgpath = TextEditingController();

  apicall() async {
    await Future.delayed(Duration.zero);
    inventoryController.fetchstatuslist();
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  void dispose() {
    te_imgpath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Return Inventory"),
        ),
        body: Obx(() => inventoryController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 88.0),
                              child: Text(
                                "code : " + usermodel.code,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "name : " + usermodel.name,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "machine : " + usermodel.machine,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 30, right: 30),
                              child: TextField(
                                // controller: te_name
                                //   ..text = this.usermodel != null ? usermodel.name : "",
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  remark = value;
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.chat_bubble),
                                  labelText: 'Remark',
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 28.0, bottom: 5),
                              child: Text(
                                valueselected,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            ElevatedButton(
                                onPressed: () => Get.defaultDialog(
                                        barrierDismissible: false,
                                        backgroundColor:
                                            CupertinoColors.systemGrey2,
                                        title: "Status ",
                                        middleText: "",
                                        titleStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        middleTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        actions: [
                                          Column(
                                            children: [
                                              ...inventoryController
                                                  .inventorystatuslist
                                                  .map(
                                                      (element) =>
                                                          GestureDetector(
                                                            onTap: () {
                                                              Get.back();
                                                              setState(() {
                                                                valueselected =
                                                                    "Status : " +
                                                                        element
                                                                            .statusName;
                                                                statusid = element
                                                                    .id
                                                                    .toString();
                                                              });
                                                            },
                                                            child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child: Card(
                                                                    elevation:
                                                                        7,
                                                                    margin: EdgeInsets.only(
                                                                        top: 16,
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            AlignmentDirectional.center,
                                                                        child:
                                                                            Text(
                                                                          element
                                                                              .statusName,
                                                                          style:
                                                                              TextStyle(fontSize: 17),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )),
                                                          ))
                                                  .toList()
                                            ],
                                          )
                                        ]),
                                child: Text('Select Status')),
                            // Expanded(child: Text('')),

                            Container(
                              child: TextField(
                                enabled: false,
                                controller: te_imgpath..text,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      var image = await ImagePicker.pickImage(
                                          source: ImageSource.gallery);
                                      // print("object" + image.toString());
                                      print("object" + image.absolute.path);
                                      imgpatth = image.absolute.path;
                                      String fff = imgpatth.split("/").last;
                                      te_imgpath..text = fff;
                                    } catch (exception) {
                                      print("object" + exception.toString());
                                      Fluttertoast.showToast(
                                          msg: exception.toString());
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.photo),
                                      Text('Gallary')
                                    ],
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.all(6),
                              child: Text("OR"),
                            ),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      var image = await ImagePicker.pickImage(
                                          source: ImageSource.camera);
                                      // print("object" + image.toString());
                                      print("object" + image.absolute.path);
                                      imgpatth = image.absolute.path;
                                      String fff = imgpatth.split("/").last;
                                      te_imgpath..text = fff;
                                    } catch (exception) {
                                      print("object" + exception.toString());
                                      Fluttertoast.showToast(
                                          msg: exception.toString());
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.camera_alt),
                                      Text('Camera')
                                    ],
                                  )),
                            ),

                            Container(
                              width: double.infinity,
                              height: 60,
                              margin: EdgeInsets.only(top: 100),
                              child: Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (checkvalidation(
                                          valueselected.toString(), remark)) {
                                        inventoryController.returninventory(
                                            this.usermodel,
                                            statusid,
                                            imgpatth,
                                            remark);
                                      }
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(fontSize: 20),
                                    )),
                              ),
                            )

                            // DropdownButton<String>(
                            //   hint: Text('Please choose a location'),
                            //   value: valueselected,
                            //   onChanged: ((newvalue) => setState(() {
                            //         valueselected = newvalue.toString();
                            //         // status_id = value;
                            //       })),
                            //   items: inventoryController.inventorystatuslist.value
                            //       .map((status.Datum element) {
                            //     return DropdownMenuItem(
                            //       child: Text(
                            //         element.statusName,
                            //         style: TextStyle(color: Colors.black, fontSize: 18),
                            //       ),
                            //       value: element.statusName,
                            //     );
                            //   }).toList(),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }

  bool checkvalidation(String value, String remark) {
    if (value == "") {
      Fluttertoast.showToast(
          msg: "Please Select Status of Inventory",
          toastLength: Toast.LENGTH_LONG);
      return false;
    } else if (remark == "") {
      Fluttertoast.showToast(
          msg: "Please Add Remark", toastLength: Toast.LENGTH_LONG);
      return false;
    } else {
      return true;
    }
  }
}
