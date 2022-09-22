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
import 'package:inventory_management/Model/UserNameList.dart' as namelist;

import '../Utility/CONSTANT.dart';
import '../Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Model/SendAmountListResponse.dart'
    as amountlist;

class WalletController extends GetxController {
  var isLoading = false.obs;
  // var login = List<Datum>.empty(growable: true).obs;
  var wallethistory = List<Datum>().obs;
  var expensehistory = List<ecpense.Datum>().obs;
  var accrej = AcceptRejectResponse().obs;
  var refreshscreen = false.obs;
  var usernamelist = List<namelist.Datum>().obs;
  var sendamountlist = List<amountlist.Datum>.empty(growable: true).obs;

  @override
  void onInit() {
    print("onInit");
    getauthtoken();
    super.onInit();
  }

  void fetchusernamelist() async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchusernamelist();
      if (res != null) {
        usernamelist.assignAll(res);
        if (usernamelist.length > 0) {
          Fluttertoast.showToast(msg: "Users Retrieve Successfully");
          isLoading(false);
        } else {
          Fluttertoast.showToast(msg: "No User Found");
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchsendamountlist() async {
    try {
      isLoading(true);
      var res = await RequestCall.fetchamountlist();
      if (res != null) {
        if (sendamountlist.length > 0) {
          sendamountlist.assignAll(res);
          // Fluttertoast.showToast(msg: "Users Retrieve Successfully");
          isLoading(false);
        } else {
          // Fluttertoast.showToast(msg: "No User Found");
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

  void expenselist(String userid, String fromdate, String todate) async {
    try {
      isLoading(true);
      var res = await RequestCall.expenselist(userid, fromdate, todate);
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

  void addexpenselist(String userid, String tourid) async {
    try {
      isLoading(true);
      var res = await RequestCall.addexpenselist(userid, tourid);
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
