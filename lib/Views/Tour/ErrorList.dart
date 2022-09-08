import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/TourController.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';

import '../../Component/ErrorListWidget.dart';
import '../../Utility/CONSTANT.dart';
import '../../Utility/SharedPreferenceHelper.dart';

class ErrorList extends StatefulWidget {
  const ErrorList({Key key}) : super(key: key);

  @override
  State<ErrorList> createState() => _ErrorListState();
}

var userisvisible;
getauthtoken() async {
  var token = await SharedPreferenceHelper().getPref(TOKEN);
  userisvisible = await SharedPreferenceHelper().getPref(IsVISIBLE);

  print("token" + token.toString());
}

class _ErrorListState extends State<ErrorList> {
  @override
  void initState() {
    getauthtoken();
    // callapi();
    // upcomingController.pendingitem(iscompleted: "0");
    super.initState();
  }

  TourController tourController = Get.put(TourController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Error List"),
        ),
        drawer: UserDrawer(userisvisible),
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
            )));
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
                  await tourController.searcherror(value);
                } else {
                  // apicall();
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search Problem',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          tourController.errorlist != null
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
                                                  toptitle(100.0, "User"),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  toptitle(120.0, "Tour"),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  toptitle(120.0, "Problem"),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  toptitle(100.0, "Status"),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  toptitle(100.0, "Date"),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  toptitle(130.0, "View"),
                                                ],
                                              ),
                                              Expanded(
                                                child: Obx(() => (tourController
                                                        .isLoading.value)
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                    : Column(
                                                        children: [
                                                          ...tourController
                                                              .errorlist
                                                              .map((element) {
                                                            // print("userlist" + element.name);
                                                            return ErrorListWidget(
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
    );
  }
}
