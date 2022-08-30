import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/PendingResponse.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';

import '../Utility/CONSTANT.dart';
import '../Utility/SharedPreferenceHelper.dart';

class PendingController extends GetxController {
  var isLoading = false.obs;
  // var login = List<Datum>.empty(growable: true).obs;
  var pending = List<Datum>().obs;
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

  void pendingitem({String iscompleted}) async {
    try {
      isLoading(true);
      var res = await RequestCall.pendingitems(iscompleted: iscompleted);
      if (res != null) {
        pending.assignAll(res);
        Fluttertoast.showToast(msg: "Data Fetch Successfully");
        // Get.to(HomeScreen());
        // Get.to(HomeScreen());
      }
    } finally {
      isLoading(false);
    }
  }
}
