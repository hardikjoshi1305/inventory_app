import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Controller/TourController.dart';

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
      )
    ]));
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
