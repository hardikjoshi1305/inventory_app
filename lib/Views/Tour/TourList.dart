import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  TextEditingController te_userid = TextEditingController();
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  UserController userController = Get.put(UserController());
  TourController tourController;
  apicallusername() async {
    await Future.delayed(Duration.zero);
    userController.fetchusernamelist();
  }

  @override
  void initState() {
    apicallusername();
    // Get.delete<TourController>();
    // tourController = Get.put(TourController());
    super.initState();
  }

  datetimepicker(TextEditingController todate) async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        todate.text = formattedDate; //set output date to TextField value.
      });
    } else {}
  }

  @override
  void dispose() {
    Get.delete<TourController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tourController = Get.put(TourController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Tour History"),
      ),
      drawer: AdminDrawer(),
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

  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  var showlist = false;
  var id = "";
  Widget screenbody() {
    return Scrollbar(
        controller: _vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 20,
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      showlist = !showlist;
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
                            child: userController.usernamelist.value != null
                                ? Column(
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
                                                            AlignmentDirectional
                                                                .center,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 15,
                                                                bottom: 15),
                                                        child: Text(
                                                          e.userid,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                    Divider(
                                                      color: Colors.black,
                                                      height: 1,
                                                    )
                                                  ],
                                                ),
                                              ))
                                    ],
                                  )
                                : Container(),
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      datetimepicker(fromdate);
                    },
                    child: TextField(
                      controller: fromdate,
                      //   ..text = this.usermodel != null ? usermodel.name : "",
                      enabled: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'From Date',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      datetimepicker(todate);
                    },
                    child: TextField(
                      controller: todate,
                      //   ..text = this.usermodel != null ? usermodel.name : "",
                      enabled: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'To Date',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (fromdate.text.toString() != null &&
                          todate.text.toString() == null) {
                        Fluttertoast.showToast(msg: "To Date Require");
                      } else if (todate.text.toString() != null &&
                          fromdate.text.toString() == null) {
                        Fluttertoast.showToast(msg: "From Date Require");
                      } else {
                        apicall(id, fromdate.text.toString(),
                            todate.text.toString());
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Search",
                          style: TextStyle(fontSize: 16),
                        ))),

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
                tourController.tourhistorydata.value.data != null
                    ? tourController
                                .tourhistorydata.value.data.expenselist.length >
                            0
                        ? Container(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Total Amount : " +
                                  tourController
                                      .tourhistorydata.value.data.totalexpenses
                                      .toString() +
                                  " \u{20B9}",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 18),
                            ),
                          )
                        : Container()
                    : Container(),
                tourController.tourhistorydata.value.data != null
                    ? tourController
                                .tourhistorydata.value.data.expenselist.length >
                            0
                        ? Scrollbar(
                            controller: _horizontal,
                            isAlwaysShown: true,
                            child: SingleChildScrollView(
                              controller: _horizontal,
                              scrollDirection: Axis.horizontal,
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Container(
                                width: 600,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        toptitle(130, "UserName"),
                                        Container(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        toptitle(130, "tour"),
                                        Container(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        toptitle(130, "tour expense"),
                                        Container(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        toptitle(100, "Date"),
                                        Container(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: toptitle(80, "Status")),
                                        Container(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ...tourController.tourhistorydata.value
                                            .data.expenselist
                                            .map((element) {
                                          var index = tourController
                                              .tourhistorydata
                                              .value
                                              .data
                                              .expenselist
                                              .indexOf(element);
                                          var wallet = tourController
                                              .tourhistorydata
                                              .value
                                              .data
                                              .expenselist
                                              .elementAt(index);
                                          return GestureDetector(
                                            onTap: () => Get.to(
                                                () => UserTourDetails(
                                                    "admin", id),
                                                arguments:
                                                    wallet.id.toString()),
                                            child: TourListWidget(
                                                tourhistmodel: wallet),
                                          );
                                        }).toList()
                                      ],
                                    )
                                    // ListView.builder(
                                    //     shrinkWrap: true,
                                    //     padding: EdgeInsets.only(bottom: 16),
                                    //     itemCount:
                                    //     tourController.tourhistorydata.length,
                                    //     physics: NeverScrollableScrollPhysics(),
                                    //     itemBuilder: (ctx, index) {
                                    //       var wallet = tourController.tourhistorydata
                                    //           .elementAt(index);
                                    //       return GestureDetector(
                                    //         onTap: () => Get.to(
                                    //                 () => UserTourDetails("admin", id),
                                    //             arguments: wallet.id.toString()),
                                    //         child:
                                    //         TourListWidget(tourhistmodel: wallet),
                                    //       );
                                    //     })
                                  ],
                                ),
                              ),
                            ))
                        : Text("No Data Found")
                    : Container(),
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
        ));
  }

  void apicall(userid, String fromdate, String todate) async {
    await Future.delayed(Duration.zero);
    tourController.fetchtourlist(userid.toString(), fromdate, todate);
  }
}
