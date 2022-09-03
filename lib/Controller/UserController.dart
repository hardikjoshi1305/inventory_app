import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/CreateUserResponse.dart';
import 'package:inventory_management/Model/UserlistResponse.dart';
import 'package:inventory_management/Model/UserNameList.dart' as namelist;
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';
import 'package:inventory_management/Views/Users/Userlist.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var login = CreateUserResponse().obs;
  var userlist = List<Datum>().obs;
  var usernamelist = List<namelist.Datum>().obs;
  @override
  void onClose() {
    Get.delete<UserController>();
    super.onClose();
  }

  @override
  void onInit() {
    print("onInit");
    getauthtoken();
    super.onInit();
  }

  getauthtoken() async {
    var loginToken = await SharedPreferenceHelper().getPref(TOKEN);
    RequestCall.createAuthHeader(loginToken);
  }

  void createuser({
    String name,
    String phone,
    String password,
    String deviceid,
    String wallet_amount,
    String isvisibleid,
    // String photo
  }) async {
    try {
      isLoading(true);
      var res = await RequestCall.createuser(
        name: name,
        phone: phone,
        password: password,
        deviceid: deviceid,
        wallet_amount: wallet_amount,
        isvisibleid: isvisibleid,
        // photo: photo
      );
      print("rdd" + res.toString());
      if (res != null) {
        login.value = res;
        if (login.value.succes) {
          print("rdd" + res.toString());

          Fluttertoast.showToast(msg: "User Created Successfully");
          Get.to(() => Userlist());
        } else {
          Fluttertoast.showToast(msg: login.value.message);
        }
      } else {
        Fluttertoast.showToast(msg: "Error");
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchuserlist() async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchuserlist();
      if (res != null) {
        userlist.assignAll(res);
        if (userlist.length > 0) {
          Fluttertoast.showToast(msg: "Users Retrieve Successfully");
          isLoading(false);
        } else {
          Fluttertoast.showToast(msg: "No User Found");
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchusernamelist() async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchusernamelist();
      if (res != null) {
        usernamelist.assignAll(res);
        if (usernamelist.length > 0) {
          Fluttertoast.showToast(msg: "Users Retrieve Successfully");
          isLoading(false);
        } else {
          Fluttertoast.showToast(msg: "No User Found");
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
