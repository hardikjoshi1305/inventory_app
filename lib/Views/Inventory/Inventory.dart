import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Component/InventoryListWidget.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Inventory/CreateInventory.dart';

import '../../Component/InventorySearchListWidget.dart';
import '../../Controller/SearchController.dart';
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
  SearchController upcomingController = Get.put(SearchController());

  apicall() async {
    await Future.delayed(Duration.zero);
    inventoryController.fetchinventorylist("");
  }

  Future _refreshcall() => Future.delayed(
      Duration(seconds: 2), () => inventoryController.fetchinventorylist(""));
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
      body: RefreshIndicator(
        onRefresh: _refreshcall,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: Container(
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
                ))),
      ),
    );
  }

  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();

  var searchinventory;
  Widget screenbody() {
    return SingleChildScrollView(
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
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              controller: _horizontal,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller: _horizontal,
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
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
                                                  toptitle(100.0, "Status"),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  toptitle(180.0, "Remark"),
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
                                                child: Obx(() =>
                                                    (inventoryController
                                                            .isLoading.value)
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
                                                                return InventoryListWidget(
                                                                    UserModel:
                                                                        element,
                                                                    usertype:
                                                                        "admin");
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
    );
  }

  // inventoryController.inventorylist != null
  // ? inventorylist()
  //     : upcomingController.search != null
  // ? inventorysearchlist()
  //     : nodatafound()

}
