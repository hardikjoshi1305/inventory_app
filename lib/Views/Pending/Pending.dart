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

class Pending extends StatefulWidget {
  const Pending({Key key}) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
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
    upcomingController.pendingitem(iscompleted: "0");
  }

  getauthtoken() async {
    var token = await SharedPreferenceHelper().getPref(TOKEN);
    print("token" + token.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserDrawer(),
      appBar: UserAppBar(),
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
    return upcomingController.pending.length > 0
        ? Container(
            child: ListView(
                children:
                    List.generate(upcomingController.pending.length, (index) {
              return Container(
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => TourDetailSubmission(),
                            arguments: upcomingController.pending[index].id
                                .toString());
                        // CreateTourDetail());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                            elevation: 7,
                            margin:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Column(
                                  children: [
                                    Card(
                                      color: Colors.orange,
                                      elevation: 7,
                                      margin: EdgeInsets.only(
                                          top: 16, left: 16, right: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 25,
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Text(
                                            "Pending",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tour Name ",
                                              style: Pendingitemtextstyle,
                                            ),
                                            Text("City ",
                                                style: Pendingitemtextstyle),
                                            Text("Problem ",
                                                style: Pendingitemtextstyle),
                                            Text("Date ",
                                                style: Pendingitemtextstyle),
                                            Text("Total Expense ",
                                                style: Pendingitemtextstyle)
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("  :  ",
                                                style: Pendingitemtextstyle),
                                            Text("  :  ",
                                                style: Pendingitemtextstyle),
                                            Text("  :  ",
                                                style: Pendingitemtextstyle),
                                            Text("  :  ",
                                                style: Pendingitemtextstyle),
                                            Text("  :  ",
                                                style: Pendingitemtextstyle)
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                                upcomingController
                                                    .pending[index].tourname,
                                                style: Pendingitemtextstyle),
                                            Text(
                                                upcomingController
                                                    .pending[index].city,
                                                style: Pendingitemtextstyle),
                                            Text(
                                                upcomingController
                                                            .pending[index]
                                                            .errorname !=
                                                        null
                                                    ? upcomingController
                                                        .pending[index]
                                                        .errorname
                                                    : "-",
                                                style: Pendingitemtextstyle),
                                            Text(
                                                getdateformate(
                                                    upcomingController
                                                        .pending[index]
                                                        .createdAt),
                                                style: Pendingitemtextstyle),
                                            Text(
                                                upcomingController
                                                        .pending[index]
                                                        .totalcount
                                                        .toString() +
                                                    " \u{20B9}",
                                                style: Pendingitemtextstyle)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
                      )));
            })),
          )
        : nodatafound();
  }
}
