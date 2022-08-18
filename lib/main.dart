import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Utility/CommandMethod.dart';
import 'package:inventory_management/Views/SplashScreen.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  runApp(const MyApp());
}
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) => {
    print("${rec.level.name}: ${rec.time} : ${rec.message}")
  });
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      GetMaterialApp(
        title: 'Inventory Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch:createMaterialColor(Color(0xFF546E7A)),
          // platform: TargetPlatform.iOS
        ),
        home: WelcomeSplashScreen(),
      );




  }
}

