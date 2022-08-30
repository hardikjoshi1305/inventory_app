import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/CreateExpenseResponse.dart';
import 'package:inventory_management/Model/CreateTourResponse.dart';
import 'package:inventory_management/Model/FinalDignoseResponse.dart';
import 'package:inventory_management/Model/GetRemarkResponse.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart';
import 'package:inventory_management/Model/ServiceReportResponse.dart';
import 'package:inventory_management/Model/TourRemarkResponse.dart';
import 'package:inventory_management/Model/TourHistoryResponse.dart' as history;
import 'package:inventory_management/Model/CreateUserResponse.dart';
import 'package:inventory_management/Model/UserTourDetailsResponse.dart';
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Views/Dashboard/Dashboard.dart';

import '../Utility/CONSTANT.dart';
import '../Utility/SharedPreferenceHelper.dart';

class TourController extends GetxController {
  var isLoading = false.obs;
  var createuserdata = CreateTourResponse().obs;
  var usertourdetails = UserTourDetailsResponse().obs;
  var createexpensedata = CreateExpenseResponse().obs;
  var tourremarkdata = TourRemarkResponse().obs;
  var getremarkdata = GetRemarkResponse().obs;
  var finaldignosedata = FinalDignoseResponse().obs;
  var servicereportdata = ServiceReportResponse().obs;
  var tourhistorydata = List<history.Datum>().obs;
  @override
  void onClose() {
    Get.delete<TourController>();
    super.onClose();
  }

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

  void usertourdetail(String tourid) async {
    try {
      isLoading(true);
      var res = await RequestCall.usertourdetail(tourid);
      if (res != null) {
        usertourdetails.value = res;
        if (usertourdetails.value.succes) {
          Fluttertoast.showToast(msg: "Success");
          // Get.to(HomeScreen());
          // Get.to(() => Dashboard());
        } else {
          Fluttertoast.showToast(msg: usertourdetails.value.message.toString());
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchtourlist(String userid) async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchtourlist(userid);
      if (res != null) {
        tourhistorydata.assignAll(res);
        if (tourhistorydata.length > 0) {
          Fluttertoast.showToast(msg: "Success");
          isLoading(false);
        } else {
          Fluttertoast.showToast(msg: "No Tour Found");
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
    String remarkid,
    String dailyremark,
  }) async {
    try {
      isLoading(true);
      var res = await RequestCall.createremark(
        tour_id: tour_id,
        remarkid: remarkid,
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

  void createdignose({
    String tour_id,
    String finaldignose,
  }) async {
    try {
      isLoading(true);
      var res = await RequestCall.createdignose(
        tour_id: tour_id,
        finaldignose: finaldignose,
      );
      if (res != null) {
        finaldignosedata.value = res;
        if (finaldignosedata.value.succes) {
          Fluttertoast.showToast(msg: "Success");
          // Get.to(HomeScreen());
          Get.to(() => Dashboard());
        } else {
          Fluttertoast.showToast(
              msg: finaldignosedata.value.message.toString());
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void createreportfile({
    String tour_id,
    String service_report,
  }) async {
    try {
      isLoading(true);
      var res = await RequestCall.createservicereport(
        tour_id: tour_id,
        service_report: service_report,
      );
      if (res != null) {
        servicereportdata.value = res;
        if (servicereportdata.value.succes) {
          Fluttertoast.showToast(msg: "Success");
          // Get.to(HomeScreen());
          Get.to(() => Dashboard());
        } else {
          Fluttertoast.showToast(
              msg: servicereportdata.value.message.toString());
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void getremark(String tour_id) async {
    try {
      isLoading(true);
      var res = await RequestCall.getdailyremark(
        tour_id: tour_id,
      );
      if (res != null) {
        getremarkdata.value = res;
        if (getremarkdata.value.succes) {
          Fluttertoast.showToast(msg: "Success");
          // Get.to(HomeScreen());
        } else {
          Fluttertoast.showToast(msg: getremarkdata.value.message.toString());
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
