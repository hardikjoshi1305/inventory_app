import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Views/Pending/Pending.dart';
import 'package:inventory_management/Views/Tour/Createtrip.dart';
import 'package:inventory_management/Views/Wallet/WalletScreen.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Utility/IconList.dart';
import '../../Utility/app_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _permissionStatus;

  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();
  }

  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
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
                        text: 'Pending',
                        onTap: () {
                          // Navigator.of(context).pop();
                          // Navigator.pushNamed(context, pageRoutes.landscape);
                        }),
                    createDrawerBodyItem(
                        icon: Icons.cloud_done_rounded,
                        text: 'Completed',
                        onTap: () {
                          Navigator.of(context).pop();

                          // _permissionStatus?
                          // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                        }),
                    createDrawerBodyItem(
                        icon: Icons.wallet,
                        text: 'Wallet',
                        onTap: () {
                         Get.to(()=>WalletScreen());

                          // _permissionStatus?
                          // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                        }),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Special Access',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    createDrawerBodyItem(
                        icon: Icons.inventory,
                        text: 'Inventory',
                        onTap: () {
                          Navigator.of(context).pop();

                          // _permissionStatus?
                          // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                        }),

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
                // IconButton(
                //   icon: Icon(Icons.inventory),
                //   onPressed: () {
                //     // Navigator.push(context,
                //     //     MaterialPageRoute(builder: (context) => Whats_MainUi())
                //     // );
                //   },
                // ),
                Container(
                  decoration: BoxDecoration(color: AppColors.darkBlue),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      Get.to(() => Createtrip());
                    },
                    child: Text("Create Tour", style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
              title: Text('Agour'),
            ),
            body: Pending()));
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                  title: new Text('Are you sure?'),
                  content: new Text('Do you want to exit App'),
                  actions: <Widget>[
                    new GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: roundedButton("No", const Color(0xFF546E7A),
                          const Color(0xFFFFFFFF)),
                    ),
                    new GestureDetector(
                      onTap: () => Navigator.of(context).pop(true),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: roundedButton(" Yes ", const Color(0xFF546E7A),
                            const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                )) ??
        false;
  }

  void _listenForPermissionStatus() async {
    var permission =
        Platform.isAndroid ? Permission.storage : Permission.photos;
    final status = await permission.request().isGranted;
    // setState() triggers build again
    setState(() => _permissionStatus = status);
  }
}


