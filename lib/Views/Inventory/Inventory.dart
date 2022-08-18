import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Component/InventoryListWidget.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Inventory/CreateInventory.dart';

import '../../Utility/CommandMethod.dart';
import '../Home/HomeScreen.dart';
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
                  Get.to(() => CreateInventory());
                },
                child: Text("Add Inventory")),
            IconButton(
              icon: Icon(Icons.create_new_folder),
              onPressed: () {
                Get.to(() => CreateInventory());
              },
            )
          ],
          title: Text('Agour'),
        ),
        drawer: Drawer(
          elevation: 4.0,
          child: Container(
            color: Colors.blueGrey[600],
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                createDrawerHeader(),
                createDrawerBodyItem(
                    icon: Icons.pending_actions,
                    text: 'Users',
                    onTap: () {
                      Get.to(() => HomeScreen());
                      // Navigator.of(context).pop();
                      // Navigator.pushNamed(context, pageRoutes.landscape);
                    }),
                createDrawerBodyItem(
                    icon: Icons.cloud_done_rounded,
                    text: 'Inventory',
                    onTap: () {
                      Get.to(() => Inventory());

                      // _permissionStatus?
                      // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                    }),
                Divider(),
                // Padding(
                //   padding: const EdgeInsets.only(left: 18.0),
                //   child: Text(
                //     'Special Access',
                //     style: TextStyle(
                //         color: Colors.grey
                //     ),
                //   ),
                // ),
                // createDrawerBodyItem(
                //     icon: Icons.inventory, text: 'Inventory',
                //     onTap: ()  {   Navigator.of(context).pop();
                //
                //       // _permissionStatus?
                //       // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                //     }
                // ),
                ListTile(
                  title: Text('App version 1.0.0'),
                  onTap: () {},
                ),
              ],
            ),
          ),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                      Container(
                        width: 120,
                        alignment: AlignmentDirectional.center,
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(10.0)),
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
                          "Date",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.offWhite),
                        ),
                      ),
                    ],
                  ),
                  ...inventoryController.inventorylist.map((element) {
                    return InventoryListWidget(UserModel: element);
                  }).toList()
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
          )),
        ));
  }
}
