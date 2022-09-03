import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Controller/UserController.dart';
import 'package:inventory_management/Views/Dashboard/AdminDashboard.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';
import 'package:inventory_management/Views/Inventory/InventoryHistory.dart';
import 'package:inventory_management/Views/Inventory/SendInventory.dart';
import 'package:inventory_management/Views/Pending/Pending.dart';
import 'package:inventory_management/Views/Tour/TourList.dart';
// import 'package:intl/intl.dart';

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

getdateformate2(DateTime dateTime) {
  return dateTime.day.toString() +
      "-" +
      dateTime.month.toString() +
      "-" +
      dateTime.year.toString() +
      " " +
      dateTime.hour.toString() +
      ":" +
      dateTime.minute.toString();
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
            Get.to(() => Createtrip());
            Get.delete<UserController>();
          },
          child: Text("Create Tour", style: TextStyle(color: Colors.white)),
        ),
      )
    ],
    title: Text('Agour'),
  );
}

Widget UserDrawer(userisvisible) {
  // var isvisible = "".obs;
  // SharedPreferenceHelper()
  //     .getPref(Userid)
  //     .then((value) => isvisible.value = value.toString());

  // print("isbvisible" + isvisible.toString());
  return Drawer(
    elevation: 4.0,
    child: Container(
      color: Colors.blueGrey[600],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.dashboard,
              text: 'Dashboard',
              onTap: () {
                Get.to(() => Dashboard(), preventDuplicates: false);
                // Navigator.of(context).pop();
                // Navigator.pushNamed(context, pageRoutes.landscape);
              }),
          createDrawerBodyItem(
              icon: Icons.pending_actions,
              text: 'Pending Tour',
              onTap: () {
                Get.to(() => Pending(), preventDuplicates: false);
                // Navigator.of(context).pop();
                // Navigator.pushNamed(context, pageRoutes.landscape);
              }),
          createDrawerBodyItem(
              icon: Icons.cloud_done_rounded,
              text: 'Completed Tour',
              onTap: () {
                Get.to(() => Completed(), preventDuplicates: false);

                // Navigator.of(context).pop();

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.wallet,
              text: 'Wallet',
              onTap: () {
                Get.to(() => WalletScreen(), preventDuplicates: false);

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
          userisvisible == "true"
              ? createDrawerBodyItem(
                  icon: Icons.inventory,
                  text: 'All Inventory',
                  onTap: () {
                    Get.to(() => UserInventory(), preventDuplicates: false);

                    // Navigator.of(context).pop();

                    // _permissionStatus?
                    // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
                  })
              : Container(),
          createDrawerBodyItem(
              icon: Icons.inventory,
              text: 'My Parts',
              onTap: () {
                Get.to(() => UserCurrentInventory(), preventDuplicates: false);

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

getuserdata() async {
  var isvisible = await SharedPreferenceHelper().getPref(Userid);
  return isvisible;
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
              icon: Icons.dashboard,
              text: 'Dashboard',
              onTap: () {
                Get.offNamed("/HomeScreen", preventDuplicates: false);
                // Navigator.of(context).pop();
                // Navigator.pushNamed(context, pageRoutes.landscape);
              }),
          createDrawerBodyItem(
              icon: Icons.pending_actions,
              text: 'Users',
              onTap: () {
                Get.offNamed("/Userlist", preventDuplicates: false);
                // Navigator.of(context).pop();
                // Navigator.pushNamed(context, pageRoutes.landscape);
              }),
          createDrawerBodyItem(
              icon: Icons.cloud_done_rounded,
              text: 'Inventory',
              onTap: () {
                Get.offNamed("/Inventory", preventDuplicates: false);

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.send,
              text: 'Send Inventory',
              onTap: () {
                Get.offNamed("/SendInventory", preventDuplicates: false);

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.send,
              text: 'Send Amount',
              onTap: () {
                Get.offNamed("/SendAmount", preventDuplicates: false);

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.assignment_returned,
              text: 'Return Inventory',
              onTap: () {
                Get.offNamed("/AdminReturnInventory", preventDuplicates: false);

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.history,
              text: 'Inventory History',
              onTap: () {
                Get.offNamed("/InventoryHistory", preventDuplicates: false);

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.today,
              text: 'Tour History',
              onTap: () {
                Get.offNamed("/TourList", preventDuplicates: false);

                // _permissionStatus?
                // Navigator.pushNamed(context, pageRoutes.video): _listenForPermissionStatus();
              }),
          createDrawerBodyItem(
              icon: Icons.currency_rupee_sharp,
              text: 'Expense History',
              onTap: () {
                Get.offNamed("/ExpenseHistory", preventDuplicates: false);

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

Widget bottomtitle2(double width, String name, double height) {
  return Container(
      width: width,
      height: height,
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
