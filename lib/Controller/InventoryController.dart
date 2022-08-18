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
      {String code,
      String name,
      String serial_no,
      String px_no,
      String machine,
      String location,
      String remark}) async {
    try {
      isLoading(true);
      var res = await RequestCall.createInventory(
          code:code,
          name: name,
          serial_no: serial_no,
          px_no: px_no,
          machine: machine,
          location: location,
          remark: remark);
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
        inventorystatuslist.assignAll(res);
        print("rrst" + inventorystatuslist.toString());
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
