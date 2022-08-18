import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart'
    as inventory;
import 'package:inventory_management/Model/InventoryStatusResponse.dart'
    as status;
import 'package:inventory_management/Network/RequestCall.dart';

import 'package:inventory_management/Views/Home/HomeScreen.dart';

class InventoryController extends GetxController {
  var isLoading = false.obs;
  var login = inventory.InventorylistResponse().obs;
  var inventorylist = List<inventory.Datum>().obs;
  var inventorystatuslist = List<status.Datum>().obs;

  void createinventory(
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
      if (res != null) {
        login.value = res;
        if (login.value.succes) {
          Fluttertoast.showToast(msg: "User Created Successfully");
          Get.to(HomeScreen());
        } else {
          Fluttertoast.showToast(msg: login.value.message);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchinventorylist() async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchinventorylist();
      if (res != null) {
        inventorylist.assignAll(res);
        if (inventorylist.length > 0) {
          Fluttertoast.showToast(msg: "inventorylist Retrieve Successfully");
        } else {
          Fluttertoast.showToast(msg: "No Data Found");
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchstatuslist() async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchstatuslist();
      if (res != null) {
        status.Datum dd = new status.Datum();
        dd.status = 0;
        dd.statusName = "Status";
        dd.id = 0;
        inventorystatuslist.add(dd);
        inventorystatuslist.assignAll(res);
        if (inventorystatuslist.length > 0) {
          Fluttertoast.showToast(msg: "status Retrieve Successfully");
        } else {
          Fluttertoast.showToast(msg: "No Data Found");
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
