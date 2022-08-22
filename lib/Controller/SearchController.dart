import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_management/Model/SearchInventoryResponse.dart';
import 'package:inventory_management/Network/RequestCall.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  // var issearched = false.obs;
  // var login = List<Datum>.empty(growable: true).obs;
  var search = List<Datum>().obs;

  // static Future<List<Datum>> getData(String filter) async {
  //   var response = await http.Client().post(
  //     Uri.parse("https://dummyURl.com"),
  //     body: jsonEncode(<String, dynamic>{
  //       "pageSize": 100,
  //       "pageNumber": 1,
  //       "keywords": "",
  //       "filters": {"searchText": filter}
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     List bootcampsJson = jsonDecode(response.body)['result'];
  //     var detailsList = <Datum>[];
  //     for (Datum bootcamp in bootcampsJson) {
  //       detailsList.add(bootcamp);
  //     }
  //     return detailsList.toList();
  //   } else {
  //     throw Exception("Error ${response.statusCode}");
  //   }
  // }

  Future<List<Datum>> searchdata(String query) async {
    if (query != "") {
      print("query" + query);
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
          return null;
        }
      } finally {
        isLoading(false);
      }
    } else {
      return search;
    }
  }

  // callgetinventory(String code) async {
  //   try {
  //     isLoading(true);
  //     var res = await RequestCall.getinventory(code: code);
  //     if (res != null) {
  //       search.assignAll(res);
  //       Fluttertoast.showToast(msg: "Data Fetch Successfully");
  //       var detailsList = <Datum>[];
  //       for (Datum bootcamp in search) {
  //         detailsList.add(bootcamp);
  //       }
  //       return detailsList.toList();
  //       return search;
  //       // Get.to(HomeScreen());
  //       // Get.to(HomeScreen());
  //     } else {
  //       return null;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
