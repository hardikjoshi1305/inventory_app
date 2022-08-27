import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Component/UserInventoryListWidget.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';

import '../../Component/InventoryListWidget.dart';
import '../../Controller/InventoryController.dart';
import '../../Utility/app_colors.dart';

class UserCurrentInventory extends StatefulWidget {
  const UserCurrentInventory({Key key}) : super(key: key);

  @override
  State<UserCurrentInventory> createState() => _UserCurrentInventoryState();
}

InventoryController inventoryController = Get.put(InventoryController());
apicall() async {
  await Future.delayed(Duration.zero);
  inventoryController.fetchuserinventorylist("1");
}

class _UserCurrentInventoryState extends State<UserCurrentInventory> {
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
          title: Text('Current Inventory'),
        ),
        drawer: UserDrawer(),
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
    return inventoryController.userinventorylist != null
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        toptitle(100.0, "Status"),
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                        toptitle(130.0, "Action"),
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                        toptitle(130.0, "Photo"),
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ...inventoryController.userinventorylist
                              .map((element) {
                            print("userlist" + element.name);
                            return UserInventoryListWidget(
                              UserModel: element,
                              usertype: inventoryController.userinventorylist
                                  .indexOf(element),
                            );
                          }).toList()
                        ],
                      ),
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
