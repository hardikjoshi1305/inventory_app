import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Component/UserListWidget.dart';
import 'package:inventory_management/Controller/UserController.dart';
import 'package:inventory_management/Model/UserlistResponse.dart';
import 'package:inventory_management/Utility/app_colors.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';
import 'package:inventory_management/Views/Users/CreateUser.dart';

import '../../Utility/CommandMethod.dart';
import '../Inventory/Inventory.dart';

class Userlist extends StatefulWidget {
  const Userlist({Key key}) : super(key: key);

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    userController.fetchuserlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 4.0,
        child: Container(
          color: Colors.blueGrey[600],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              createDrawerHeader(),
              createDrawerBodyItem(
                  icon: Icons.pending_actions,
                  text: 'Users',
                  onTap: () {
                    Get.to(() => HomeScreen());
                    // Navigator.of(context).pop();
                    // Navigator.pushNamed(context, pageRoutes.landscape);
                  }),
              createDrawerBodyItem(
                  icon: Icons.cloud_done_rounded,
                  text: 'Inventory',
                  onTap: () {
                    Get.to(() => Inventory());

                    // _permissionStatus?
                    // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                  }),
              Divider(),
              // Padding(
              //   padding: const EdgeInsets.only(left: 18.0),
              //   child: Text(
              //     'Special Access',
              //     style: TextStyle(
              //         color: Colors.grey
              //     ),
              //   ),
              // ),
              // createDrawerBodyItem(
              //     icon: Icons.inventory, text: 'Inventory',
              //     onTap: ()  {   Navigator.of(context).pop();
              //
              //       // _permissionStatus?
              //       // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              //     }
              // ),
              ListTile(
                title: Text('App version 1.0.0'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                Get.to(() => Createuser());
              },
              child: Text("Create User")),
        ],
        title: Text('Agour'),
      ),
      body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
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
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
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
                        "UserName",
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
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
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
                        "Email ID",
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
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
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
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
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
                        "City",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.offWhite),
                      ),
                    ),
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
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
                ...userController.userlist.map((element) {
                  return UserListWidget(UserModel: element);
                }).toList()

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
          )),
    );
  }
}
