import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';
import 'package:inventory_management/Views/Login/Login.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeSplashScreen extends StatefulWidget {
  @override
  _WelcomeSplashScreenState createState() => _WelcomeSplashScreenState();
}

class _WelcomeSplashScreenState extends State<WelcomeSplashScreen> {
  bool firstLogin = false;
  bool intenet = true;
  String loginToken, usertype = "";
  void getAuthToken() async {
    // SharedPreferenceHelper().setAuthToken("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0aGVyYXBpc3RfaWQiOiI2MGJlMmM4ZjA3OWFkMGI1MjQ1Njk3ZGIiLCJleHAiOjE2OTA3MDY4MjEsInNjb3BlcyI6InVzZXIgc2VydmljZXMifQ.ErE3_mbVO-QRr8pe3eHxS3r2IXUgQt86TywM5yF2j-w");
    // SharedPreferenceHelper().setSessionId("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0aGVyYXBpc3RfaWQiOiI2MGJlMmM4ZjA3OWFkMGI1MjQ1Njk3ZGIiLCJleHAiOjE2OTA3MDY4MjEsInNjb3BlcyI6InVzZXIgc2VydmljZXMifQ.ErE3_mbVO-QRr8pe3eHxS3r2IXUgQt86TywM5yF2j-w");
    loginToken = await SharedPreferenceHelper().getPref(TOKEN);
    usertype = await SharedPreferenceHelper().getPref(USERTYPE);

    if (loginToken == "" || loginToken == null) {
      setState(() {
        firstLogin = true;
      });
    } else {
      print("Session auth token : ${loginToken}");
      RequestCall.createAuthHeader(loginToken);
      setState(() {
        firstLogin = false;
      });
    }
  }

  void checkconnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      setState(() {
        intenet = true;
      });
    } else {
      setState(() {
        intenet = false;
      });
      Fluttertoast.showToast(
          msg: "Please Check Your Internet Connection",
          toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  void initState() {
    super.initState();
    getAuthToken();
    checkconnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: intenet
            ? Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SplashScreen(
                        seconds: 5,
                        navigateAfterSeconds: firstLogin
                            ? Login()
                            : usertype == "Admin"
                                ? HomeScreen()
                                : Dashboard(),
                        image: Image(
                          image: AssetImage("assets/transparent_logo.png"),
                        ),
                        photoSize: 150.0,
                        useLoader: false,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                child: Text("Please Check Your Connection"),
              ));
  }
}
