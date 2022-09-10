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

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key key}) : super(key: key);

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  void initState() {
    getauthtoken();
    callapi();
    // upcomingController.pendingitem(iscompleted: "0");
    super.initState();
  }

  PendingController upcomingController = Get.put(PendingController());
  var userisvisible;
  callapi() async {
    await Future.delayed(Duration.zero);
    upcomingController.pendingitem(iscompleted: "0");
    await upcomingController.dashboardapi();
  }

  getauthtoken() async {
    var token = await SharedPreferenceHelper().getPref(TOKEN);
    print("token" + token.toString());
    userisvisible = await SharedPreferenceHelper().getPref(IsVISIBLE);
    print("userisvisible" + userisvisible.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserDrawer(userisvisible),
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
            upcomingController.dashboard.value.data != null
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
                                    .dashboard.value.data[0].userwallerAmt +
                                " \u{20B9}",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ))
                : Container(),
            upcomingController.dashboard.value.data != null
                ? Container(
                    margin: EdgeInsets.only(top: 7, left: 8, right: 8),
                    child: Text(
                      "You Have " +
                          upcomingController.dashboard.value.data[0].sendpart
                              .toString() +
                          " Parts",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  )
                : Container(),
            upcomingController.dashboard.value.data != null
                ? Container(
                    margin: EdgeInsets.only(top: 20, left: 8, right: 8),
                    child: Column(
                      children: [
                        ...upcomingController
                            .dashboard.value.data[0].adminsendAmt
                            .map((e) => Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    e.amount.toString() +
                                        "\u{20B9} credited in your wallet send by admin",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 15),
                                  ),
                                ))
                            .toList()
                      ],
                    ))
                : Container(),
            upcomingController.pending.length > 0
                ? Container(
                    // height: 400,
                    child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(
                            upcomingController.pending.length, (index) {
                          return Container(
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => TourDetailSubmission(),
                                        arguments: upcomingController
                                            .pending[index].id
                                            .toString());
                                    // CreateTourDetail());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                        elevation: 7,
                                        margin: EdgeInsets.only(
                                            top: 16, left: 16, right: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: Column(
                                              children: [
                                                Card(
                                                  color: Colors.orange,
                                                  elevation: 7,
                                                  margin: EdgeInsets.only(
                                                      top: 16,
                                                      left: 16,
                                                      right: 16),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 25,
                                                      alignment:
                                                          AlignmentDirectional
                                                              .center,
                                                      child: Text(
                                                        "Pending",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Tour Name ",
                                                          style:
                                                              Pendingitemtextstyle,
                                                        ),
                                                        Text("City ",
                                                            style:
                                                                Pendingitemtextstyle),
                                                        Text("Problem ",
                                                            style:
                                                                Pendingitemtextstyle),
                                                        Text("Date ",
                                                            style:
                                                                Pendingitemtextstyle),
                                                        Text("Total Expense ",
                                                            style:
                                                                Pendingitemtextstyle)
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("  :  ",
                                                            style:
                                                                Pendingitemtextstyle),
                                                        Text("  :  ",
                                                            style:
                                                                Pendingitemtextstyle),
                                                        Text("  :  ",
                                                            style:
                                                                Pendingitemtextstyle),
                                                        Text("  :  ",
                                                            style:
                                                                Pendingitemtextstyle),
                                                        Text("  :  ",
                                                            style:
                                                                Pendingitemtextstyle)
                                                      ],
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              upcomingController
                                                                  .pending[
                                                                      index]
                                                                  .tourname,
                                                              style:
                                                                  Pendingitemtextstyle,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            Text(
                                                                upcomingController
                                                                    .pending[
                                                                        index]
                                                                    .city,
                                                                style:
                                                                    Pendingitemtextstyle,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                            Text(
                                                                upcomingController
                                                                            .pending[
                                                                                index]
                                                                            .errorname !=
                                                                        null
                                                                    ? upcomingController
                                                                        .pending[
                                                                            index]
                                                                        .errorname
                                                                    : "-",
                                                                style:
                                                                    Pendingitemtextstyle,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                            Text(
                                                                getdateformate(
                                                                    upcomingController
                                                                        .pending[
                                                                            index]
                                                                        .createdAt),
                                                                style:
                                                                    Pendingitemtextstyle),
                                                            Text(
                                                                upcomingController
                                                                        .pending[
                                                                            index]
                                                                        .totalcount
                                                                        .toString() +
                                                                    " \u{20B9}",
                                                                style:
                                                                    Pendingitemtextstyle,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis)
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ))),
                                  )));
                        })),
                  )
                : Container(
                    child: nodatafound(),
                  ),
          ],
        ),
      ),
    );
  }
}
