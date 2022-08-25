import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Controller/TourController.dart';
import 'package:inventory_management/Views/Tour/UserTourDetail.dart';

import '../../Component/InventoryHistoryWidget.dart';
import '../../Component/TourListWidget.dart';
import '../../Controller/SearchController.dart';
import '../../Model/SearchInventoryResponse.dart';
import '../../Utility/CommandMethod.dart';

class TourList extends StatefulWidget {
  const TourList({Key key}) : super(key: key);

  @override
  State<TourList> createState() => _TourListState();
}

var userid;

class _TourListState extends State<TourList> {
  // SearchController upcomingController = Get.put(SearchController());
  TourController tourController = Get.put(TourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tour History"),
      ),
      body: Obx(() => tourController.isLoading.value
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
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (userid.toString() != null) {
                            apicall(userid);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Enter Valid User ID");
                          }
                        },
                        child: Text("Search")),

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
                                "    Tour History",
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
                            Obx(() => tourController.tourhistorydata.length > 0
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(bottom: 16),
                                    itemCount:
                                        tourController.tourhistorydata.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (ctx, index) {
                                      var wallet = tourController
                                          .tourhistorydata
                                          .elementAt(index);
                                      return GestureDetector(
                                        onTap: () => Get.to(
                                            () => UserTourDetails(),
                                            arguments: wallet.id.toString()),
                                        child: TourListWidget(
                                            tourhistmodel: wallet),
                                      );
                                    })
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

  void apicall(userid) async {
    await Future.delayed(Duration.zero);
    tourController.fetchtourlist(userid.toString());
  }
}
