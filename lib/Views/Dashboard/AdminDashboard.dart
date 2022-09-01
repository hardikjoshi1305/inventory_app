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
    getauthtoken();
    callapi();
    // upcomingController.pendingitem(iscompleted: "0");
    super.initState();
  }

  PendingController upcomingController = Get.put(PendingController());

  callapi() async {
    await Future.delayed(Duration.zero);
    // upcomingController.pendingitem(iscompleted: "0");
    upcomingController.admindashboardapi();
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
                ? Container(
                    margin: EdgeInsets.only(top: 7, left: 8, right: 8),
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
                ? Container(
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
            // upcomingController.pending.length > 0
            //     ? Container(
            //   // height: 400,
            //   child: ListView(
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //       children: List.generate(
            //           upcomingController.pending.length, (index) {
            //         return Container(
            //             child: GestureDetector(
            //                 onTap: () {
            //                   Get.to(() => TourDetailSubmission(),
            //                       arguments: upcomingController
            //                           .pending[index].id
            //                           .toString());
            //                   // CreateTourDetail());
            //                 },
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(10.0),
            //                   child: Card(
            //                       elevation: 7,
            //                       margin: EdgeInsets.only(
            //                           top: 16, left: 16, right: 16),
            //                       shape: RoundedRectangleBorder(
            //                         borderRadius:
            //                         BorderRadius.circular(10),
            //                       ),
            //                       child: Padding(
            //                           padding: const EdgeInsets.all(17.0),
            //                           child: Column(
            //                             children: [
            //                               Card(
            //                                 color: Colors.orange,
            //                                 elevation: 7,
            //                                 margin: EdgeInsets.only(
            //                                     top: 16,
            //                                     left: 16,
            //                                     right: 16),
            //                                 shape: RoundedRectangleBorder(
            //                                   borderRadius:
            //                                   BorderRadius.circular(
            //                                       10),
            //                                 ),
            //                                 child: Padding(
            //                                   padding:
            //                                   const EdgeInsets.all(
            //                                       8.0),
            //                                   child: Container(
            //                                     width: double.infinity,
            //                                     height: 25,
            //                                     alignment:
            //                                     AlignmentDirectional
            //                                         .center,
            //                                     child: Text(
            //                                       "Pending",
            //                                       style: TextStyle(
            //                                           fontSize: 20,
            //                                           color: Colors.white,
            //                                           fontWeight:
            //                                           FontWeight
            //                                               .bold),
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ),
            //                               Container(
            //                                 height: 15,
            //                               ),
            //                               Row(
            //                                 mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                                 children: [
            //                                   Column(
            //                                     crossAxisAlignment:
            //                                     CrossAxisAlignment
            //                                         .start,
            //                                     children: [
            //                                       Text(
            //                                         "Tour Name ",
            //                                         style:
            //                                         Pendingitemtextstyle,
            //                                       ),
            //                                       Text("City ",
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text("Problem ",
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text("Date ",
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text("Total Expense ",
            //                                           style:
            //                                           Pendingitemtextstyle)
            //                                     ],
            //                                   ),
            //                                   Column(
            //                                     children: [
            //                                       Text("  :  ",
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text("  :  ",
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text("  :  ",
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text("  :  ",
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text("  :  ",
            //                                           style:
            //                                           Pendingitemtextstyle)
            //                                     ],
            //                                   ),
            //                                   Column(
            //                                     children: [
            //                                       Text(
            //                                           upcomingController
            //                                               .pending[index]
            //                                               .tourname,
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text(
            //                                           upcomingController
            //                                               .pending[index]
            //                                               .city,
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text(
            //                                           upcomingController
            //                                               .pending[
            //                                           index]
            //                                               .errorname !=
            //                                               null
            //                                               ? upcomingController
            //                                               .pending[
            //                                           index]
            //                                               .errorname
            //                                               : "-",
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text(
            //                                           getdateformate(
            //                                               upcomingController
            //                                                   .pending[
            //                                               index]
            //                                                   .createdAt),
            //                                           style:
            //                                           Pendingitemtextstyle),
            //                                       Text(
            //                                           upcomingController
            //                                               .pending[
            //                                           index]
            //                                               .totalcount
            //                                               .toString() +
            //                                               " \u{20B9}",
            //                                           style:
            //                                           Pendingitemtextstyle)
            //                                     ],
            //                                   ),
            //                                 ],
            //                               ),
            //                             ],
            //                           ))),
            //                 )));
            //       })),
            // )
            //     : Container(
            //   child: nodatafound(),
            // ),
          ],
        ),
      ),
    );
  }
}
