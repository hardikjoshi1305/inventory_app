import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Views/Tour/CreatTourDetail.dart';

class TourDetailSubmission extends StatefulWidget {
  const TourDetailSubmission({Key key}) : super(key: key);

  @override
  State<TourDetailSubmission> createState() => _TourDetailSubmissionState();
}

class _TourDetailSubmissionState extends State<TourDetailSubmission> {
  var tour_id = Get.arguments as String;

  @override
  Widget build(BuildContext context) {
    print("itemid" + tour_id);
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Details"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: (() => Get.offNamed("/CreateTourDetail",
                      preventDuplicates: false, arguments: [1, tour_id])),
                  child: Text("Expence")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: (() => Get.offNamed("/CreateTourDetail",
                      preventDuplicates: false, arguments: [2, tour_id])),
                  child: Text("Daily Remark")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: (() => Get.offNamed("/CreateTourDetail",
                      preventDuplicates: false, arguments: [3, tour_id])),
                  child: Text("Service Report")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: (() => Get.offNamed("/CreateTourDetail",
                      preventDuplicates: false, arguments: [4, tour_id])),
                  child: Text("Final Dignose")),
            ),
          ],
        ),
      ),
    );
  }
}
