import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Controller/InventoryController.dart';
import 'package:inventory_management/Model/AssignInventoryResponse.dart';
import 'package:inventory_management/Utility/Imagedisplay.dart';
import 'package:inventory_management/Views/Inventory/CreateInventory.dart';
import 'package:inventory_management/Views/Inventory/UserInventory.dart';

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
        Container(
          width: 100,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.id.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
        ),
        Container(
          width: 120,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.code,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
        ),
        Container(
          width: 200,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.name,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
        ),
        Container(
          width: 200,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.serialNo,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.darkBlue,
            ),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.pxNo,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.machine,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.location,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.remark == null ? "-" : this.UserModel.remark,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
        ),
        Container(
          width: 100,
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.offWhite,
                offset: Offset(1.0, 6.0),
                blurRadius: 0.001,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            this.UserModel.statusId != null ? this.UserModel.statusId : "-",
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
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
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.offWhite,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 0.001,
                ),
              ],
            ),
            padding: const EdgeInsets.all(1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(1.0),
                //   child: IconButton(
                //     onPressed: () =>
                //         Get.to(CreateInventory(), arguments: this.UserModel),
                //     icon: Icon(Icons.edit_calendar,
                //         color: AppColors.darkBlue, size: 25),
                //   ),
                // ),

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
                        ))
              ],
            )),
        Container(
            width: 130,
            height: 40,
            alignment: AlignmentDirectional.center,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.offWhite,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 0.001,
                ),
              ],
            ),
            padding: const EdgeInsets.all(1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(1.0),
                //   child: IconButton(
                //     onPressed: () =>
                //         Get.to(CreateInventory(), arguments: this.UserModel),
                //     icon: Icon(Icons.edit_calendar,
                //         color: AppColors.darkBlue, size: 25),
                //   ),
                // ),

                this.UserModel.photo != "" || this.UserModel.photo != null
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
                              viewimage(UserModel.photo.toString());
                            },
                            child: Text("View",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ))
                    : Container()
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
