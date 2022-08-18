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
            body: Userlist()));
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
    // setState() triggers build again
    setState(() => _permissionStatus = status);
  }
}

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         fit: BoxFit.fill,
      //         image:  AssetImage('images/bg_header.jpeg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Welcome to Augour",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

Widget createDrawerBodyItem({var icon, var text, var onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
