import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/Controller/UserController.dart';
import 'package:inventory_management/Controller/WalletController.dart';

import '../../Component/ExpenseListWidget.dart';
import '../../Utility/CommandMethod.dart';

class ExpenseHistory extends StatefulWidget {
  const ExpenseHistory({Key key}) : super(key: key);

  @override
  State<ExpenseHistory> createState() => _ExpenseHistoryState();
}

var userid = "";
var id = "";
var showlist = false;

class _ExpenseHistoryState extends State<ExpenseHistory> {
  WalletController walletController = Get.put(WalletController());
  UserController userController = Get.put(UserController());
  apicallusername() async {
    await Future.delayed(Duration.zero);
    userController.fetchusernamelist();
  }

  @override
  void initState() {
    // getauthtoken();
    apicallusername();
    super.initState();
  }

  TextEditingController te_userid = TextEditingController();
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense History"),
      ),
      drawer: AdminDrawer(),
      body: Obx(() => Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Opacity(
                opacity:
                    1, // You can reduce this when loading to give different effect
                child: AbsorbPointer(
                  absorbing: walletController.isLoading.value,
                  child: screenbody(),
                ),
              ),
              Opacity(
                opacity: walletController.isLoading.value ? 1.0 : 0,
                child: CircularProgressIndicator(),
              ),
            ],
          )),
    );
  }

  datetimepicker(TextEditingController todate) async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        todate.text = formattedDate; //set output date to TextField value.
      });
    } else {}
  }

  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  Widget screenbody() {
    return Scrollbar(
        controller: _vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showlist = !showlist;
                      });
                    },
                    child: TextField(
                      enabled: false,
                      controller: te_userid,
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
                ),

                showlist
                    ? Card(
                        elevation: 7,
                        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Container(
                          height: 200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ...userController.usernamelist.value
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            te_userid..text = e.userid;
                                            setState(() {
                                              showlist = false;
                                              id = e.id.toString();
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  padding: EdgeInsets.only(
                                                      top: 15, bottom: 15),
                                                  child: Text(
                                                    e.userid,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  )),
                                              Divider(
                                                color: Colors.black,
                                                height: 1,
                                              )
                                            ],
                                          ),
                                        ))
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      datetimepicker(fromdate);
                    },
                    child: TextField(
                      controller: fromdate,
                      //   ..text = this.usermodel != null ? usermodel.name : "",
                      enabled: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'From Date',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      datetimepicker(todate);
                    },
                    child: TextField(
                      controller: todate,
                      //   ..text = this.usermodel != null ? usermodel.name : "",
                      enabled: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'To Date',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (fromdate.text.toString() != null &&
                          todate.text.toString() == null) {
                        Fluttertoast.showToast(msg: "To Date Require");
                      } else if (todate.text.toString() != null &&
                          fromdate.text.toString() == null) {
                        Fluttertoast.showToast(msg: "From Date Require");
                      } else {
                        apicall(id, fromdate.text.toString(),
                            todate.text.toString());
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Search",
                          style: TextStyle(fontSize: 16),
                        ))),

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
                    ? Scrollbar(
                        controller: _horizontal,
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          controller: _horizontal,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Container(
                            width: 700,
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
                                      var index = walletController
                                          .expensehistory
                                          .indexOf(element);
                                      var wallet = walletController
                                          .expensehistory
                                          .elementAt(index);
                                      return ExpenseListWidget(
                                          expenselist: wallet,
                                          position: index.toString());
                                    }).toList(growable: true)
                                  ],
                                )
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
                          ),
                        ))
                    : Text("No Data Found")),
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
        ));
  }

  void apicall(String userid, String fromdate, String todate) async {
    await Future.delayed(Duration.zero);
    walletController.expenselist(userid, fromdate, todate);
  }
}
