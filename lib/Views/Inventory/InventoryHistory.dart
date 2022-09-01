import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';

import '../../Component/InventoryHistoryWidget.dart';
import '../../Controller/SearchController.dart';
import '../../Model/SearchInventoryResponse.dart';
import '../../Utility/CommandMethod.dart';

class InventoryHistory extends StatefulWidget {
  const InventoryHistory({Key key}) : super(key: key);

  @override
  State<InventoryHistory> createState() => _InventoryHistoryState();
}

var userid, img_path, tourname;
var code = "";

class _InventoryHistoryState extends State<InventoryHistory> {
  SearchController upcomingController = Get.put(SearchController());
  InventoryController inventoryController = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory History"),
      ),
      drawer: AdminDrawer(),
      body: Obx(() => upcomingController.isLoading.value
          ? Container(child: Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),

                    DropdownSearch<Datum>(
                      mode: Mode.MENU,
                      showSearchBox: true,
                      isFilteredOnline: true,
                      dropDownButton: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 18,
                      ),
                      dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Inventory Code',
                        prefixIcon: Icon(Icons.search),
                      ),
                      dropdownBuilder: _customDropDownPrograms,
                      popupItemBuilder: _customPopupItemBuilder,
                      onChanged: (Datum object) {
                        inventoryController.gethistoryapi(object.id.toString());
                        // upcomingController.searchdata(object.code);
                        // setState(() {
                        //   if (object != null) {
                        //     // callgethistoryapi(object.id.toString());
                        //   }
                        // });
                      },
                      onFind: (String filter) =>
                          upcomingController.searchdata(filter ?? ""),
                      showClearButton: true,
                      clearButtonBuilder: (_) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.clear, size: 17, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Container(
                          child: Container(
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.black,
                              height: 3,
                            ),
                            Container(
                              height: 10,
                              width: 0,
                            ),
                            Container(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "    Transcation History",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Divider(
                                color: Colors.grey,
                                height: 3,
                              ),
                            ),
                            Obx(() => inventoryController
                                        .inventoryhistorylist.length >
                                    0
                                ? Stack(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                toptitle(100.0, "ID"),
                                                Container(
                                                  width: 1,
                                                  color: Colors.white,
                                                ),
                                                toptitle(100.0, "UserId"),
                                                Container(
                                                  width: 1,
                                                  color: Colors.white,
                                                ),
                                                toptitle(200.0, "History"),
                                                Container(
                                                  width: 1,
                                                  color: Colors.white,
                                                ),
                                                toptitle(120.0, "Date"),
                                                Container(
                                                  width: 1,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                ...inventoryController
                                                    .inventoryhistorylist
                                                    .map((wallet) => Row(
                                                          children: [
                                                            bottomtitle(
                                                                100.0,
                                                                wallet.id
                                                                    .toString()),
                                                            Container(
                                                              width: 1,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            bottomtitle(
                                                                100.0,
                                                                wallet.userid
                                                                    .toString()),
                                                            Container(
                                                              width: 1,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            bottomtitle(
                                                                200.0,
                                                                wallet
                                                                    .invHistory
                                                                    .toString()),
                                                            Container(
                                                              width: 1,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            bottomtitle(
                                                                120.0,
                                                                wallet.currDate
                                                                    .toString()),
                                                            Container(
                                                              width: 1,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ],
                                                        ))
                                                    .toList()
                                              ],
                                            )

                                            // Flexible(
                                            //     flex: 1,
                                            //     child: ListView.builder(
                                            //         shrinkWrap: true,
                                            //         padding: EdgeInsets.only(
                                            //             bottom: 16),
                                            //         itemCount:
                                            //             inventoryController
                                            //                 .inventoryhistorylist
                                            //                 .length,
                                            //         physics: ScrollPhysics(),
                                            //         itemBuilder: (ctx, index) {
                                            //           var wallet =
                                            //               inventoryController
                                            //                   .inventoryhistorylist
                                            //                   .elementAt(index);
                                            //           return Row(
                                            //             children: [
                                            //               bottomtitle(
                                            //                   100.0,
                                            //                   wallet.id
                                            //                       .toString()),
                                            //               Container(
                                            //                 width: 1,
                                            //                 color: Colors.white,
                                            //               ),
                                            //               bottomtitle(
                                            //                   100.0,
                                            //                   wallet.userid
                                            //                       .toString()),
                                            //               Container(
                                            //                 width: 1,
                                            //                 color: Colors.white,
                                            //               ),
                                            //               bottomtitle(
                                            //                   200.0,
                                            //                   wallet.invHistory
                                            //                       .toString()),
                                            //               Container(
                                            //                 width: 1,
                                            //                 color: Colors.white,
                                            //               ),
                                            //               bottomtitle(
                                            //                   120.0,
                                            //                   wallet.currDate
                                            //                       .toString()),
                                            //               Container(
                                            //                 width: 1,
                                            //                 color: Colors.white,
                                            //               ),
                                            //             ],
                                            //           );
                                            //         }))
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : Text("No Data Found"))
                          ],
                        ),
                      )),
                    ),
                    // Obx(() =>
                    // ListView(
                    //   scrollDirection: Axis.vertical,
                    //   // children: List.generate(upcomingController.search.length,
                    //   //     (index) => Text(code.toString()))
                    //   children: [...allinventory.map((element) => Text(element))],
                    // ),
                    //     ),
                    Container(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )),
    );
  }

  Widget _customPopupItemBuilder(
      BuildContext context, Datum item, bool isSelected) {
    return item == null
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: !isSelected
                ? null
                : BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
            child: const ListTile(
              title: Text("Search Data",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 102, 100, 100),
                  )),
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: !isSelected
                ? null
                : BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  bottomtitle(120.0, "C :" + item.code),
                  bottomtitle(130.0, "N :" + item.name),
                  bottomtitle(120.0, "L :" + item.location),
                ],
              ),
            ));
  }

  Widget _customDropDownPrograms(
      BuildContext context, Datum item, String dads) {
    code = item != null ? item.code : "";
    // upcomingController.issearched.value = item != null ? true : false;
    return Container(
        child: (item == null)
            ? const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("Search Inventory ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(235, 158, 158, 158))),
              )
            : ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  item.code,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13.5, color: Colors.black),
                )));
  }
}
