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
            drawer: UserDrawer(), appBar: UserAppBar(), body: Pending()));
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
