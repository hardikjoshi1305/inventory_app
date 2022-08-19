import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/CreateTourResponse.dart';
import 'package:inventory_management/Model/CreateUserResponse.dart';
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';

class TourController extends GetxController {
  var isLoading = false.obs;
  var createuserdata = CreateTourResponse().obs;

  void creattour({String tourname, String problem, String city}) async {
    try {
      isLoading(true);
      var res = await RequestCall.creatTour(
          tourname: tourname, problem: problem, city: city);
      if (res != null) {
        createuserdata.value = res;
        Fluttertoast.showToast(msg: "Success");
        // Get.to(HomeScreen());
        Get.to(() => Dashboard());
      }
    } finally {
      isLoading(false);
    }
  }
}
