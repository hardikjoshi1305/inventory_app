import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/MyHttpOverrides.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Views/Login/Login.dart';
import 'package:inventory_management/Views/SplashScreen.dart';
import 'package:inventory_management/Views/Users/Userlist.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'Views/Dashboard/Dashboard.dart';
import 'Views/Home/HomeScreen.dart';
import 'Views/Inventory/AdminReturnInventory.dart';
import 'Views/Inventory/Inventory.dart';
import 'Views/Inventory/InventoryHistory.dart';
import 'Views/Inventory/SendInventory.dart';
import 'Views/Tour/CreatTourDetail.dart';
import 'Views/Tour/TourList.dart';
import 'Views/Wallet/ExpenseHistory.dart';
import 'Views/Wallet/SendAmount.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
      (rec) => {print("${rec.level.name}: ${rec.time} : ${rec.message}")});
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inventory Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF546E7A)),
        // platform: TargetPlatform.iOS
      ),
      home: WelcomeSplashScreen(),
      getPages: [
        GetPage(name: "/HomeScreen", page: () => HomeScreen()),
        GetPage(name: "/Userlist", page: () => Userlist()),
        GetPage(name: "/Dashboard", page: () => Dashboard()),
        GetPage(name: "/Inventory", page: () => Inventory()),
        GetPage(name: "/SendInventory", page: () => SendInventory()),
        GetPage(name: "/SendAmount", page: () => SendAmount()),
        GetPage(name: "/InventoryHistory", page: () => InventoryHistory()),
        GetPage(name: "/TourList", page: () => TourList()),
        GetPage(name: "/ExpenseHistory", page: () => ExpenseHistory()),
        GetPage(name: "/PendingExpense", page: () => ExpenseHistory()),
        GetPage(
            name: "/AdminReturnInventory", page: () => AdminReturnInventory()),
        GetPage(name: "/Login", page: () => Login()),
        GetPage(name: "/CreateTourDetail", page: () => CreateTourDetail()),
      ],
    );
  }
}
