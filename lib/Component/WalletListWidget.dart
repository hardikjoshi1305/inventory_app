import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Model/WalletHistoryResponse.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';

import '../Utility/Imagedisplay.dart';
import '../Utility/app_colors.dart';

class WalletListWidget extends StatelessWidget {
  final Datum walletmodel;

  WalletListWidget({this.walletmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              width: 120,
              height: 40,
              alignment: AlignmentDirectional.center,
              color: AppColors.offWhite,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    walletmodel.creditAmount == null
                        ? "-"
                        : walletmodel.creditAmount.toString() + " \u{20B9}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.green),
                  ),
                ],
              )),

          Container(
            width: 1,
            color: Colors.white,
          ),
          Container(
              width: 120,
              height: 40,
              alignment: AlignmentDirectional.center,
              color: AppColors.offWhite,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    walletmodel.debitAmount == null
                        ? "-"
                        : walletmodel.debitAmount.toString() + " \u{20B9}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.red),
                  ),
                ],
              )),
          Container(
            width: 1,
            color: Colors.white,
          ),
          bottomtitle(
              150.0,
              walletmodel.expenseId == null
                  ? "Admin"
                  : walletmodel.creditAmount != null
                      ? walletmodel.expensesName
                      : walletmodel.expensesName.toString()),
          Container(
            width: 1,
            color: Colors.white,
          ),
          bottomtitle(
              150.0,
              walletmodel.is_approved == null
                  ? "Approved"
                  : walletmodel.is_approved == "1"
                      ? "Approved"
                      : walletmodel.is_approved == "0"
                          ? "Pending"
                          : "Rejected"),
          Container(
            width: 1,
            color: Colors.white,
          ),
          bottomtitle(
              160.0,
              walletmodel.createdAt.toString() == null
                  ? "-"
                  : getdateformate2(walletmodel.createdAt)),
          Container(
            width: 1,
            color: Colors.white,
          ),
          walletmodel.photo != null
              ? GestureDetector(
                  onTap: () {
                    Get.to(() => Imagedisplay(imgurl: walletmodel.photo));
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
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Icon(
          //     Icons.circle,
          //     color: Colors.blueGrey,
          //     size: 28,
          //   ),
          // ),
          // Align(
          //   alignment: AlignmentDirectional.center,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Text(
          //         walletmodel.expensesName == null
          //             ? "-"
          //             : walletmodel.expensesName,
          //         style: TextStyle(color: Colors.black, fontSize: 15),
          //       ),
          //       Container(
          //         height: 5,
          //       ),
          //       Text(
          //         walletmodel.createdAt.toString() == null
          //             ? "-"
          //             : getdateformate2(walletmodel.createdAt),
          //         // "13 May,2019 01:30 PM",
          //         style: TextStyle(color: Colors.grey, fontSize: 15),
          //       )
          //     ],
          //   ),
          // ),
          // Padding(
          //     padding: const EdgeInsets.only(right: 12.0),
          //     child: walletmodel.creditAmount == null
          //         ? Container(
          //             alignment: AlignmentDirectional.centerEnd,
          //             // color: Colors.red,
          //             child: Text(
          //               walletmodel.debitAmount == null
          //                   ? "-"
          //                   : walletmodel.debitAmount + " \u{20B9}",
          //               style: TextStyle(color: Colors.red, fontSize: 20),
          //             ),
          //           )
          //         : Container(
          //             alignment: AlignmentDirectional.centerEnd,
          //             // color: Colors.green,
          //             child: Text(
          //               walletmodel.creditAmount == null
          //                   ? "-"
          //                   : walletmodel.creditAmount + " \u{20B9}",
          //               style: TextStyle(color: Colors.green, fontSize: 20),
          //             ),
          //           )),
        ],
      ),
    );
  }
}
