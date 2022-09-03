import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/TourController.dart';
import 'package:inventory_management/Views/Tour/AddDailyRemark.dart';
import 'package:inventory_management/Views/Tour/AddExpense.dart';
import 'package:inventory_management/Views/Tour/AddServiceReport.dart';
import 'package:mime/mime.dart';
import 'package:image_picker/image_picker.dart';

class CreateTourDetail extends StatefulWidget {
  const CreateTourDetail({Key key}) : super(key: key);

  @override
  State<CreateTourDetail> createState() => _CreateTourDetailState();
}

class _CreateTourDetailState extends State<CreateTourDetail> {
  var photo, final_dignose;
  var item = Get.arguments;

  TourController tourController = Get.put(TourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Details"),
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                ))),
      ),
    );
  }

  Widget screenbody() {
    return item[0] == 1
        ? AddExpense(itemid: item[1])
        : item[0] == 2
            ? AddDailyRemark(itemid: item[1])
            : item[0] == 3
                ? AddServiceReport(
                    itemid: item[1],
                  )
                : Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(children: [
                            Container(
                              height: 40,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "Final Dignose",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.black),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                maxLines: 10,
                                style:
                                    TextStyle(height: 2.0, color: Colors.black),
                                keyboardType: TextInputType.text,
                                onChanged: (value) => final_dignose = value,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  // labelText: 'Final Dignose',
                                  // prefixIcon: Icon(Icons.comment),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (validation3(final_dignose)) {
                                      tourController.createdignose(
                                          tour_id: item[1],
                                          finaldignose:
                                              final_dignose.toString());
                                    }
                                  },
                                  child: const Text('Submit'),
                                ),
                              ),
                            )
                          ]))
                    ],
                  );
  }

  bool validation2(remark) {
    if (remark.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Remark");
      return false;
    } else {
      return true;
    }
  }

  bool validation3(final_dignose) {
    if (final_dignose.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Final Dignose");
      return false;
    } else {
      return true;
    }
  }
}
