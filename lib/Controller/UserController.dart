import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/CreateUserResponse.dart';
import 'package:inventory_management/Model/UserlistResponse.dart';
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var login = CreateUserResponse().obs;
  var userlist = List<Datum>().obs;

  void createuser(
      {String name,
      String email,
      String phone,
      String password,
      String status,
      String city,
      String wallet_amount,
      String photo}) async {
    try {
      isLoading(true);
      var res = await RequestCall.createuser(
          name: name,
          email: email,
          phone: phone,
          password: password,
          status: status,
          city: city,
          wallet_amount: wallet_amount,
          photo: photo);
      print("rdd" + res.toString());
      if (res != null) {
        login.value = res;
        if (login.value.succes) {
          print("rdd" + res.toString());

          Fluttertoast.showToast(msg: "User Created Successfully");
          Get.to(() => HomeScreen());
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
      print("userlist" + res.toString());
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
}
