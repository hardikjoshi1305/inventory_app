import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Views/Pending/PendingDetailScreen.dart';

import '../../Component/PendingExpenseListWidget.dart';
import '../../Controller/PendingController.dart';
import '../../Utility/CONSTANT.dart';
import '../../Utility/CommandMethod.dart';
import '../../Utility/SharedPreferenceHelper.dart';
import '../Tour/DetailsScreen.dart';

class PendingExpense extends StatefulWidget {
  const PendingExpense({Key key}) : super(key: key);

  @override
  State<PendingExpense> createState() => _PendingExpenseState();
}

var userisvisible;
getauthtoken() async {
  var token = await SharedPreferenceHelper().getPref(TOKEN);
  userisvisible = await SharedPreferenceHelper().getPref(IsVISIBLE);

  print("token" + token.toString());
}

class _PendingExpenseState extends State<PendingExpense> {
  @override
  void initState() {
    // getauthtoken();
    callapi();
    // upcomingController.pendingitem(iscompleted: "0");
    super.initState();
  }

  PendingController upcomingController = Get.put(PendingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pending Expense"),
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
                    absorbing: upcomingController.isLoading.value,
                    child: screenbody(),
                  ),
                ),
                Opacity(
                  opacity: upcomingController.isLoading.value ? 1.0 : 0,
                  child: CircularProgressIndicator(),
                ),
              ],
            )));
  }

  Widget screenbody() {
    return upcomingController.pendingexpenselist.length > 0
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
                    toptitle(100.0, "User"),
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
                    ...upcomingController.pendingexpenselist.map((element) {
                      var index = upcomingController.pendingexpenselist
                          .indexOf(element);
                      var wallet = upcomingController.pendingexpenselist
                          .elementAt(index);
                      return GestureDetector(
                        onTap: () => Get.to(
                            () => PendingDetailScreen(index.toString()),
                            arguments: wallet),
                        child: PendingExpenseListWidget(
                            expenselist: wallet, position: index.toString()),
                      );
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
          )
        : nodatafound();
  }

  void callapi() async {
    await Future.delayed(Duration.zero);
    upcomingController.pendingexpense();
  }
}
