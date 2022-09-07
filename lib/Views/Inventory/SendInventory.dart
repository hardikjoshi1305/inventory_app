import 'dart:convert';
import 'dart:ffi';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_management/Controller/SearchController.dart';
import 'package:inventory_management/Controller/UserController.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Model/SearchInventoryResponse.dart';
import 'package:http/http.dart' as http;

import '../../Utility/app_colors.dart';

class SendInventory extends StatefulWidget {
  const SendInventory({Key key}) : super(key: key);

  @override
  State<SendInventory> createState() => _SendInventoryState();
}

var userid, img_path, tourname;
var code = "";
List<String> allinventory = [];
List<String> allinventoryname = [];
List<String> allinventoryimage = [];
List<String> allinventorylocation = [];
List<String> allinventorycode = [];

class _SendInventoryState extends State<SendInventory> {
  @override
  void initState() {
    apicallusername();
    super.initState();
  }

  @override
  void dispose() {
    allinventory.clear();
    allinventoryname.clear();
    allinventoryimage.clear();
    Get.delete<SearchController>();
    print("dispose");
    super.dispose();
  }

  SearchController upcomingController = Get.put(SearchController());
  UserController userController = Get.put(UserController());
  TextEditingController te_userid = TextEditingController();

  apicallusername() async {
    await Future.delayed(Duration.zero);
    userController.fetchusernamelist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Send Inventory"),
        ),
        drawer: AdminDrawer(),
        body: Obx(
          () => Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Opacity(
                opacity:
                    1, // You can reduce this when loading to give different effect
                child: AbsorbPointer(
                  absorbing: upcomingController.isLoading.value,
                  child: screenbody(),
                ),
              ),
              Opacity(
                opacity: upcomingController.isLoading.value ? 1.0 : 0,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ));
  }

  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  var showlist = false;
  var id = "";
  int index;
  Widget screenbody() {
    return Scrollbar(
        isAlwaysShown: true,
        controller: _vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _vertical,
          physics: AlwaysScrollableScrollPhysics(),
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
                      showlist = !showlist;
                    });
                  },
                  child: Container(
                    child: TextField(
                      controller: te_userid,
                      //   ..text = this.usermodel != null ? usermodel.name : "",
                      keyboardType: TextInputType.text,
                      enabled: false,
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
                                                      AlignmentDirectional
                                                          .center,
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

                // DropdownSearch<Datum>(
                //   mode: Mode.DIALOG,
                //   showSearchBox: true,
                //   isFilteredOnline: true,
                //   dropDownButton: const Icon(
                //     Icons.keyboard_arrow_down,
                //     color: Colors.black,
                //     size: 18,
                //   ),
                //
                //   dropdownSearchDecoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Search Inventory by Code or Name',
                //     prefixIcon: Icon(Icons.search),
                //   ),
                //   dropdownBuilder: _customDropDownPrograms,
                //   popupItemBuilder: _customPopupItemBuilder,
                //   emptyBuilder: (context, searchEntry) => Center(
                //       child:
                //           Text('No data', style: TextStyle(color: Colors.black))),
                //
                //   onChanged: (Datum object) {
                //     // upcomingController.searchdata(object.code);
                //     setState(() {
                //       if (object != null) {
                //         print("onchasnged" + object.code);
                //         if (!allinventory.contains(object.id.toString())) {
                //           allinventory.add(object.id.toString());
                //           allinventoryname.add(object.name.toString());
                //           allinventoryimage.add("");
                //         } else {
                //           Fluttertoast.showToast(msg: "Already Selected");
                //         }
                //       }
                //     });
                //   },
                //   onFind: (String filter) => upcomingController.searchdata(filter),
                //   showClearButton: true,
                //   clearButtonBuilder: (_) => const Padding(
                //     padding: EdgeInsets.all(0.0),
                //     child: Icon(Icons.clear, size: 17, color: Colors.black),
                //   ),
                //   // validator: (Datum item) => item == null ? "vvvvvvv" : null,
                // ),
                Container(
                  child: TextField(
                    // controller: te_name
                    //   ..text = this.usermodel != null ? usermodel.name : "",
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      if (value == "") {
                        upcomingController.search.clear();
                      } else {
                        upcomingController.searchdata(value);
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search Inventory by Code',
                    ),
                  ),
                ),
                upcomingController.search.length > 0
                    ? Scrollbar(
                        controller: _horizontal,
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          controller: _horizontal,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    toptitle(150.0, "Code"),
                                    toptitle(150.0, "Name"),
                                    toptitle(150.0, "Location"),
                                  ],
                                ),
                                ...upcomingController.search
                                    .map((element) => GestureDetector(
                                          onTap: () {
                                            upcomingController.search.clear();

                                            setState(() {
                                              if (!allinventory.contains(
                                                  element.id.toString())) {
                                                allinventory
                                                    .add(element.id.toString());
                                                allinventoryname.add(
                                                    element.name.toString());
                                                allinventorycode.add(
                                                    element.code.toString());
                                                allinventorylocation.add(element
                                                    .location
                                                    .toString());
                                                allinventoryimage.add("");
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "Already Selected");
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              bottomtitle(150.0, element.code),
                                              bottomtitle(150.0, element.name),
                                              bottomtitle(
                                                  150.0, element.location),
                                            ],
                                          ),
                                        ))
                                    .toList()
                              ],
                            ),
                          ),
                        ))
                    : Container(
                        height: 20,
                      ),
                allinventoryname.length > 0
                    ? SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                toptitle(130.0, "Code"),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                toptitle(130.0, "Part Name"),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                toptitle(130.0, "Location"),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                // toptitle(100.0, "File"),
                                // Container(
                                //   width: 1,
                                //   color: Colors.white,
                                // ),
                                toptitle(100.0, "Action"),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            ...allinventoryname.map((element) {
                              index = allinventoryname.indexOf(element);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  bottomtitle(130.0,
                                      allinventorycode[index].toString()),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  bottomtitle(130.0, element),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  bottomtitle(130.0,
                                      allinventorylocation[index].toString()),
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      var index =
                                          allinventoryname.indexOf(element);
                                      return deleteitem(index);
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      color: AppColors.offWhite,
                                      padding: const EdgeInsets.all(5.0),
                                      child:
                                          Icon(Icons.clear, color: Colors.red),
                                    ),
                                  )
                                ],
                              );
                            }),
                          ],
                        ),
                      )
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print("allinventorylist  " + allinventory.toString());
                        // print("allinventoryimagelist  " +)
                        if (checkvalidation(allinventory, id)) {
                          upcomingController.fetchsendpartapi(
                              userid: id,
                              tourname: tourname,
                              photo: allinventoryimage,
                              inventory_id: allinventory);
                        }
                        // callgetinventory(code);
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
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
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Text(item.code.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 102, 100, 100),
                            ))),
                    Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Text(item.name.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 102, 100, 100),
                            ))),
                    Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Text(item.location.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 102, 100, 100),
                            ))),
                  ],
                ),
                Divider(
                  color: Colors.black,
                  height: 2,
                )
              ],
            )
            // ListTile(
            //   title: Text(item.code.toString(),
            //       style: const TextStyle(
            //         fontSize: 14,
            //         color: Color.fromARGB(255, 102, 100, 100),
            //       )),
            // ),
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
                title: Text("Search Inventory by Code",
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

  choosefile(int index) async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      // print("object" + image.toString());
      print("object" + index.toString());
      img_path = image.absolute.path;
      allinventoryimage[index] = img_path.toString();
    } catch (exception) {
      print("object" + exception.toString());
    }
  }

  deleteitem(int index) {
    print("delete" + index.toString());
    try {
      setState(() {
        allinventory.removeAt(index);
        allinventoryimage.removeAt(index);
        allinventoryname.removeAt(index);
        allinventorycode.removeAt(index);
        allinventorylocation.removeAt(index);
      });
    } catch (exception) {
      print("object" + exception.toString());
    }
  }

  bool checkvalidation(List<String> allinventory, String id) {
    if (allinventory.length <= 0) {
      Fluttertoast.showToast(msg: "Select Any Inventory");
      return false;
    } else if (id == "") {
      Fluttertoast.showToast(msg: "Select Any User");
      return false;
    } else {
      return true;
    }
  }
}
