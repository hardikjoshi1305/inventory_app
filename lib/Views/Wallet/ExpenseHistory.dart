import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/WalletController.dart';

import '../../Component/ExpenseListWidget.dart';

class ExpenseHistory extends StatefulWidget {
  const ExpenseHistory({Key key}) : super(key: key);

  @override
  State<ExpenseHistory> createState() => _ExpenseHistoryState();
}

var userid = "";

class _ExpenseHistoryState extends State<ExpenseHistory> {

  WalletController walletController = Get.put(WalletController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense History"),
      ),
      body: Obx(() => walletController.isLoading.value
          ? Container(child: Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),

                    Container(
                      child: TextField(
                        // controller: te_name
                        //   ..text = this.usermodel != null ? usermodel.name : "",
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          userid = value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'User ID',
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (userid.toString() != null) {
                            apicall(userid);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Enter Valid User ID");
                          }
                        },
                        child: Text("Search")),

                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
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
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(bottom: 16),
                                    itemCount:
                                        walletController.expensehistory.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (ctx, index) {
                                      var wallet = walletController
                                          .expensehistory
                                          .elementAt(index);
                                      return GestureDetector(
                                        // onTap: () => Get.to(
                                        //     () => UserTourDetails(),
                                        //     arguments: wallet.id.toString()),
                                        child: ExpenseListWidget(
                                            expenselist: wallet),
                                      );
                                    })
                                : Text("No Data Found"))
                          ],
                        ),
                      )),
                    ),
                    // Obx(() =>
                    // ListView(
                    //   scrollDirection: Axis.vertical,
                    //   // children: List.generate(upcomingController.search.length,
                    //   //     (index) => Text(code.toString()))
                    //   children: [...allinventory.map((element) => Text(element))],
                    // ),
                    //     ),
                    Container(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )),
    );
  }

  void apicall(String userid) async {
    await Future.delayed(Duration.zero);
    walletController.expenselist(userid);
  }
}
