import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Component/WalletListWidget.dart';
import 'package:inventory_management/Controller/WalletController.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';
import 'package:inventory_management/Views/Inventory/UserCurrentInventory.dart';

import '../../Utility/CommandMethod.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    callapi();
    // upcomingController.wallethistorydata();

    // upcomingController.pendingitem(iscompleted: "0");
    super.initState();
  }

  WalletController upcomingController = Get.put(WalletController());

  callapi() async {
    await Future.delayed(Duration.zero);
    upcomingController.wallethistorydata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wallet"),
        ),
        drawer: UserDrawer(userisvisible),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      color: Colors.blueGrey[900],
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.wallet,
                            color: Colors.white,
                          ),
                          Container(
                            width: 10,
                            height: 0,
                          ),
                          Text(
                            " Balance :",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Container(
                            width: 10,
                            height: 0,
                          ),
                          Obx(
                            () => upcomingController.wallethistory.length > 0
                                ? Text(
                                    "${upcomingController.wallethistory[0].walletBalance} \u{20B9}",
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  )
                                : Text(
                                    "0 \u{20B9}",
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  ),
                          ),
                        ],
                      )),
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
                              "    Transcation History",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Divider(
                              color: Colors.grey,
                              height: 3,
                            ),
                          ),
                          Obx(() => upcomingController.wallethistory.length > 0
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              toptitle(120.0, "Credit"),
                                              Container(
                                                width: 1,
                                                color: Colors.white,
                                              ),
                                              toptitle(120.0, "Debit"),
                                              Container(
                                                width: 1,
                                                color: Colors.white,
                                              ),
                                              toptitle(150.0, "Detail"),
                                              Container(
                                                width: 1,
                                                color: Colors.white,
                                              ),
                                              toptitle(150.0, "Status"),
                                              Container(
                                                width: 1,
                                                color: Colors.white,
                                              ),
                                              toptitle(160.0, "Date"),
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
                                              ...upcomingController
                                                  .wallethistory
                                                  .map((element) {
                                                var index = upcomingController
                                                    .wallethistory
                                                    .indexOf(element);
                                                var wallet = upcomingController
                                                    .wallethistory
                                                    .elementAt(index);
                                                return WalletListWidget(
                                                    walletmodel: wallet);
                                              }).toList()
                                            ],
                                          )
                                          // ListView.builder(
                                          //     shrinkWrap: true,
                                          //     padding:
                                          //         EdgeInsets.only(bottom: 16),
                                          //     itemCount: upcomingController
                                          //         .wallethistory.length,
                                          //     physics:
                                          //         NeverScrollableScrollPhysics(),
                                          //     itemBuilder: (ctx, index) {
                                          //       var wallet = upcomingController
                                          //           .wallethistory
                                          //           .elementAt(index);
                                          //       return WalletListWidget(
                                          //           walletmodel: wallet);
                                          //     })
                                        ],
                                      ),
                                    ),
                                  ))
                              : Text("No Data Found"))
                        ],
                      ),
                    )),
                  )
                ],
              )),
        ));
  }
}
