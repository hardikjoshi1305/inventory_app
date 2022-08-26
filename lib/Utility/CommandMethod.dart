import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/UserController.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';
import 'package:inventory_management/Views/Inventory/InventoryHistory.dart';
import 'package:inventory_management/Views/Inventory/SendInventory.dart';
import 'package:inventory_management/Views/Pending/Pending.dart';
import 'package:inventory_management/Views/Tour/TourList.dart';

import '../Views/Completed Tour/Completed.dart';
import '../Views/Home/HomeScreen.dart';
import '../Views/Inventory/Inventory.dart';
import '../Views/Inventory/UserCurrentInventory.dart';
import '../Views/Inventory/UserInventory.dart';
import '../Views/Login/Login.dart';
import '../Views/Tour/Createtrip.dart';
import '../Views/Users/CreateUser.dart';
import '../Views/Wallet/ExpenseHistory.dart';
import '../Views/Wallet/WalletScreen.dart';
import 'CONSTANT.dart';
import 'SharedPreferenceHelper.dart';
import 'app_colors.dart';

getdateformate(DateTime dateTime) {
  return dateTime.day.toString() +
      "-" +
      dateTime.month.toString() +
      "-" +
      dateTime.year.toString();
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

Widget AdminAppBar() {
  return AppBar(
    actions: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 20, top: 6, bottom: 6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[300],
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Get.to(() => Createuser());
            Get.delete<UserController>();
          },
          child: Text("Create User", style: TextStyle(color: Colors.white)),
        ),
      )
    ],
    title: Text('Agour'),
  );
}

Widget UserAppBar() {
  return AppBar(
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
  );
}

Widget UserDrawer() {
  return Drawer(
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
                Get.to(() => Dashboard());
                // Navigator.of(context).pop();
                // Navigator.pushNamed(context, pageRoutes.landscape);
              }),
          createDrawerBodyItem(
              icon: Icons.cloud_done_rounded,
              text: 'Completed',
              onTap: () {
                Get.to(() => Completed());

                // Navigator.of(context).pop();

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.wallet,
              text: 'Wallet',
              onTap: () {
                Get.to(() => WalletScreen());

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
              text: 'Pending Inventory',
              onTap: () {
                Get.to(() => UserInventory());

                // Navigator.of(context).pop();

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.inventory,
              text: 'Current Inventory',
              onTap: () {
                Get.to(() => UserCurrentInventory());

                // Navigator.of(context).pop();

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                SharedPreferenceHelper().setPref(TOKEN, "");
                Get.to(() => Login());
              }),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}

Widget AdminDrawer() {
  return Drawer(
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
          createDrawerBodyItem(
              icon: Icons.send,
              text: 'Send Inventory',
              onTap: () {
                Get.to(() => SendInventory());

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.history,
              text: 'Inventory History',
              onTap: () {
                Get.to(() => InventoryHistory());

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.today,
              text: 'Tour History',
              onTap: () {
                Get.to(() => TourList());

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.currency_rupee_sharp,
              text: 'Expense History',
              onTap: () {
                Get.to(() => ExpenseHistory());

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          Divider(),
          createDrawerBodyItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                SharedPreferenceHelper().setPref(TOKEN, "");
                Get.to(() => Login());
              }),
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
  );
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

Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
  var loginBtn = new Container(
    padding: EdgeInsets.all(5.0),
    alignment: FractionalOffset.center,
    decoration: new BoxDecoration(
      color: bgColor,
      borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: const Color(0xFF696969),
          offset: Offset(1.0, 6.0),
          blurRadius: 0.001,
        ),
      ],
    ),
    child: Text(
      buttonLabel,
      style: new TextStyle(
          color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
  );
  return loginBtn;
}

Widget nodatafound() {
  return Center(
    child: Text(
      'No Data Found',
      style: TextStyle(
        fontSize: 19,
        color: Colors.black,
      ),
    ),
  );
}

Widget toptitle(double width, String name) {
  return Container(
      width: width,
      alignment: AlignmentDirectional.center,
      color: Colors.blueGrey[700],
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.offWhite),
          ),
        ],
      ));
}

Widget bottomtitle(double width, String name) {
  return Container(
      width: width,
      height: 40,
      alignment: AlignmentDirectional.center,
      color: AppColors.offWhite,
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkBlue),
          ),
        ],
      ));
}
