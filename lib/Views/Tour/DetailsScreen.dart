import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Model/ExpenseListDetailsResponse.dart'
    as ecpense;
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Wallet/ExpenseHistory.dart';

import '../../Controller/WalletController.dart';
import '../../Utility/CommandMethod.dart';
import 'UserTourDetail.dart';

class DetailsScreen extends StatefulWidget {
  final String position;
  final String Fromscren;
  final String id;
  final String tourid;
  const DetailsScreen(this.position, this.Fromscren, this.id, this.tourid,
      {Key key})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ecpense.Datum expenehistory = Get.arguments as ecpense.Datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Card(
              elevation: 7,
              margin: EdgeInsets.only(top: 5, left: 5, right: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "Tour Name",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        expenehistory.tourname,
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 3,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "Expense",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        expenehistory.expensesName,
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 3,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "Amount",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        expenehistory.amount + " \u{20B9}",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 3,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "Date",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        getdateformate2(expenehistory.createdAt),
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 3,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "Status",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    widget.position != "user"
                        ? Container(
                            width: 120.0,
                            height: 40,
                            color: Colors.white,
                            child: expenehistory.isApproved == "0"
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.defaultDialog(
                                            title: "Alert",
                                            middleText:
                                                "Are you Sure You Want to accept " +
                                                    expenehistory.expensesName +
                                                    " expense" +
                                                    "?",
                                            actions: [
                                              cancelbutton(),
                                              confirmbutton("1")
                                            ],
                                            // textConfirm: "Confirm",
                                            // confirmTextColor: Colors.white,
                                          );
                                        },
                                        child: Container(
                                          color: Colors.green,
                                          margin: EdgeInsets.only(right: 15),
                                          padding: EdgeInsets.all(7),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.defaultDialog(
                                            title: "Alert",
                                            middleText:
                                                "Are you Sure You Want to Reject " +
                                                    expenehistory.expensesName +
                                                    " expense" +
                                                    "?",
                                            actions: [
                                              cancelbutton(),
                                              confirmbutton("2")
                                            ],
                                            // textConfirm: "Confirm",
                                            // confirmTextColor: Colors.white,
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 15),
                                          color: Colors.red,
                                          padding: EdgeInsets.all(7),
                                          child: Icon(
                                            Icons.cancel,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : expenehistory.isApproved == "1"
                                    ? GestureDetector(
                                        child: Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            margin: EdgeInsets.only(right: 10),
                                            padding: EdgeInsets.all(3),
                                            child: Text("Approved",
                                                style: TextStyle(
                                                    color: Colors.green))),
                                      )
                                    : expenehistory.isApproved == "2"
                                        ? GestureDetector(
                                            child: Container(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                padding: EdgeInsets.all(3),
                                                child: Text(
                                                  "Rejected",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )),
                                          )
                                        : Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Text("-"),
                                          ))
                        : Container(),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget cancelbutton() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel"));
  }

  Widget confirmbutton(String s) {
    return ElevatedButton(
        onPressed: () {
          acceptrejectorderapi(s, expenehistory.id.toString());
          Get.back();
        },
        child: Text("Confirm"));
  }

  void acceptrejectorderapi(String is_approved, String expense_id) async {
    WalletController walletController = Get.put(WalletController());
    await Future.delayed(Duration.zero);
    walletController.acceptreject(
        is_approved, expense_id, int.parse(widget.position));
    widget.Fromscren == "usertour"
        ? Get.to(() => UserTourDetails("admin", widget.id),
            arguments: widget.tourid)
        : Get.to(() => ExpenseHistory());
  }
}
