import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Model/ErrorResponse.dart';
import 'package:inventory_management/Views/Inventory/CreateInventory.dart';

import '../Utility/CommandMethod.dart';
import '../Utility/app_colors.dart';
import '../Views/Inventory/ReturnInventory.dart';

class ErrorListWidget extends StatelessWidget {
  final Datum UserModel;
  final String usertype;
  ErrorListWidget({this.UserModel, this.usertype});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        bottomtitle(100.0, this.UserModel.userId.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(120.0, this.UserModel.tourname),

        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(120.0, this.UserModel.ErrorName),

        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
            100.0,
            this.UserModel.IsCompleted.toString() == "1"
                ? "Completed"
                : "Pending"),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0, getdateformate(this.UserModel.createdAt)),
        Container(
          width: 1,
          color: Colors.white,
        ),

        // Container(
        //   width: 120,
        //   height: 40,
        //   alignment: AlignmentDirectional.center,
        //   decoration: new BoxDecoration(
        //     borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        //     boxShadow: <BoxShadow>[
        //       BoxShadow(
        //         color: AppColors.offWhite,
        //         offset: Offset(1.0, 6.0),
        //         blurRadius: 0.001,
        //       ),
        //     ],
        //   ),
        //   padding: const EdgeInsets.all(12.0),
        //   child: Text(
        //     this.UserModel.createdAt.toString(),
        //     style: TextStyle(
        //         fontWeight: FontWeight.w400, color: AppColors.darkBlue),
        //   ),
        // ),

        GestureDetector(
          onTap: () {
            Get.defaultDialog(
              title: "Detail",
              middleText: "Error : " +
                  this.UserModel.ErrorName +
                  "\n" +
                  "\n" +
                  "Final Dignose :  " +
                  this.UserModel.FinalDignose,
              // textConfirm: "Confirm",
              // confirmTextColor: Colors.white,
            );
          },
          child: Container(
              width: 130,
              height: 40,
              alignment: AlignmentDirectional.center,
              color: AppColors.offWhite,
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        "View",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )),
        )
      ],
    );
    // Card(
    //   elevation: 7,
    //   margin: EdgeInsets.only(top: 16, left: 16, right: 16),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: InkWell(
    //     onTap: () {
    //       // Navigator.of(context).pushNamed(TherapyDetailScreen.routName,
    //       //     arguments: TherapyDetailArguments(
    //       //         categoryTitle: categoryTitle ?? '',
    //       //         therapyTitle: therapyModel.title));
    //     },
    //     child: Column(
    //       children: [
    //         ClipRRect(
    //             borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(10),
    //                 topRight: Radius.circular(10)),
    //             // child: CachedNetworkImage(
    //             //   imageUrl: therapyModel.imageUrl,
    //             //   progressIndicatorBuilder: (ctx, url, downloadProgess) {
    //             //     return Center(
    //             //         child: CircularProgressIndicator(
    //             //             color: AppColors.darkYellow));
    //             //   },
    //             //   width: double.infinity,
    //             //   fit: BoxFit.fill,
    //             //   height: 220,
    //             // )),
    //         ),
    //         SizedBox(height: 12),
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(width: 10),
    //             Expanded(
    //                 child: Text(UserModel.name,
    //                     style: TextStyle(
    //                         color: AppColors.darkGray,
    //                         fontWeight: FontWeight.w500))),
    //             SizedBox(width: 16),
    //             Text(
    //                "",
    //               style: TextStyle(
    //                 fontSize: 12,
    //                 color: AppColors.darkGray,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //             SizedBox(width: 10)
    //           ],
    //         ),
    //         SizedBox(height: 6),
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             SizedBox(width: 10),
    //             // Expanded(
    //             //     child: Text(therapyModel.englishName ?? '',
    //             //         style: TextStyle(
    //             //             fontSize: 12, color: AppColors.darkGray))),
    //             // SizedBox(width: 16),
    //             // SvgPicture.asset('assets/icons/ic_circle_arrow_right.svg',
    //             //     width: 20, height: 20),
    //             // SizedBox(width: 10)
    //           ],
    //         ),
    //         SizedBox(height: 12),
    //       ],
    //     ),
    //   ));
  }
}
