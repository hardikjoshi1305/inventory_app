import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Model/AssignInventoryResponse.dart';
import 'package:inventory_management/Utility/Imagedisplay.dart';
import 'package:inventory_management/Views/Inventory/CreateInventory.dart';
import 'package:inventory_management/Views/Inventory/UserInventory.dart';

import '../Utility/CommandMethod.dart';
import '../Utility/app_colors.dart';
import '../Views/Inventory/ReturnInventory.dart';

class UserInventoryListWidget extends StatelessWidget {
  final Datum UserModel;
  int usertype;

  UserInventoryListWidget({this.UserModel, this.usertype});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        bottomtitle(100.0, this.UserModel.id.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(120.0, this.UserModel.code.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(200.0, this.UserModel.name.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        // bottomtitle(200.0, this.UserModel.serialNo.toString()),
        // Container(
        //   width: 1,
        //   color: Colors.white,
        // ),
        // bottomtitle(100.0, this.UserModel.pxNo.toString()),
        // Container(
        //   width: 1,
        //   color: Colors.white,
        // ),
        bottomtitle(100.0, this.UserModel.machine.toString()),
        Container(
          width: 1,
          color: Colors.white,
        ),
        bottomtitle(100.0, this.UserModel.location.toString()),
        // Container(
        //   width: 1,
        //   color: Colors.white,
        // ),
        // bottomtitle(
        //     100.0,
        //     this.UserModel.remark == null
        //         ? "-"
        //         : this.UserModel.remark.toString()),
        // Container(
        //   width: 1,
        //   color: Colors.white,
        // ),
        // bottomtitle(100.0,
        //     this.UserModel.statusId != null ? this.UserModel.statusId : "-"),
        Container(
          width: 1,
          color: Colors.white,
        ),
        Container(
            width: 130,
            height: 40,
            alignment: AlignmentDirectional.center,
            color: AppColors.offWhite,
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                this.UserModel.status == "0"
                    ? Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(color: AppColors.darkBlue),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: () {
                              callacceptapi(UserModel.sendPartsId.toString());
                            },
                            child: Text("Accept",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ))
                    : Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(color: AppColors.darkBlue),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              callreturnapi(UserModel);
                            },
                            child: Text("Return",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )),
              ],
            )),
        // Container(
        //   width: 1,
        //   color: Colors.white,
        // ),
        // Container(
        //     width: 130,
        //     height: 40,
        //     alignment: AlignmentDirectional.center,
        //     color: AppColors.offWhite,
        //     padding: const EdgeInsets.all(1.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         this.UserModel.photo != "" || this.UserModel.photo != null
        //             ? Align(
        //                 alignment: AlignmentDirectional.center,
        //                 child: Container(
        //                   alignment: AlignmentDirectional.center,
        //                   margin: EdgeInsets.all(4),
        //                   decoration: BoxDecoration(color: AppColors.darkBlue),
        //                   child: ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                       primary: Colors.blue,
        //                     ),
        //                     onPressed: () {
        //                       viewimage(UserModel.photo.toString());
        //                     },
        //                     child: Text("View",
        //                         style: TextStyle(color: Colors.white)),
        //                   ),
        //                 ))
        //             : Container()
        //       ],
        //     )),
        // Container(
        //   width: 1,
        //   color: Colors.white,
        // ),
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

  callacceptapi(String inventoryid) async {
    InventoryController inventoryController = Get.find();
    await Future.delayed(Duration.zero);
    inventoryController.acceptinventory(inventoryid, usertype);
  }

  void callreturnapi(Datum userModel) async {
    Get.to(() => ReturnInventory(), arguments: userModel);
  }

  void viewimage(String photo) {
    print("photo" + photo);
    Get.to(() => Imagedisplay(imgurl: photo));
  }
  // void callreturnapi(Datum userModel)async {
  //   InventoryController inventoryController = Get.put(InventoryController());
  //
  //   await Future.delayed(Duration.zero);
  //   inventoryController.returninventory(userModel);
  //
  // }
}
