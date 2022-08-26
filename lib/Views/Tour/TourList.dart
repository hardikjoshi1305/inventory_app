import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Controller/TourController.dart';
import 'package:inventory_management/Controller/UserController.dart';
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
  UserController userController = Get.put(UserController());
  TextEditingController te_userid = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tour History"),
      ),
      body: Obx(() => Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Opacity(
                opacity:
                    1, // You can reduce this when loading to give different effect
                child: AbsorbPointer(
                  absorbing: tourController.isLoading.value,
                  child: screenbody(),
                ),
              ),
              Opacity(
                opacity: tourController.isLoading.value ? 1.0 : 0,
                child: CircularProgressIndicator(),
              ),
            ],
          )),
    );
  }

  var showlist = false;
  var id = "";
  Widget screenbody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 20,
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  showlist = true;
                });
              },
              child: Container(
                child: TextField(
                  controller: te_userid,
                  //   ..text = this.usermodel != null ? usermodel.name : "",
                  enabled: false,
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
            ),
            showlist
                ? Card(
                    elevation: 7,
                    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Container(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ...userController.usernamelist.value
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        te_userid..text = e.userid;
                                        setState(() {
                                          showlist = false;
                                          id = e.id.toString();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              width: double.infinity,
                                              color: Colors.white,
                                              alignment:
                                                  AlignmentDirectional.center,
                                              padding: EdgeInsets.only(
                                                  top: 15, bottom: 15),
                                              child: Text(
                                                e.userid,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )),
                                          Divider(
                                            color: Colors.black,
                                            height: 1,
                                          )
                                        ],
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),

            Container(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (id.toString() != null && id != "") {
                    apicall(id);
                  } else {
                    Fluttertoast.showToast(msg: "Please Enter Valid User ID");
                  }
                },
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 16),
                    ))),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
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
                        style: TextStyle(color: Colors.black, fontSize: 16),
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
                            itemCount: tourController.tourhistorydata.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              var wallet = tourController.tourhistorydata
                                  .elementAt(index);
                              return GestureDetector(
                                onTap: () => Get.to(() => UserTourDetails(),
                                    arguments: wallet.id.toString()),
                                child: TourListWidget(tourhistmodel: wallet),
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
    );
  }

  void apicall(userid) async {
    await Future.delayed(Duration.zero);
    tourController.fetchtourlist(userid.toString());
  }
}
