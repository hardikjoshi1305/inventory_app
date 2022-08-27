import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Views/Inventory/Inventory.dart';
import 'package:inventory_management/Views/Users/Userlist.dart';
import 'package:inventory_management/Views/Users/CreateUser.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _permissionStatus;
  var _permissionCStatus;

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
        onWillPop: _onBackPressed, child: Scaffold(body: Userlist()));
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
    final status = await Permission.storage.request().isGranted;
    final statuscamera = await Permission.camera.request().isGranted;
    ;
    // setState() triggers build again
    setState(() {
      _permissionStatus = status;
      _permissionCStatus = statuscamera;
    });
  }
}
