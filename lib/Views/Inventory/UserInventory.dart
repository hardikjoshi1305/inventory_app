import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Component/UserInventoryListWidget.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';

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
var userisvisible;
apicall() async {
  await Future.delayed(Duration.zero);
  userisvisible = await SharedPreferenceHelper().getPref(IsVISIBLE);
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
        drawer: UserDrawer(userisvisible),
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

  var searchinventory;

  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  Widget screenbody() {
    return inventoryController.inventorylist != null
        ? SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) async {
                      searchinventory = value;
                      if (value != "") {
                        await inventoryController.searchdata(value);
                      } else {
                        apicall();
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search Inventory by code or name',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                inventoryController.inventorylist != null
                    ? Stack(
                        children: [
                          Scrollbar(
                              isAlwaysShown: true,
                              controller: _vertical,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  controller: _vertical,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  child: Scrollbar(
                                    isAlwaysShown: true,
                                    controller: _horizontal,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _horizontal,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Stack(
                                              children: [
                                                Column(
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
                                                        toptitle(200.0,
                                                            "Serial No."),
                                                        Container(
                                                          width: 1,
                                                          color: Colors.white,
                                                        ),
                                                        toptitle(
                                                            100.0, "Px No."),
                                                        Container(
                                                          width: 1,
                                                          color: Colors.white,
                                                        ),
                                                        toptitle(
                                                            100.0, "Machine"),
                                                        Container(
                                                          width: 1,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Obx(() =>
                                                          (inventoryController
                                                                  .isLoading
                                                                  .value)
                                                              ? Center(
                                                                  child:
                                                                      CircularProgressIndicator())
                                                              : Column(
                                                                  children: [
                                                                    ...inventoryController
                                                                        .inventorylist
                                                                        .map(
                                                                            (element) {
                                                                      // print("userlist" + element.name);
                                                                      return UserAllInventoryListWidget(
                                                                          UserModel:
                                                                              element,
                                                                          usertype:
                                                                              "user");
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
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  )))
                        ],
                      )
                    : nodatafound()
              ],
            ),
          )
        : nodatafound();
  }
}
