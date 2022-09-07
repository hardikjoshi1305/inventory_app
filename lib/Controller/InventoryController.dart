import 'dart:ffi';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart'
    as inventory;
import 'package:inventory_management/Model/AdminReturnInventoryResponse.dart'
    as adminreturninventory;
import 'package:inventory_management/Model/AddInventoryResponse.dart'
    as addinventory;
import 'package:inventory_management/Model/InventoryStatusResponse.dart'
    as status;
// import 'package:inventory_management/Model/InventoryHistoryResponse.dart'
//     as inventoryhistory;
import 'package:inventory_management/Model/AssignInventoryResponse.dart'
    as assign;
import 'package:inventory_management/Model/AcceptInventoryResponse.dart'
    as acce;
import 'package:inventory_management/Model/AcceptInventoryResponse.dart'
    as history;
import 'package:inventory_management/Model/ReceivePartResponse.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';
import 'package:inventory_management/Views/Inventory/Inventory.dart';
import 'package:inventory_management/Views/Inventory/UserCurrentInventory.dart';
import 'package:inventory_management/Views/Inventory/UserInventory.dart';
import '../Utility/CONSTANT.dart';
import '../Utility/SharedPreferenceHelper.dart';

class InventoryController extends GetxController {
  var isLoading = false.obs;
  var login = addinventory.AddInventorylResponse().obs;
  var receive = ReceivePartResponse().obs;
  var accept = acce.AcceptInventoryResponse().obs;
  var inventorylist = List<inventory.Datum>().obs;
  var adminreturninventorylist = List<adminreturninventory.Datum>().obs;
  var userinventorylist = List<assign.Datum>().obs;
  var inventorystatuslist = List<status.Datum>().obs;
  // var inventoryhistorylist = List<inventoryhistory.Datum>().obs;
  @override
  void onInit() {
    print("onInit");
    getauthtoken();
    super.onInit();
  }

  @override
  void refresh() {
    print("refresh");
    super.refresh();
  }

  @override
  void onClose() {
    print("onClose");
    super.onClose();
  }

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
      String Prize,
      String statusdeatils,
      String history}) async {
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
        Prize: Prize,
        statusdeatils: statusdeatils,
        history: history,
      );
      if (res != null) {
        login.value = res;
        if (login.value.succes) {
          Fluttertoast.showToast(msg: login.value.message);
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

  void fetchuserinventorylist(String status) async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchuserinventorylist(status);
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

  void acceptinventory(String inventoryid, int position) async {
    try {
      isLoading(true);
      var res = await RequestCall.acceptinventory(inventoryid);
      if (res != null) {
        accept.value = res;
        if (accept.value.succes) {
          Fluttertoast.showToast(msg: accept.value.message);
          userinventorylist.removeAt(position);
          // Get.to(() => UserInventory());
        } else {
          Fluttertoast.showToast(msg: accept.value.message);
        }
      } else {
        print("acceptfail null");
      }
    } finally {
      isLoading(false);
    }
  }

  void returninventory(assign.Datum userModel, String statusid, String imgpatth,
      String remark) async {
    try {
      isLoading(true);
      var res =
          await RequestCall.receivepart(userModel, statusid, imgpatth, remark);
      print("rdd" + res.toString());
      if (res != null) {
        receive.value = res;
        if (receive.value.succes) {
          Fluttertoast.showToast(msg: "Send Successfully");
          Get.to(() => UserCurrentInventory());
        } else {
          Fluttertoast.showToast(msg: receive.value.message);
        }
      } else {
        Fluttertoast.showToast(msg: "Error");
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchadminreturninventorylist() async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchadminreturninventorylist();
      if (res != null) {
        adminreturninventorylist.assignAll(res);
        if (adminreturninventorylist.length > 0) {
          Fluttertoast.showToast(msg: "inventorylist Retrieve Successfully");
        } else {
          Fluttertoast.showToast(msg: "No Data Found");
        }
      }
    } finally {
      isLoading(false);
    }
  }

  getauthtoken() async {
    var loginToken = await SharedPreferenceHelper().getPref(TOKEN);
    RequestCall.createAuthHeader(loginToken);
  }

  Future<List<inventory.Datum>> searchdata(String query) async {
    if (query != "") {
      try {
        isLoading(true);
        var res = await RequestCall.searchinventorymain(query: query);
        if (res != null) {
          inventorylist.clear();
          inventorylist.assignAll(res);
          Fluttertoast.showToast(msg: "Data Fetch Successfully");
          var detailsList = <inventory.Datum>[];
          for (inventory.Datum bootcamp in inventorylist) {
            detailsList.add(bootcamp);
          }
          return detailsList.toList();
          return inventorylist;
          // Get.to(HomeScreen());
          // Get.to(HomeScreen());
        } else {
          return inventorylist;
        }
      } finally {
        isLoading(false);
      }
    } else {
      return inventorylist;
    }
  }
}
