import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_management/Controller/WalletController.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';

import '../../Component/ExpenseListWidget.dart';
import '../../Controller/TourController.dart';
import '../../Utility/CommandMethod.dart';

class AddExpense extends StatefulWidget {
  final String itemid;
  const AddExpense({this.itemid, Key key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  var expensename, amount;
  String img_path = "";
  TextEditingController te_imgpath = TextEditingController();
  TourController tourController = Get.put(TourController());
  WalletController walletController = Get.put(WalletController());
  @override
  void dispose() {
    te_imgpath.dispose();
    print("dispose");
    super.dispose();
  }

  addexpenselist() async {
    String userid = await SharedPreferenceHelper().getPref(Userid);
    walletController.addexpenselist(userid, widget.itemid);
  }

  @override
  void initState() {
    addexpenselist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
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
                keyboardType: TextInputType.text,
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
              Container(
                child: TextField(
                  enabled: false,
                  controller: te_imgpath..text,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Container(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      var image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      // print("object" + image.toString());
                      print("object" + image.absolute.path);
                      img_path = image.absolute.path;
                      String fff = img_path.split("/").last;
                      te_imgpath..text = fff;
                    } catch (exception) {
                      print("object" + exception.toString());
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 7),
                        child: Icon(Icons.image),
                      ),
                      Text("Upload Image")
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "OR",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        var image = await ImagePicker.pickImage(
                            source: ImageSource.camera);
                        // print("object" + image.toString());
                        print("object" + image.absolute.path);
                        img_path = image.absolute.path;
                        String fff = img_path.split("/").last;
                        te_imgpath..text = fff;
                      } catch (exception) {
                        print("object" + exception.toString());
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 7),
                          child: Icon(Icons.camera_alt),
                        ),
                        Text("Capture")
                      ],
                    )),
              ),
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
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            alignment: AlignmentDirectional.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                if (validation(expensename, amount)) {
                  tourController.createexpense(
                      tour_id: widget.itemid,
                      expenses_name: expensename,
                      amount: amount.toString(),
                      photo: img_path.toString());
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                alignment: AlignmentDirectional.center,
                child: Text('Submit'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
                child: Container(
              child: Column(
                children: [
                  Divider(
                    color: Colors.black,
                    height: 3,
                  ),
                  Container(
                    height: 10,
                    width: 0,
                  ),
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "    Expense History",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Divider(
                      color: Colors.grey,
                      height: 3,
                    ),
                  ),
                  Obx(() => walletController.expensehistory.length > 0
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  toptitle(120.0, "Action"),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  toptitle(100.0, "Tour"),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  toptitle(100.0, "Expense"),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  toptitle(100.0, "Amount"),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  toptitle(100.0, "Date"),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  toptitle(100.0, "Image"),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  ...walletController.expensehistory
                                      .map((element) {
                                    var index = walletController.expensehistory
                                        .indexOf(element);
                                    var wallet = walletController.expensehistory
                                        .elementAt(index);
                                    return ExpenseListWidget(
                                        expenselist: wallet, position: index);
                                  }).toList(growable: true)
                                ],
                              ),

                              // ListView.builder(
                              //     shrinkWrap: true,
                              //     padding: EdgeInsets.only(bottom: 16),
                              //     itemCount:
                              //     walletController.expensehistory.length,
                              //     physics: NeverScrollableScrollPhysics(),
                              //     itemBuilder: (ctx, index) {
                              //       var wallet = walletController
                              //           .expensehistory
                              //           .elementAt(index);
                              //       return GestureDetector(
                              //         // onTap: () => Get.to(
                              //         //     () => UserTourDetails(),
                              //         //     arguments: wallet.id.toString()),
                              //         child: ExpenseListWidget(
                              //             expenselist: wallet,
                              //             position: index),
                              //       );
                              //     }),
                            ],
                          ),
                        )
                      : Text("No Data Found"))
                ],
              ),
            )),
          ),
        ],
      )),
    );
  }
}

bool validation(expensename, amount) {
  if (expensename.toString().isEmpty) {
    Fluttertoast.showToast(msg: "Please Enter expense name");
    return false;
  } else if (amount.toString().isEmpty) {
    Fluttertoast.showToast(msg: "Please Enter amount");
    return false;
  }
  // else if (imgpath.toString().isEmpty) {
  //   Fluttertoast.showToast(msg: "Please Any Select Image");
  //   return false;
  // }
  else {
    return true;
  }
}
