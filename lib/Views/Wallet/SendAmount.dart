import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_management/Controller/SearchController.dart';
import 'package:inventory_management/Controller/UserController.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';

class SendAmount extends StatefulWidget {
  const SendAmount({Key key}) : super(key: key);

  @override
  State<SendAmount> createState() => _SendAmountState();
}

var userid;
var code, amountadd, img_path, remark = "";
// List<String> allinventory = [];
// List<String> allinventoryname = [];
// List<String> allinventoryimage = [];

class _SendAmountState extends State<SendAmount> {
  @override
  void initState() {
    apicallusername();
    super.initState();
  }

  SearchController upcomingController = Get.put(SearchController());
  // UserController userController = Get.put(UserController());
  TextEditingController te_userid = TextEditingController();
  TextEditingController te_wallet = TextEditingController();
  TextEditingController te_imgpath = TextEditingController();

  apicallusername() async {
    await Future.delayed(Duration.zero);
    upcomingController.fetchusernamelist();
  }

  @override
  void dispose() {
    print("dispose");
    te_userid.dispose();
    te_wallet.dispose();
    te_imgpath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    te_imgpath..text = "";
    return Scaffold(
        appBar: AppBar(
          title: Text("Send Amount"),
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
                            ...upcomingController.usernamelist.value
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        te_userid..text = e.userid;
                                        te_wallet..text = e.wallet_amount;
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
                                              padding: const EdgeInsets.only(
                                                  top: 15, bottom: 15),
                                              child: Text(
                                                e.userid,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )),
                                          const Divider(
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
              margin: EdgeInsets.only(bottom: 30),
              child: TextField(
                enabled: false,
                controller: te_wallet..text,
                //   ..text = this.usermodel != null ? usermodel.name : "",
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.currency_rupee_sharp),
                  labelText: 'Wallet Balance',
                ),
              ),
            ),
            Container(
              child: TextField(
                // controller: te_name
                //   ..text = this.usermodel != null ? usermodel.name : "",
                keyboardType: TextInputType.numberWithOptions(),
                onChanged: (value) {
                  amountadd = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.currency_rupee_sharp),
                  labelText: 'Add Amount',
                ),
              ),
            ),
            Container(
              height: 30,
            ),
            Container(
              child: TextField(
                // controller: te_name
                //   ..text = this.usermodel != null ? usermodel.name : "",
                keyboardType: TextInputType.numberWithOptions(),
                onChanged: (value) {
                  remark = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note_alt_rounded),
                  labelText: 'Remark',
                ),
              ),
            ),
            Container(
              height: 4,
            ),
            Container(
              child: TextField(
                enabled: false,
                controller: te_imgpath..text,
                maxLines: 2,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      var image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      // print("object" + image.toString());
                      print("object" + image.absolute.path);
                      img_path = image.absolute.path;
                      String fff = img_path.split("/").last;
                      te_imgpath..text = fff;
                    } catch (exception) {
                      print("object" + exception.toString());
                      Fluttertoast.showToast(msg: exception.toString());
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.photo), Text('Gallary')],
                  )),
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Text("OR"),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      var image = await ImagePicker.pickImage(
                          source: ImageSource.camera);
                      // print("object" + image.toString());
                      print("object" + image.absolute.path);
                      img_path = image.absolute.path;
                      String fff = img_path.split("/").last;
                      te_imgpath..text = fff;
                    } catch (exception) {
                      print("object" + exception.toString());
                      Fluttertoast.showToast(msg: exception.toString());
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.camera_alt), Text('Camera')],
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(5),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // print("allinventorylist  " + allinventory.toString());
                    // print("allinventoryimagelist  " +)
                    if (checkvalidation(id, amountadd.toString())) {
                      upcomingController.sendamount(id, amountadd,remark, img_path.toString());
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
    );
  }

  bool checkvalidation(String id, String amountadd) {
    if (id == "") {
      Fluttertoast.showToast(msg: "Select Any User");
      return false;
    } else if (amountadd == "") {
      Fluttertoast.showToast(msg: "Add Amount");
      return false;
    } else {
      return true;
    }
  }
}
