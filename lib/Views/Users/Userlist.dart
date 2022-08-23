import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Component/UserListWidget.dart';
import 'package:inventory_management/Controller/UserController.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';
import 'package:inventory_management/Views/Users/CreateUser.dart';
import 'package:inventory_management/Views/Login/Login.dart';

import '../../Utility/CommandMethod.dart';
import '../Inventory/Inventory.dart';

class Userlist extends StatefulWidget {
  const Userlist({Key key}) : super(key: key);

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  UserController userController = Get.put(UserController());

  apicall() async {
    await Future.delayed(Duration.zero);
    userController.fetchuserlist();
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar: AdminAppBar(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Obx(() => userController.isLoading.value
              ? Container(child: Center(child: CircularProgressIndicator()))
              : userController.userlist != null
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(10.0)),
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
                                    "ID",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.offWhite),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(10.0)),
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
                                    "User ID",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.offWhite),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(10.0)),
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
                                    "Device ID",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.offWhite),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(10.0)),
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
                                    "Mobile Number",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offWhite,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(10.0)),
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
                                    "Is Active",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.offWhite),
                                  ),
                                ),
                                Container(
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(10.0)),
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
                                    "Wallet Balance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.offWhite),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Obx(() => SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        ...userController.userlist
                                            .map((element) {
                                          return UserListWidget(
                                              UserModel: element);
                                        }).toList()
                                      ],
                                    ),
                                  )),
                            ),

                            // ListView.builder(
                            //     primary: false,
                            //     shrinkWrap: true,
                            //     padding: EdgeInsets.only(bottom: 16),
                            //     itemCount: 5,
                            //     itemBuilder: (ctx, index) {
                            //       var therapy = userController.userlist.elementAt(index);
                            //       return Text(therapy.name);
                            //       UserListWidget(UserModel: therapy);
                            //     }),
                          ],
                        ),
                      ))
                  : nodatafound())),
    );
  }
}
