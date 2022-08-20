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
    inventoryController.fetchinventorylist(token);
  }

  @override
  void initState() {
    // getauthtoken();
    inventoryController.fetchinventorylist("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    inventoryController.fetchinventorylist("");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(color: AppColors.darkBlue),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Get.to(() => CreateInventory());
                },
                child: Text("Create Inventory",
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
          title: Text('Inventory'),
        ),
        drawer: AdminDrawer(),
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() => inventoryController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 100,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "ID",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
                              Container(
                                width: 120,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Code",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
                              Container(
                                width: 200,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
                              Container(
                                width: 200,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Serial No.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.offWhite,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Px No.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
                              Container(
                                width: 100,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Machine",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
                              Container(
                                width: 100,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Location",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
                              Container(
                                width: 100,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Remark",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
                              Container(
                                width: 100,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Status",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
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
                              Container(
                                width: 130,
                                alignment: AlignmentDirectional.center,
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.darkBlue,
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 0.001,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Action",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child:
                                Obx(() => (inventoryController.isLoading.value)
                                    ? Center(child: CircularProgressIndicator())
                                    : Column(
                                        children: [
                                          ...inventoryController.inventorylist
                                              .map((element) {
                                            print("userlist" + element.name);
                                            return InventoryListWidget(
                                                UserModel: element);
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
                  ))));
  }
}
