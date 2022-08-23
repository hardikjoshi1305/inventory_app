import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';

import '../../Component/InventoryListWidget.dart';
import '../../Controller/InventoryController.dart';
import '../../Utility/app_colors.dart';

class UserInventory extends StatefulWidget {
  const UserInventory({Key key}) : super(key: key);

  @override
  State<UserInventory> createState() => _UserInventoryState();
}

InventoryController inventoryController = Get.put(InventoryController());
apicall() async {
  Future.delayed(Duration.zero);
  inventoryController.fetchuserinventorylist();
}

class _UserInventoryState extends State<UserInventory> {
// getauthtoken() async {
//   var token = await SharedPreferenceHelper().getPref(TOKEN);
//   // inventoryController.fetchinventorylist(token);
// }

  @override
  void initState() {
    // getauthtoken();
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: Text('Inventory'),
        ),
        drawer: UserDrawer(),
        body: Container(
            child: Obx(() => inventoryController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : inventoryController.userinventorylist != null
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "ID",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Code",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Serial No.",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.offWhite,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Px No.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Machine",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Location",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Remark",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                    // Container(
                                    //   width: 120,
                                    //   alignment: AlignmentDirectional.center,
                                    //   decoration: new BoxDecoration(
                                    //     borderRadius: new BorderRadius.all(
                                    //         const Radius.circular(10.0)),
                                    //     boxShadow: <BoxShadow>[
                                    //       BoxShadow(
                                    //         color: AppColors.darkBlue,
                                    //         offset: Offset(1.0, 6.0),
                                    //         blurRadius: 0.001,
                                    //       ),
                                    //     ],
                                    //   ),
                                    //   padding: const EdgeInsets.all(12.0),
                                    //   child: Text(
                                    //     "Date",
                                    //     style: TextStyle(
                                    //         fontWeight: FontWeight.w400,
                                    //         color: AppColors.offWhite),
                                    //   ),
                                    // ),
                                    Container(
                                      width: 130,
                                      alignment: AlignmentDirectional.center,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppColors.darkBlue,
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 0.001,
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "Action",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.offWhite),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Obx(() => (inventoryController
                                          .isLoading.value)
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Column(
                                          children: [
                                            ...inventoryController
                                                .userinventorylist
                                                .map((element) {
                                              print("userlist" + element.name);
                                              return InventoryListWidget(
                                                UserModel: element,
                                                usertype: "user",
                                              );
                                            }).toList()
                                          ],
                                        )),
                                ),

                                // ListView.builder(
                                //     shrinkWrap: true,
                                //     padding: EdgeInsets.only(bottom: 16),
                                //     itemCount: inventoryController.inventorylist.length,
                                //     itemBuilder: (ctx, index) {
                                //       var therapy =
                                //           inventoryController.inventorylist.elementAt(index);
                                //       return InventoryListWidget(UserModel: therapy);
                                //     })
                              ],
                            ),
                          ),
                        ))
                    : nodatafound())));
  }
}