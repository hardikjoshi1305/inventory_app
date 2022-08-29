import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/SearchInventoryResponse.dart';
import 'package:inventory_management/Model/SendPartResponse.dart' as send;
import 'package:inventory_management/Network/RequestCall.dart';

import '../Views/Home/HomeScreen.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  // var issearched = false.obs;
  var login = send.SendPartResponse().obs;
  var search = List<Datum>().obs;

  @override
  void onClose() {
    Get.delete<SearchController>();
    print("onClose");

    super.onClose();
  }

  @override
  void dispose() {
    print("dispose");
  }

  Future<List<Datum>> searchdata(String query) async {
    if (query != "") {
      try {
        isLoading(true);
        var res = await RequestCall.searchinventory(query: query);
        if (res != null) {
          search.clear();
          search.assignAll(res);
          Fluttertoast.showToast(msg: "Data Fetch Successfully");
          var detailsList = <Datum>[];
          for (Datum bootcamp in search) {
            detailsList.add(bootcamp);
          }
          return detailsList.toList();
          return search;
          // Get.to(HomeScreen());
          // Get.to(HomeScreen());
        } else {
          return search;
        }
      } finally {
        isLoading(false);
      }
    } else {
      return search;
    }
  }

  void fetchsendpartapi({
    String userid,
    String tourname,
    List<String> photo,
    List<String> inventory_id,
    // String photo
  }) async {
    try {
      isLoading(true);
      var res = await RequestCall.sendpart(
        userid: userid,
        tourname: tourname,
        photo: photo,
        inventory_id: inventory_id,
        // photo: photo
      );
      print("rdd" + res.toString());
      if (res != null) {
        login.value = res;
        if (login.value.succes) {
          Fluttertoast.showToast(msg: "Send Successfully");
          Get.to(() => HomeScreen());
        }
      } else {
        Fluttertoast.showToast(msg: "Error");
      }
    } finally {
      isLoading(false);
    }
  }
}
