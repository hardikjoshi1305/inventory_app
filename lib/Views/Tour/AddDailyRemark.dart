import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/WalletController.dart';

import '../../Controller/TourController.dart';
import '../../Utility/CONSTANT.dart';
import '../../Utility/CommandMethod.dart';
import '../../Utility/SharedPreferenceHelper.dart';

class AddDailyRemark extends StatefulWidget {
  final String itemid;

  const AddDailyRemark({this.itemid, Key key}) : super(key: key);

  @override
  State<AddDailyRemark> createState() => _AddDailyRemarkState();
}

class _AddDailyRemarkState extends State<AddDailyRemark> {
  var remark, daily_remark;
  TextEditingController te_Remark = TextEditingController();
  TourController tourController = Get.find();

  @override
  void initState() {
    getdailyremark();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Stack(
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

  Widget screenbody() {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(children: [
          Container(
            height: 30,
            margin: EdgeInsets.all(10),
            child: Text(
              "Enter Daily Remark",
              style: TextStyle(fontSize: 19, color: Colors.black),
            ),
          ),
          tourController.getremarkdata.value.data != null
              ? TextField(
                  maxLines: 10,
                  style: TextStyle(height: 2.0, color: Colors.black),
                  controller: te_Remark
                    ..text = tourController.getremarkdata.value.data != null
                        ? tourController.getremarkdata.value.data.dailyremark
                            .toString()
                        : "",
                  keyboardType: TextInputType.text,
                  onChanged: (value) => remark = value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    // prefixIcon: Icon(Icons.comment),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:
                  const EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 5),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (validation2(remark)) {
                    tourController.createremark(
                        tour_id: widget.itemid,
                        remarkid: tourController.getremarkdata != null
                            ? tourController.getremarkdata.value.data.id
                                .toString()
                            : "",
                        dailyremark: remark.toString());
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Daily Remark",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          tourController.addailyremarklist.length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: tourController.addailyremarklist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 7,
                      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: ListTile(
                              title: Text(tourController
                                  .addailyremarklist[index].dailyremark),
                              subtitle: Text(getdateformate(tourController
                                  .addailyremarklist[index].createdAt)),
                            ),
                          ),
                          onTap: () {}),
                    );
                  },
                )
              : nodatafound(),
        ]));
  }

  bool validation2(remark) {
    if (remark.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Remark");
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    te_Remark..text = "";
    te_Remark.dispose();
    remark = "";
    print("dispose");
    super.dispose();
  }

  void getdailyremark() async {
    await Future.delayed(Duration.zero);
    String userid = await SharedPreferenceHelper().getPref(Userid);
    tourController.adddailyremark(userid, widget.itemid);
    tourController.getremark(widget.itemid);
    print("getdailyremark");
  }
}
