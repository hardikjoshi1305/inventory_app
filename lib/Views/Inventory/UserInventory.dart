import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Component/UserInventoryListWidget.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';

import '../../Component/InventoryListWidget.dart';
import '../../Component/UserAllInventoryListWidget.dart';
import '../../Controller/InventoryController.dart';
import '../../Utility/app_colors.dart';

class UserInventory extends StatefulWidget {
  const UserInventory({Key key}) : super(key: key);

  @override
  State<UserInventory> createState() => _UserInventoryState();
}

InventoryController inventoryController = Get.put(InventoryController());

apicall() async {
  await Future.delayed(Duration.zero);
  inventoryController.fetchinventorylist("");
}

class _UserInventoryState extends State<UserInventory> {
// getauthtoken() async {
//   var token = await SharedPreferenceHelper().getPref(TOKEN);
//   // inventoryController.fetchinventorylist(token);
// }

  @override
  void initState() {
    // getauthtoken();
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: Text('All Inventory'),
        ),
        drawer: UserDrawer(),
        body: Container(
            child: Obx(() => inventoryController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : inventoryController.inventorylist != null
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    toptitle(100.0, "ID"),
                                    Container(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    toptitle(120.0, "Code"),
                                    Container(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    toptitle(200.0, "Name"),
                                    Container(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    toptitle(200.0, "Serial No."),
                                    Container(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    toptitle(100.0, "Px No."),
                                    Container(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    toptitle(100.0, "Machine"),
                                    Container(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    // toptitle(100.0, "Location"),
                                    // Container(
                                    //   width: 1,
                                    //   color: Colors.white,
                                    // ),
                                    // toptitle(100.0, "Remark"),
                                    // Container(
                                    //   width: 1,
                                    //   color: Colors.white,
                                    // ),
                                    // toptitle(100.0, "Status"),
                                    // Container(
                                    //   width: 1,
                                    //   color: Colors.white,
                                    // ),
                                    // toptitle(130.0, "Action"),
                                    // Container(
                                    //   width: 1,
                                    //   color: Colors.white,
                                    // ),
                                    // toptitle(130.0, "Photo"),
                                    // Container(
                                    //   width: 1,
                                    //   color: Colors.white,
                                    // ),
                                  ],
                                ),
                                Expanded(
                                  child: Obx(() => (inventoryController
                                          .isLoading.value)
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : inventoryController
                                                  .inventorylist.length >
                                              0
                                          ? Column(
                                              children: [
                                                ...inventoryController
                                                    .inventorylist
                                                    .map((element) {
                                                  print("userlist" +
                                                      element.name);
                                                  return UserAllInventoryListWidget(
                                                    UserModel: element,
                                                    usertype: "user",
                                                  );
                                                }).toList()
                                              ],
                                            )
                                          : Container(
                                              padding: EdgeInsets.all(20),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'No Data Found',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )),
                                ),

                                // ListView.builder(
                                //     shrinkWrap: true,
                                //     padding: EdgeInsets.only(bottom: 16),
                                //     itemCount: inventoryController.inventorylist.length,
                                //     itemBuilder: (ctx, index) {
                                //       var therapy =
                                //           inventoryController.inventorylist.elementAt(index);
                                //       return InventoryListWidget(UserModel: therapy);
                                //     })
                              ],
                            ),
                          ),
                        ))
                    : nodatafound())));
  }
}
