import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart';
import 'package:inventory_management/Views/Inventory/CreateInventory.dart';

import '../Utility/CommandMethod.dart';
import '../Utility/app_colors.dart';
import '../Views/Inventory/ReturnInventory.dart';

class InventoryListWidget extends StatelessWidget {
  final Datum UserModel;
  final String usertype;
  InventoryListWidget({this.UserModel, this.usertype});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        bottomtitle(100.0, this.UserModel.id.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(120.0, this.UserModel.code),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(200.0, this.UserModel.name),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
          200.0,
          this.UserModel.serialNo,
        ),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0, this.UserModel.pxNo.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0, this.UserModel.machine.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0, this.UserModel.location.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
            100.0,
            this.UserModel.statusdetail == null
                ? "-"
                : this.UserModel.statusdetail),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
            180.0,
            this.UserModel.status_name != null
                ? this.UserModel.status_name
                : "-"),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(
            100.0,
            this.UserModel.price == null
                ? "-"
                : this.UserModel.price.toString() + " \u{20B9}"),
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
        Container(
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
                  child: IconButton(
                    onPressed: () =>
                        Get.to(CreateInventory(), arguments: this.UserModel),
                    icon: Icon(Icons.edit_calendar,
                        color: AppColors.darkBlue, size: 25),
                  ),
                ),
              ],
            )),
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
