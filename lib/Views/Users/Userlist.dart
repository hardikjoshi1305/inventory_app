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
        body: RefreshIndicator(
          onRefresh: () => apicall(),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Obx(() => Stack(
                    fit: StackFit.loose,
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Opacity(
                        opacity:
                            1, // You can reduce this when loading to give different effect
                        child: AbsorbPointer(
                          absorbing: userController.isLoading.value,
                          child: screenbody(),
                        ),
                      ),
                      Opacity(
                        opacity: userController.isLoading.value ? 1.0 : 0,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ))),
        ));
  }

  Widget screenbody() {
    return userController.userlist != null
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      toptitle(100.0, "ID"),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      toptitle(100.0, "User ID"),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      toptitle(200.0, "Device ID"),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      toptitle(200.0, "Mobile Number"),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      toptitle(100.0, "Is Active"),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      toptitle(130.0, "Wallet Balance"),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Obx(() => SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...userController.userlist.map((element) {
                                return UserListWidget(UserModel: element);
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
        : nodatafound();
  }
}
