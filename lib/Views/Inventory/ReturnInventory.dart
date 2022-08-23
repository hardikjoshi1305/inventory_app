import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Return Inventory"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 88.0),
              child: Text(
                "code : " + usermodel.code,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "machine : " + usermodel.machine,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 5),
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
                        backgroundColor: CupertinoColors.systemGrey2,
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
                              ...inventoryController.inventorystatuslist
                                  .map((element) => GestureDetector(
                                        onTap: () {
                                          Get.back();
                                          setState(() {
                                            valueselected = "Status : " +
                                                element.statusName;
                                            statusid = element.id.toString();
                                          });
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Container(
                                              width: double.infinity,
                                              child: Card(
                                                elevation: 7,
                                                margin: EdgeInsets.only(
                                                    top: 16,
                                                    left: 16,
                                                    right: 16),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    child: Text(
                                                      element.statusName,
                                                      style: TextStyle(
                                                          fontSize: 17),
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
            Expanded(child: Text('')),
            Container(
              width: double.infinity,
              height: 60,
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (checkvalidation(valueselected.toString())) {}
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
    );
  }

  bool checkvalidation(String value) {
    if (value == null) {
      Fluttertoast.showToast(
          msg: "Please Select Status of Inventory",
          toastLength: Toast.LENGTH_LONG);
      return false;
    } else {
      return true;
    }
  }
}
