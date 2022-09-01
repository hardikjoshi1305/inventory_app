import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Controller/TourController.dart';
import '../../Utility/CONSTANT.dart';
import '../../Utility/CommandMethod.dart';
import '../../Utility/Imagedisplay.dart';
import '../../Utility/SharedPreferenceHelper.dart';

class AddServiceReport extends StatefulWidget {
  final String itemid;
  const AddServiceReport({this.itemid, Key key}) : super(key: key);

  @override
  State<AddServiceReport> createState() => _AddServiceReportState();
}

TourController tourController = Get.put(TourController());

class _AddServiceReportState extends State<AddServiceReport> {
  var reportfile;
  TextEditingController te_service = TextEditingController();
  @override
  void dispose() {
    te_service.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getservicereportlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        height: 60,
      ),
      SizedBox(
        child: ElevatedButton(
            onPressed: () async {
              try {
                var image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                // print("object" + image.toString());
                print("object" + image.absolute.path);
                reportfile = image.absolute.path;
                String jjj = reportfile.toString().split("/").last;
                te_service..text = jjj;
              } catch (exception) {
                print("object" + exception.toString());
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.image), Text("Upload Service Report")],
            )),
      ),
      Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          enabled: false,
          controller: te_service..text,
          maxLines: 2,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(5),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (validation4(reportfile)) {
                tourController.createreportfile(
                    tour_id: widget.itemid,
                    service_report: reportfile.toString());
              }

              // Get.dialog(Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ElevatedButton(
              //             onPressed: () {
              //               sharefile()
              //             },
              //             child: Text('Share File')),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ElevatedButton(
              //             onPressed: () {},
              //             child: Text('Share Image')),
              //       )
              //     ],
              //   ),
              // ));
            },
            child: const Text('Submit'),
          ),
        ),
      ),
      Container(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "Service Report",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      Divider(
        color: Colors.black,
      ),
      tourController.adreportlist.value.length > 0
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: tourController.adreportlist.value.length,
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
                          title: Text(
                            tourController.adreportlist[index].serviceReport,
                            style: TextStyle(color: CupertinoColors.activeBlue),
                          ),
                        ),
                      ),
                      onTap: () {
                        Get.to(() => Imagedisplay(
                            imgurl: tourController
                                .adreportlist[index].serviceReport));
                      }),
                );
              },
            )
          : nodatafound(),
    ]));
  }

  void getservicereportlist() async {
    await Future.delayed(Duration.zero);
    String userid = await SharedPreferenceHelper().getPref(Userid);
    tourController.addservicereportlist(userid, widget.itemid);
  }
}

bool validation4(reportfile) {
  if (reportfile.toString().isEmpty) {
    Fluttertoast.showToast(msg: "Please Select File.");
    return false;
  } else {
    return true;
  }
}
