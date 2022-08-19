import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Views/Tour/CreatTourDetail.dart';

class TourDetailSubmission extends StatefulWidget {
  const TourDetailSubmission({Key key}) : super(key: key);

  @override
  State<TourDetailSubmission> createState() => _TourDetailSubmissionState();
}

class _TourDetailSubmissionState extends State<TourDetailSubmission> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: (() =>
                      Get.to(() => CreateTourDetail(), arguments: 1)),
                  child: Text("Expence")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: (() =>
                      Get.to(() => CreateTourDetail(), arguments: 2)),
                  child: Text("Daily Remark")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: (() =>
                      Get.to(() => CreateTourDetail(), arguments: 3)),
                  child: Text("Service Report")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: (() =>
                      Get.to(() => CreateTourDetail(), arguments: 4)),
                  child: Text("Final Dignose")),
            ),
          ],
        ),
      ),
    );
  }
}
