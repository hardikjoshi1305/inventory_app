import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Component/InventoryListWidget.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Inventory/CreateInventory.dart';

import '../Users/CreateUser.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  InventoryController inventoryController = Get.put(InventoryController());

  @override
  void initState() {
    inventoryController.fetchinventorylist();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Get.to(() => Createuser());
                },
                child: Text("Add Inventory")),
            IconButton(
              icon: Icon(Icons.create_new_folder),
              onPressed: () {
                Get.to(()=> CreateInventory());
              },
            )
          ],
          title: Text('Agour'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Expanded(
              child: Container(
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
                              color: AppColors.darkBlue,
                              borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.offWhite,
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
                            width: 100,
                            alignment: AlignmentDirectional.center,
                            decoration: new BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.offWhite,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 0.001,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "UserName",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.offWhite),
                            ),
                          ),
                          Container(
                            width: 200,
                            alignment: AlignmentDirectional.center,
                            decoration: new BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.offWhite,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 0.001,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "MobileNumber",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.offWhite),
                            ),
                          ),
                          Container(
                            width: 200,
                            alignment: AlignmentDirectional.center,
                            decoration: new BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.offWhite,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 0.001,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.offWhite,
                              ),
                            ),
                          ),
                          Container(
                            decoration: new BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.offWhite,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 0.001,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "City",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.offWhite),
                            ),
                          ),
                          Container(
                            decoration: new BoxDecoration(
                              color: AppColors.darkBlue,
                              borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppColors.offWhite,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 0.001,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Wallet Balance",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.offWhite),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 16),
                          itemCount: inventoryController.inventorylist.length,
                          itemBuilder: (ctx, index) {
                            var therapy = inventoryController.inventorylist.elementAt(index);
                            return InventoryListWidget(UserModel: therapy);
                          })
                    ],
                  ),
                ),
              )),
        ));
  }
}
