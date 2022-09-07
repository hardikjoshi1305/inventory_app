import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Obx(() => Stack(
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
        ));
  }

  Widget screenbody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
          child: Column(children: [
        Container(
          height: 60,
        ),
        SizedBox(
          child: ElevatedButton(
              onPressed: () async {
                try {
                  FilePickerResult result =
                      await FilePicker.platform.pickFiles();
                  if (result != null) {
                    // File file = File(result.files.single.path);

                    PlatformFile file = result.files.single; // PlatformFile
                    // final mimeType = lookupMimeType(file.name) ?? '';
                    print("object" + file.name);
                    print("path" + file.path);
                    reportfile = file.path;
                    String jjj = reportfile.toString().split("/").last;
                    te_service..text = jjj;
                  }
                  // var image = await FilePicker
                  //   ..pickImage(source: ImageSource.gallery);
                  // // print("object" + image.toString());

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
        tourController.adreportlist != null
            ? Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: tourController.adreportlist.length,
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
                                  tourController
                                      .adreportlist[index].serviceReport,
                                  style: TextStyle(
                                      color: CupertinoColors.activeBlue),
                                ),
                              ),
                            ),
                            onTap: () async {
                              print("url " +
                                  URL_Live +
                                  tourController
                                      .adreportlist[index].serviceReport);
                              if (!await launchUrl(
                                  Uri.parse(URL_Live +
                                      tourController
                                          .adreportlist[index].serviceReport),
                                  mode: LaunchMode.externalApplication)) {
                                throw 'Could not launch ';
                              }
                              // Get.to(() => Imagedisplay(
                              //     imgurl: tourController
                              //         .adreportlist[index].serviceReport));
                            }),
                      );
                    },
                  )
                ],
              )
            : nodatafound(),
      ])),
    );
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
