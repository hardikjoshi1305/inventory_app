import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/PendingController.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Inventory/UserCurrentInventory.dart';
import 'package:inventory_management/Views/Tour/CreatTourDetail.dart';

import '../../Utility/CommandMethod.dart';
import '../../Utility/TextStyle.dart';
import '../Tour/TourDetailSubmission.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<AdminDashboard> {
  @override
  void initState() {
    callapi();
    getauthtoken();

    // upcomingController.pendingitem(iscompleted: "0");
    super.initState();
  }

  PendingController upcomingController = Get.put(PendingController());

  callapi() async {
    await Future.delayed(Duration.zero);
    // upcomingController.pendingitem(iscompleted: "0");
    await upcomingController.admindashboardapi();
  }

  getauthtoken() async {
    var token = await SharedPreferenceHelper().getPref(TOKEN);
    print("token" + token.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text('Argon Medical'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Obx(() => Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Opacity(
                        opacity:
                            1, // You can reduce this when loading to give different effect
                        child: AbsorbPointer(
                          absorbing: upcomingController.isLoading.value,
                          child: screenbody(),
                        ),
                      ),
                      Opacity(
                        opacity: upcomingController.isLoading.value ? 1.0 : 0,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )))
        ],
      ),
    );
  }

  Widget screenbody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            upcomingController.admindashboarddata.value.data != null
                ? Container(
                    alignment: AlignmentDirectional.topEnd,
                    margin: EdgeInsets.only(right: 20, top: 6, bottom: 12),
                    child: Container(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        child: Text(
                            "Wallet Balance : " +
                                upcomingController
                                    .admindashboarddata.value.data[0].totalamot
                                    .toString() +
                                " \u{20B9}",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ))
                : Container(),
            upcomingController.admindashboarddata.value.data != null
                ? upcomingController
                .admindashboarddata.value.data[0].expensepending.toString() == "0"?Container():
            Container(
                    margin: EdgeInsets.only(top: 37, left: 8, right: 8),
                    child: Text(
                      "You Have " +
                          upcomingController
                              .admindashboarddata.value.data[0].expensepending
                              .toString()
                              .toString() +
                          " Expense Pending ",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  )
                : Container(),
            upcomingController.admindashboarddata.value.data != null
                ?  upcomingController
                .admindashboarddata.value.data[0].returnpending.toString() == "0"?Container():
            Container(
                    margin: EdgeInsets.only(top: 7, left: 8, right: 8),
                    child: Text(
                      "You Have " +
                          upcomingController
                              .admindashboarddata.value.data[0].returnpending
                              .toString()
                              .toString() +
                          " Return Parts ",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  )
                : Container(),
            upcomingController.admindashboarddata.value.data != null
                ? upcomingController.admindashboarddata.value.data[0]
                            .adminsendpart.length >
                        0
                    ? Container(
                        margin: EdgeInsets.only(top: 80),
                        alignment: AlignmentDirectional.center,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                toptitle(115.0, "UserId"),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                toptitle(130.0, "Inventory Name"),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                toptitle(115.0, "Code"),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Container(
                              // height: 400,
                              child: ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                      upcomingController
                                          .admindashboarddata
                                          .value
                                          .data[0]
                                          .adminsendpart
                                          .length, (index) {
                                    return Container(
                                        child: GestureDetector(
                                            // onTap: () {
                                            //   Get.to(() => TourDetailSubmission(),
                                            //       arguments: upcomingController
                                            //           .admindashboarddata.value.data[0].adminsendpart[index].id
                                            //           .toString());
                                            //   // CreateTourDetail());
                                            // },
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    bottomtitle(
                                                        115.0,
                                                        upcomingController
                                                            .admindashboarddata
                                                            .value
                                                            .data[0]
                                                            .adminsendpart[
                                                                index]
                                                            .userId),
                                                    Container(
                                                      width: 1,
                                                      color: Colors.white,
                                                    ),
                                                    bottomtitle(
                                                        130.0,
                                                        upcomingController
                                                            .admindashboarddata
                                                            .value
                                                            .data[0]
                                                            .adminsendpart[
                                                                index]
                                                            .name),
                                                    Container(
                                                      width: 1,
                                                      color: Colors.white,
                                                    ),
                                                    bottomtitle(
                                                        115.0,
                                                        upcomingController
                                                            .admindashboarddata
                                                            .value
                                                            .data[0]
                                                            .adminsendpart[
                                                                index]
                                                            .code),
                                                    Container(
                                                      width: 1,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ))));
                                  })),
                            )
                          ],
                        ),
                      )
                    : Container(
                        child: nodatafound(),
                      )
                : Container(
                    child: nodatafound(),
                  )
          ],
        ),
      ),
    );
  }
}
