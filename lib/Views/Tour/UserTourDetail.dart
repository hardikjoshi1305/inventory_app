import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/TourController.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Utility/Imagedisplay.dart';

class UserTourDetails extends StatefulWidget {
  const UserTourDetails({Key key}) : super(key: key);

  @override
  State<UserTourDetails> createState() => _UserTourDetailsState();
}

TourController tourController = Get.put(TourController());

class _UserTourDetailsState extends State<UserTourDetails> {
  String tourid = Get.arguments as String;

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
                                      onTap: () {
                                        Get.to(() => Imagedisplay(
                                            imgurl: tourController
                                                .usertourdetails
                                                .value
                                                .data
                                                .servicereport[index]
                                                .serviceReport));
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
                          : nodatafound()
                    ],
                  )),
            )),
    );
  }

  void apicall(String tourid) async {
    await Future.delayed(Duration.zero);
    tourController.usertourdetail(tourid);
  }
}
