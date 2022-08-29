import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/WalletController.dart';
import 'package:inventory_management/Model/ExpenseListDetailsResponse.dart';
import 'package:inventory_management/Utility/Imagedisplay.dart';
import 'package:inventory_management/Utility/app_colors.dart';

import '../Utility/CommandMethod.dart';

class ExpenseListWidget extends StatelessWidget {
  final Datum expenselist;
  int position;

  ExpenseListWidget({this.expenselist, this.position});

  Widget cancelbutton() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel"));
  }

  Widget confirmbutton(String s) {
    return ElevatedButton(
        onPressed: () {
          acceptrejectorderapi(s, expenselist.id.toString());
          Get.back();
        },
        child: Text("Confirm"));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 120.0,
            height: 40,
            color: AppColors.offWhite,
            child: expenselist.isApproved == "0"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            title: "Alert",
                            middleText: "Are you Sure You Want to accept " +
                                expenselist.expensesName +
                                " expense" +
                                "?",
                            actions: [cancelbutton(), confirmbutton("1")],
                            // textConfirm: "Confirm",
                            // confirmTextColor: Colors.white,
                          );
                        },
                        child: Container(
                          color: Colors.green,
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            title: "Alert",
                            middleText: "Are you Sure You Want to Reject " +
                                expenselist.expensesName +
                                " expense" +
                                "?",
                            actions: [cancelbutton(), confirmbutton("2")],
                            // textConfirm: "Confirm",
                            // confirmTextColor: Colors.white,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          color: Colors.red,
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    alignment: AlignmentDirectional.center,
                    child: Text("-"),
                  )),
        bottomtitle(
            100.0, expenselist.tourname == null ? "-" : expenselist.tourname),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0,
            expenselist.expensesName == null ? "-" : expenselist.expensesName),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
            100.0,
            expenselist.amount == null
                ? "-"
                : expenselist.amount + " \u{20B9}"),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
            100.0,
            expenselist.createdAt.toString() == null
                ? "-"
                : getdateformate(expenselist.createdAt)),
        Container(
          width: 1,
          color: Colors.white,
        ),
        expenselist.photo != null
            ? GestureDetector(
                onTap: () {
                  Get.to(() => Imagedisplay(imgurl: expenselist.photo));
                },
                child: Container(
                  width: 100.0,
                  height: 40,
                  alignment: AlignmentDirectional.center,
                  color: AppColors.offWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 7,
                        color: AppColors.darkBlue,
                        margin: EdgeInsets.only(top: 6, left: 6, right: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: EdgeInsets.all(1),
                            margin: EdgeInsets.all(1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.white,
                                ),
                                // Text(
                                //   "View",
                                //   style: TextStyle(color: Colors.white),
                                // )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                alignment: AlignmentDirectional.center,
                color: AppColors.offWhite,
                width: 100.0,
                height: 40,
                child: Text("-"),
              ),
      ],
    )
        //   Container(
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //     color: CupertinoColors.systemGrey5,
        //   ),
        //   margin: EdgeInsets.all(10),
        //   padding: EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisSize: MainAxisSize.max,
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Align(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Text(
        //                   expenselist.expensesName == null
        //                       ? "-"
        //                       : expenselist.expensesName,
        //                   style: TextStyle(color: Colors.black, fontSize: 15),
        //                 ),
        //                 Container(
        //                   height: 5,
        //                 ),
        //                 // Text(
        //                 //   tourhistmodel.city.toString() == null
        //                 //       ? "-"
        //                 //       : tourhistmodel.city.toString(),
        //                 //   // "13 May,2019 01:30 PM",
        //                 //   style: TextStyle(color: Colors.grey, fontSize: 15),
        //                 // )
        //               ],
        //             ),
        //           ),
        //           Align(
        //             alignment: AlignmentDirectional.center,
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Text(
        //                   expenselist.tourname == null ? "-" : expenselist.tourname,
        //                   style: TextStyle(color: Colors.black, fontSize: 15),
        //                 ),
        //                 Container(
        //                   height: 5,
        //                 ),
        //                 Text(
        //                   expenselist.createdAt.toString() == null
        //                       ? "-"
        //                       : getdateformate(expenselist.createdAt),
        //                   // "13 May,2019 01:30 PM",
        //                   style: TextStyle(color: Colors.grey, fontSize: 15),
        //                 )
        //               ],
        //             ),
        //           ),
        //           Padding(
        //               padding: const EdgeInsets.only(right: 12.0),
        //               child: expenselist.amount == null
        //                   ? Container(
        //                       padding: EdgeInsets.all(5),
        //                       alignment: AlignmentDirectional.centerEnd,
        //                       color: Colors.red,
        //                       child: Text(
        //                         "-",
        //                         style: TextStyle(color: Colors.white, fontSize: 17),
        //                       ),
        //                     )
        //                   : Container(
        //                       padding: EdgeInsets.all(5),
        //                       alignment: AlignmentDirectional.centerEnd,
        //                       color: Colors.green,
        //                       child: Text(
        //                         expenselist.amount + " \u{20B9}",
        //                         style: TextStyle(color: Colors.white, fontSize: 17),
        //                       ),
        //                     )),
        //         ],
        //       ),
        //       expenselist.photo != null
        //           ? GestureDetector(
        //               onTap: () {
        //                 Get.to(() => Imagedisplay(imgurl: expenselist.photo));
        //               },
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.end,
        //                 children: [
        //                   Card(
        //                     elevation: 7,
        //                     color: AppColors.darkBlue,
        //                     margin: EdgeInsets.only(top: 6, left: 6, right: 10),
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10),
        //                     ),
        //                     child: Container(
        //                         padding: EdgeInsets.all(6),
        //                         margin: EdgeInsets.all(5),
        //                         child: Column(
        //                           children: [
        //                             Icon(
        //                               Icons.image,
        //                               color: Colors.white,
        //                             ),
        //                             // Text(
        //                             //   "View",
        //                             //   style: TextStyle(color: Colors.white),
        //                             // )
        //                           ],
        //                         )),
        //                   )
        //                 ],
        //               ),
        //             )
        //           : Container(),
        //       expenselist.isApproved == "0"
        //           ? Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 GestureDetector(
        //                   onTap: () {
        //                     acceptrejectorderapi("1", expenselist.id.toString());
        //                   },
        //                   child: Container(
        //                     margin: EdgeInsets.all(10),
        //                     color: Colors.blue,
        //                     width: 80,
        //                     height: 40,
        //                     alignment: AlignmentDirectional.center,
        //                     child: Container(
        //                       child: Text(
        //                         "Accept",
        //                         style: TextStyle(color: Colors.white),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 GestureDetector(
        //                     onTap: () {
        //                       acceptrejectorderapi("2", expenselist.id.toString());
        //                     },
        //                     child: Container(
        //                         margin: EdgeInsets.all(10),
        //                         width: 80,
        //                         height: 40,
        //                         alignment: AlignmentDirectional.center,
        //                         color: Colors.red,
        //                         child: Container(
        //                           child: Text(
        //                             "Reject",
        //                             style: TextStyle(color: Colors.white),
        //                           ),
        //                         ))),
        //               ],
        //             )
        //           : Container()
        //     ],
        //   ),
        // )
        ;
  }

  void acceptrejectorderapi(String is_approved, String expense_id) async {
    WalletController walletController = Get.find();
    await Future.delayed(Duration.zero);
    walletController.acceptreject(is_approved, expense_id, position);
  }
}
