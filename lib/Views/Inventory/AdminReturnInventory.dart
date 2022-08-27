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

class AdminReturnInventory extends StatefulWidget {
  const AdminReturnInventory({Key key}) : super(key: key);

  @override
  State<AdminReturnInventory> createState() => _AdminReturnInventoryState();
}

class _AdminReturnInventoryState extends State<AdminReturnInventory> {
  InventoryController inventoryController = Get.put(InventoryController());
  getauthtoken() async {
    var token = await SharedPreferenceHelper().getPref(TOKEN);
    // inventoryController.fetchinventorylist(token);
  }

  apicall() async {
    await Future.delayed(Duration.zero);
    inventoryController.fetchadminreturninventorylist();
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
          title: Text('Return Inventory'),
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
    return inventoryController.adminreturninventorylist != null
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
                        toptitle(100.0, "Price"),
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                        toptitle(130.0, "Action"),
                      ],
                    ),
                    Expanded(
                      child: Obx(() => (inventoryController.isLoading.value)
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                ...inventoryController.adminreturninventorylist
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
