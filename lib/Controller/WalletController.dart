import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/AcceptRejectResponse.dart';
import 'package:inventory_management/Model/WalletHistoryResponse.dart';
import 'package:inventory_management/Model/ExpenseListDetailsResponse.dart'
    as ecpense;
import 'package:inventory_management/Network/RequestCall.dart';
import 'package:inventory_management/Views/Home/HomeScreen.dart';
import 'package:inventory_management/Views/Wallet/ExpenseHistory.dart';

import '../Utility/CONSTANT.dart';
import '../Utility/SharedPreferenceHelper.dart';

class WalletController extends GetxController {
  var isLoading = false.obs;
  // var login = List<Datum>.empty(growable: true).obs;
  var wallethistory = List<Datum>().obs;
  var expensehistory = List<ecpense.Datum>().obs;
  var accrej = AcceptRejectResponse().obs;
  var refreshscreen = false.obs;
  @override
  void onInit() {
    print("onInit");
    getauthtoken();
    super.onInit();
  }

  Future<String> getauthtoken() async {
    var loginToken = await SharedPreferenceHelper().getPref(TOKEN);
    RequestCall.createAuthHeader(loginToken);
  }

  void wallethistorydata() async {
    try {
      isLoading(true);
      var res = await RequestCall.wallethistory();
      if (res != null) {
        wallethistory.assignAll(res);
        Fluttertoast.showToast(msg: "Data Fetch Successfully");
        // Get.to(HomeScreen());
        // Get.to(HomeScreen());
      }
    } finally {
      isLoading(false);
    }
  }

  void expenselist(String userid) async {
    try {
      isLoading(true);
      var res = await RequestCall.expenselist(userid);
      if (res != null) {
        expensehistory.assignAll(res);
        Fluttertoast.showToast(msg: "Data Fetch Successfully");
        // Get.to(HomeScreen());
        // Get.to(HomeScreen());
      }
    } finally {
      isLoading(false);
    }
  }

  void acceptreject(String is_approved, String expense_id, int position) async {
    try {
      isLoading(true);
      var res = await RequestCall.acceptreject(is_approved, expense_id);
      if (res != null) {
        Fluttertoast.showToast(msg: "Done");
        expensehistory.value[position].isApproved = is_approved;
        // Get.to(()=>ExpenseHistory());
        // Get.to(HomeScreen());
      }
    } finally {
      isLoading(false);
    }
  }
}
