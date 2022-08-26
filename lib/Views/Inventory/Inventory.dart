import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Component/InventoryListWidget.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Inventory/CreateInventory.dart';

import '../../Network/RequestCall.dart';
import '../../Utility/CONSTANT.dart';
import '../../Utility/CommandMethod.dart';
import '../../Utility/SharedPreferenceHelper.dart';
import '../Home/HomeScreen.dart';
import '../Users/CreateUser.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  InventoryController inventoryController = Get.put(InventoryController());
  getauthtoken() async {
    var token = await SharedPreferenceHelper().getPref(TOKEN);
    // inventoryController.fetchinventorylist(token);
  }

  apicall() async {
    await Future.delayed(Duration.zero);
    inventoryController.fetchinventorylist("");
  }

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
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20, top: 6, bottom: 6),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey[300],
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Get.to(() => CreateInventory());
                  Get.delete<InventoryController>();
                },
                child: Text("Create Inventory",
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
          title: Text('Inventory'),
        ),
        drawer: AdminDrawer(),
        body: Container(
            child: Obx(() => Stack(
                  fit: StackFit.loose,
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Opacity(
                      opacity:
                          1, // You can reduce this when loading to give different effect
                      child: AbsorbPointer(
                        absorbing: inventoryController.isLoading.value,
                        child: screenbody(),
                      ),
                    ),
                    Opacity(
                      opacity: inventoryController.isLoading.value ? 1.0 : 0,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ))));
  }

  Widget screenbody() {
    return inventoryController.inventorylist != null
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
                        toptitle(100.0, "Location"),
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                        toptitle(100.0, "Remark"),
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                        toptitle(180.0, "Status"),
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                        toptitle(130.0, "Action"),

                        // Container(
                        //   width: 120,
                        //   alignment: AlignmentDirectional.center,
                        //   decoration: new BoxDecoration(
                        //     borderRadius: new BorderRadius.all(
                        //         const Radius.circular(10.0)),
                        //     boxShadow: <BoxShadow>[
                        //       BoxShadow(
                        //         color: AppColors.darkBlue,
                        //         offset: Offset(1.0, 6.0),
                        //         blurRadius: 0.001,
                        //       ),
                        //     ],
                        //   ),
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: Text(
                        //     "Date",
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.w400,
                        //         color: AppColors.offWhite),
                        //   ),
                        // ),
                      ],
                    ),
                    Expanded(
                      child: Obx(() => (inventoryController.isLoading.value)
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                ...inventoryController.inventorylist
                                    .map((element) {
                                  // print("userlist" + element.name);
                                  return InventoryListWidget(
                                      UserModel: element, usertype: "admin");
                                }).toList()
                              ],
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
        : nodatafound();
  }
}
