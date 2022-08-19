import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/PendingController.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Views/Tour/CreatTourDetail.dart';

import '../Tour/TourDetailSubmission.dart';

class Pending extends StatefulWidget {
  const Pending({Key key}) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  final PendingController upcomingController = Get.put(PendingController());
  getauthtoken() async {
    var token = await SharedPreferenceHelper().getPref(TOKEN);
    print("token" + token.toString());
  }

  Widget build(BuildContext context) {
    getauthtoken();
    upcomingController.pendingitem(userid: "101");
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Obx(() {
              if (upcomingController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.count(
                    crossAxisCount: 1,
                    children:
                        List.generate(upcomingController.login.length, (index) {
                      return Center(
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() => TourDetailSubmission());
                                // CreateTourDetail());
                              },
                              child: Column(
                                children: [
                                  Text(upcomingController
                                      .login[index].character),
                                  Text(upcomingController
                                      .login[index].character),
                                  Text(
                                      upcomingController.login[index].character)
                                ],
                              )));
                    }));
              }
            }))
          ],
        ),
      ),
    );
  }
}
