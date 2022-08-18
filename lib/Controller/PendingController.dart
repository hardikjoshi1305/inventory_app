import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';

class PendingController extends GetxController{
  var isLoading = false.obs;
  var login = List<Cast>.empty(growable: true).obs;

  void pendingitem({String userid}) async {
    try {
      isLoading(true);
      var res = await RequestCall.pendingitems(userid: userid);
      if (res != null) {
        login.assignAll(res);
        Fluttertoast.showToast(msg: "Data Fetch Successfully");
        // Get.to(HomeScreen());
        // Get.to(HomeScreen());
      }
    }
    finally {
      isLoading(false);
    }
  }
}