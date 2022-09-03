import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/TourController.dart';
import 'package:inventory_management/Controller/WalletController.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Utility/Imagedisplay.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Component/ExpenseListWidget.dart';
import '../../Utility/CONSTANT.dart';
import '../../Utility/SharedPreferenceHelper.dart';

class UserTourDetails extends StatefulWidget {
  const UserTourDetails({Key key}) : super(key: key);

  @override
  State<UserTourDetails> createState() => _UserTourDetailsState();
}

TourController tourController = Get.put(TourController());
WalletController walletController = Get.put(WalletController());

class _UserTourDetailsState extends State<UserTourDetails> {
  String tourid = Get.arguments as String;

  apicall(String tourid) async {
    await Future.delayed(Duration.zero);
    tourController.usertourdetail(tourid);
    String userid = await SharedPreferenceHelper().getPref(Userid);

    walletController.addexpenselist(userid, tourid);
  }

  @override
  void initState() {
    apicall(tourid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tour Details"),
      ),
      body: Obx(() => tourController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Daily Remark",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      tourController.usertourdetails.value.data != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: tourController.usertourdetails.value
                                  .data.dailyremark.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 7,
                                  margin: EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        child: ListTile(
                                          title: Text(tourController
                                              .usertourdetails
                                              .value
                                              .data
                                              .dailyremark[index]
                                              .dailyremark),
                                          subtitle: Text(getdateformate(
                                              tourController
                                                  .usertourdetails
                                                  .value
                                                  .data
                                                  .dailyremark[index]
                                                  .createdAt)),
                                        ),
                                      ),
                                      onTap: () {}),
                                );
                              },
                            )
                          : nodatafound(),
                      Container(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Service Report",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      tourController.usertourdetails.value.data != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: tourController.usertourdetails.value
                                  .data.servicereport.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 7,
                                  margin: EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        child: ListTile(
                                          title: Text(
                                            tourController
                                                .usertourdetails
                                                .value
                                                .data
                                                .servicereport[index]
                                                .serviceReport,
                                            style: TextStyle(
                                                color:
                                                    CupertinoColors.activeBlue),
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        if (!await launchUrl(Uri.parse(
                                            "http://pankrutiinfotech.com/inventory_app/public/" +
                                                tourController
                                                    .usertourdetails
                                                    .value
                                                    .data
                                                    .servicereport[index]
                                                    .serviceReport))) {
                                          throw 'Could not launch ';
                                        }
                                        // Get.to(() => Imagedisplay(
                                        //     imgurl: tourController
                                        //         .usertourdetails
                                        //         .value
                                        //         .data
                                        //         .servicereport[index]
                                        //         .serviceReport));
                                      }),
                                );
                              },
                            )
                          : nodatafound(),
                      Container(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Final Dignose",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      tourController.usertourdetails.value.data != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: tourController.usertourdetails.value
                                  .data.finaldignose.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 7,
                                  margin: EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        child: ListTile(
                                          title: Text(
                                            tourController
                                                .usertourdetails
                                                .value
                                                .data
                                                .finaldignose[index]
                                                .finalDignose,
                                            style: TextStyle(
                                                color: CupertinoColors.black),
                                          ),
                                          subtitle: Text(getdateformate(
                                              tourController
                                                  .usertourdetails
                                                  .value
                                                  .data
                                                  .finaldignose[index]
                                                  .createdAt)),
                                        ),
                                      ),
                                      onTap: () {
                                        // Get.to(() => Imagedisplay(),
                                        //     arguments: tourController
                                        //         .usertourdetails
                                        //         .value
                                        //         .data
                                        //         .servicereport[index]
                                        //         .serviceReport);
                                      }),
                                );
                              },
                            )
                          : nodatafound(),
                      Container(
                        height: 20,
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
                              Obx(() => walletController.expensehistory.length >
                                      0
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
                                                var index = walletController
                                                    .expensehistory
                                                    .indexOf(element);
                                                var wallet = walletController
                                                    .expensehistory
                                                    .elementAt(index);
                                                return ExpenseListWidget(
                                                    expenselist: wallet,
                                                    position: index);
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
            )),
    );
  }
}
