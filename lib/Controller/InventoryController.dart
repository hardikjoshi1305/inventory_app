import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart'
    as inventory;
import 'package:inventory_management/Model/AddInventoryResponse.dart'
    as addinventory;
import 'package:inventory_management/Model/InventoryStatusResponse.dart'
    as status;
import 'package:inventory_management/Network/RequestCall.dart';

import 'package:inventory_management/Views/Home/HomeScreen.dart';
import 'package:inventory_management/Views/Inventory/Inventory.dart';

class InventoryController extends GetxController {
  var isLoading = false.obs;
  var login = addinventory.AddInventorylResponse().obs;
  var inventorylist = List<inventory.Datum>().obs;
  var userinventorylist = List<inventory.Datum>().obs;
  var inventorystatuslist = List<status.Datum>().obs;

  void createinventory(
      {String id,
      String code,
      String name,
      String serial_no,
      String px_no,
      String machine,
      String location,
      String remark,
      // String status_id,
      String wherefrom,
      String Prize}) async {
    try {
      print("iddd" + id);
      isLoading(true);
      var res = await RequestCall.createInventory(
          id: id,
          code: code,
          name: name,
          serial_no: serial_no,
          px_no: px_no,
          machine: machine,
          location: location,
          remark: remark,
          // status_id: status_id,
          wherefrom: wherefrom,
          Prize: Prize);
      if (res != null) {
        login.value = res;
        if (login.value.succes) {
          Fluttertoast.showToast(msg: "User Created Successfully");
          Get.to(() => Inventory());
        } else {
          Fluttertoast.showToast(msg: login.value.message);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchinventorylist(String token) async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchinventorylist(token);
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

  void fetchuserinventorylist() async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchuserinventorylist();
      if (res != null) {
        userinventorylist.assignAll(res);
        if (userinventorylist.length > 0) {
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
      // isLoading(true);
      var res = await RequestCall.fetchstatuslist();
      if (res != null) {
        inventorystatuslist.assignAll(res);
        if (inventorystatuslist.length > 0) {
          Fluttertoast.showToast(msg: "status Retrieve Successfully");
        } else {
          Fluttertoast.showToast(msg: "No Data Found");
        }
      } else {
        Fluttertoast.showToast(msg: "No Status Found");
      }
    } catch (exception) {
      print("error :" + exception.toString());
    } finally {
      // isLoading(false);
    }
  }
}
