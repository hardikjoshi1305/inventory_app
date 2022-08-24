import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Inventory"),
      ),
      drawer: AdminDrawer(),
      body: Obx(() => upcomingController.isLoading.value ?
      Container(child: Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              Container(
                child: TextField(
                  // controller: te_name
                  //   ..text = this.usermodel != null ? usermodel.name : "",
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    userid = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'User ID',
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 20,
              ),
              Container(
                child: TextField(
                  // controller: te_name
                  //   ..text = this.usermodel != null ? usermodel.name : "",
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    tourname = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.tour),
                    labelText: 'Tour Name',
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              DropdownSearch<Datum>(
                mode: Mode.BOTTOM_SHEET,
                showSearchBox: true,
                isFilteredOnline: true,
                dropDownButton: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 18,
                ),
                dropdownSearchDecoration: InputDecoration(
                  hintText: 'Search Programs',
                  icon: Icon(Icons.filter_list),
                ),
                dropdownBuilder: _customDropDownPrograms,
                popupItemBuilder: _customPopupItemBuilder,
                onChanged: (Datum object) {
                  // upcomingController.searchdata(object.code);
                  setState(() {
                    if (object != null) {
                      // callgethistoryapi(object.id.toString());
                    }
                  });
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

              // ...allinventory.map((element) => Card(
              //   elevation: 7,
              //   margin: EdgeInsets.only(top: 6, left: 6, right: 6),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             Text(
              //               element,
              //               style: TextStyle(fontSize: 18),
              //             ),
              //             GestureDetector(
              //               onTap: () {
              //                 var index = allinventory.indexOf(element);
              //
              //                 return choosefile(index);
              //               },
              //               child: Padding(
              //                 padding: const EdgeInsets.all(2.0),
              //                 child: Icon(Icons.image,
              //                     color: AppColors.darkBlue),
              //               ),
              //             ),
              //             GestureDetector(
              //               onTap: () {
              //                 var index = allinventory.indexOf(element);
              //
              //                 return deleteitem(index);
              //               },
              //               child: Padding(
              //                 padding: const EdgeInsets.all(2.0),
              //                 child: Icon(Icons.clear, color: Colors.red),
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // )),
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
      )
      ),
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
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(item.code.toString(),
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 102, 100, 100),
            )),
      ),
    );
  }

  Widget _customDropDownPrograms(
      BuildContext context, Datum item, String dads) {
    code = item != null ? item.code : "";
    // upcomingController.issearched.value = item != null ? true : false;
    return Container(
        child: (item == null)
            ? const ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text("Search Programs",
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
