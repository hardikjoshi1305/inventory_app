import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/CreateExpenseResponse.dart';
import 'package:inventory_management/Model/CreateTourResponse.dart';
import 'package:inventory_management/Model/TourRemarkResponse.dart';
import 'package:inventory_management/Model/CreateUserResponse.dart';
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';

class TourController extends GetxController {
  var isLoading = false.obs;
  var createuserdata = CreateTourResponse().obs;
  var createexpensedata = CreateExpenseResponse().obs;
  var tourremarkdata = TourRemarkResponse().obs;

  void creattour({String tourname, String problem, String city}) async {
    try {
      isLoading(true);
      var res = await RequestCall.creatTour(
          tourname: tourname, problem: problem, city: city);
      if (res != null) {
        createuserdata.value = res;
        if (createuserdata.value.succes) {
          Fluttertoast.showToast(msg: "Success");
          // Get.to(HomeScreen());
          Get.to(() => Dashboard());
        } else {
          Fluttertoast.showToast(msg: createuserdata.value.message.toString());
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void createexpense(
      {String tour_id,
      String expenses_name,
      String amount,
      String photo}) async {
    try {
      isLoading(true);
      var res = await RequestCall.creatExpense(
          tour_id: tour_id,
          expenses_name: expenses_name,
          amount: amount,
          photo: photo);
      if (res != null) {
        createexpensedata.value = res;
        if (createexpensedata.value.succes) {
          Fluttertoast.showToast(msg: "Success");
          // Get.to(HomeScreen());
          Get.to(() => Dashboard());
        } else {
          Fluttertoast.showToast(
              msg: createexpensedata.value.message.toString());
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void createremark({
    String tour_id,
    String dailyremark,
  }) async {
    try {
      isLoading(true);
      var res = await RequestCall.createremark(
        tour_id: tour_id,
        remark: dailyremark,
      );
      if (res != null) {
        tourremarkdata.value = res;
        if (tourremarkdata.value.succes) {
          Fluttertoast.showToast(msg: "Success");
          // Get.to(HomeScreen());
          Get.to(() => Dashboard());
        } else {
          Fluttertoast.showToast(msg: tourremarkdata.value.message.toString());
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
