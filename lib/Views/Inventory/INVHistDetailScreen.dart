import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Model/InventoryHistoryResponse.dart'
    as inventoryhistory;
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Pending/PendingExpense.dart';

import '../../Controller/WalletController.dart';
import '../../Utility/CommandMethod.dart';

class INVHistDetailScreen extends StatefulWidget {
  final String position;
  const INVHistDetailScreen(this.position, {Key key}) : super(key: key);

  @override
  State<INVHistDetailScreen> createState() => _INVHistDetailScreenState();
}

class _INVHistDetailScreenState extends State<INVHistDetailScreen> {
  inventoryhistory.Datum expenehistory =
      Get.arguments as inventoryhistory.Datum;

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
                        "User Name",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        expenehistory.userid.toString(),
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
                        "History",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        expenehistory.invHistory != null
                            ? expenehistory.invHistory
                            : "-",
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
                        expenehistory.currDate != null
                            ? expenehistory.currDate
                            : "-",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 3,
                      color: Colors.grey,
                    ),
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
    Get.to(() => PendingExpense());
  }
}
