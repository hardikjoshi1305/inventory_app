import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/LoginResponse.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var login = LoginResponse().obs;

  void fetchLogin({String email, String password}) async {
    try {
      isLoading(true);
      var res =
          await RequestCall.fetchloginuser(email: email, password: password);
      if (res != null) {
        login.value = res;
        if (login.value.succes) {
          Fluttertoast.showToast(msg: "Success");
          SharedPreferenceHelper()
              .setPref(TOKEN, "Bearer ${login.value.data.apiToken}");
          SharedPreferenceHelper().setPref(USERTYPE, (login.value.data.type));
          RequestCall.createAuthHeader("Bearer ${login.value.data.apiToken}");

          if (login.value.data.type == "Admin") {
            Get.offNamed("/HomeScreen");
          } else {
            Get.offNamed("/Dashboard");
          }
        } else {
          Fluttertoast.showToast(msg: login.value.message);
        }

        // Get.to(HomeScreen());
      }
    } finally {
      isLoading(false);
    }
  }
}
