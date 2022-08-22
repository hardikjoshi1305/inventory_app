import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_management/Model/CreateExpenseResponse.dart';
import 'package:inventory_management/Model/CreateTourResponse.dart';
import 'package:inventory_management/Model/CreateUserResponse.dart';
import 'package:inventory_management/Model/FinalDignoseResponse.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart'
    as inventory;
import 'package:inventory_management/Model/LoginResponse.dart';
import 'package:inventory_management/Model/PendingResponse.dart';
import 'package:inventory_management/Model/ServiceReportResponse.dart';
import 'package:inventory_management/Model/TourRemarkResponse.dart';
import 'package:inventory_management/Model/UserlistResponse.dart' as user;
import 'package:inventory_management/Model/PendingResponse.dart' as pending;
import 'package:inventory_management/Model/SearchInventoryResponse.dart'
    as search;
import 'package:inventory_management/Model/WalletHistoryResponse.dart'
    as wallet;
import 'package:inventory_management/Model/CreateTourResponse.dart'
    as createtour;
import 'package:inventory_management/Model/InventoryStatusResponse.dart'
    as status;
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Views/Users/CreateUser.dart';

import '../Model/AddInventoryResponse.dart';

class RequestCall {
  static var client = http.Client();
  // static var BASEURL = "http://192.168.0.8/inventorymanagement/api/";
  static var BASEURL = "http://pankrutiinfotech.com/inventory_app/api/";
  static var apiKey = "a92f28e11a27e8e5938a2020be68ba9c";
  static var authHeader;

  static void createAuthHeader(String authCode) {
    authHeader = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': authCode
    };
  }

  static Future fetchloginuser({String email, String password}) async {
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final body = jsonEncode({
      'userid': email,
      'password': password,
    });
    var response =
        await client.post(BASEURL + 'login', headers: headers, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = loginResponseFromJson(json);
      return castsResp;
    } else {
      return null;
    }
  }

  static Future<List<search.Datum>> searchinventory({String query}) async {
    final body = jsonEncode({
      'search': query,
    });
    var response = await client.post(BASEURL + 'searchinventory',
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = search.searchInventoryResponseFromJson(json);
      return castsResp.data;
    } else {
      return null;
    }
  }

  static Future<List<Cast>> fetchCastOfMovie({int movieID}) async {
    var response = await client.get(
        'https://api.themoviedb.org/3/movie/$movieID/credits?api_key=a92f28e11a27e8e5938a2020be68ba9c');
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = castsFromJson(json);
      return castsResp.cast;
    } else {
      return null;
    }
  }

  static Future creatTour(
      {String tourname, String problem, String city}) async {
    final body = jsonEncode({
      "tourname": tourname,
      "errorname": problem,
      "city": city,
      // "status": "Pending",
    });
    var response = await client.post(BASEURL + "createtour",
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = createTourResponseFromJson(json);
      return castsResp;
    } else {
      return null;
    }
  }

  static Future createservicereport(
      {String tour_id, String service_report}) async {
    var req = http.MultipartRequest(
        "POST", Uri.parse('${BASEURL}createtourservicereport'));
// print("cretattt$req");

    req.fields.addAll({'tour_id': tour_id});
    req.files.add(
        await http.MultipartFile.fromPath('service_report', service_report));

    req.headers.addAll(authHeader);

    var response = await req.send();
    var json = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      var castsResp = serviceReportResponseFromJson(json.body);
      if (castsResp.succes) {
        return castsResp;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future creatExpense(
      {String tour_id,
      String expenses_name,
      String amount,
      String photo}) async {
    var req =
        http.MultipartRequest("POST", Uri.parse('${BASEURL}createexpense'));
// print("cretattt$req");

    req.fields.addAll(
        {'tour_id': tour_id, 'expenses_name': expenses_name, 'amount': amount});
    req.files.add(await http.MultipartFile.fromPath('photo', photo));

    req.headers.addAll(authHeader);

    var response = await req.send();
    var json = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      var castsResp = createExpenseResponseFromJson(json.body);
      if (castsResp.succes) {
        return castsResp;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future createremark({String tour_id, String remark}) async {
    final body = jsonEncode({
      "tour_id": tour_id,
      "dailyremark": remark,
      // "status": "Pending",
    });
    var response = await client.post(BASEURL + "tourdailyremark",
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = tourRemarkResponseFromJson(json);
      return castsResp;
    } else {
      return null;
    }
  }

  static Future createdignose({String tour_id, String finaldignose}) async {
    final body = jsonEncode({
      "tour_id": tour_id,
      "finaldignose": finaldignose,
      // "status": "Pending",
    });
    var response = await client.post(BASEURL + "tourfinaldignose",
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = finalDignoseResponseFromJson(json);
      return castsResp;
    } else {
      return null;
    }
  }

  static Future createuser(
      {String name,
      String email,
      String phone,
      String password,
      String status,
      String city,
      String wallet_amount,
      String photo}) async {
    final headers = authHeader;
    http.MultipartFile f1 = http.MultipartFile.fromString("name", name);
    http.MultipartFile f2 = http.MultipartFile.fromString("email", email);
    http.MultipartFile f3 =
        http.MultipartFile.fromString("mobile_number", phone);
    http.MultipartFile f4 = http.MultipartFile.fromString("password", password);
    http.MultipartFile f5 = http.MultipartFile.fromString("status", status);
    http.MultipartFile f6 = http.MultipartFile.fromString("city", city);
    http.MultipartFile f7 =
        http.MultipartFile.fromString("wallet_amount", wallet_amount);
    http.MultipartFile f8 = http.MultipartFile.fromString("photo", photo);

    var req = http.MultipartRequest("POST", Uri.parse('${BASEURL}createuser'));
// print("cretattt$req");

    req.files.add(f1);
    req.files.add(f2);
    req.files.add(f3);
    req.files.add(f4);
    req.files.add(f5);
    req.files.add(f6);
    req.files.add(f7);
    req.files.add(f8);
    req.headers.addAll(headers);

    var response = await req.send();
    var json = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      var castsResp = createUserResponseFromJson(json.body);
      if (castsResp.succes) {
        return castsResp;
      } else {
        return null;
      }
    } else {
      return null;
    }

    // http.Response.fromStream(response).then((value) {
    //
    // });

//     // var responseString = await response.stream.bytesToString();
// // print("respnse"+responseString);
//     if (response.statusCode == 200) {
//       // print("respnse" + responseString);
//
//       });
//     } else {
//       return null;
//     }
  }

  static Future createInventory(
      {String id,
      String code,
      String name,
      String serial_no,
      String px_no,
      String machine,
      String location,
      String remark,
      String status_id,
      String wherefrom,
      String Prize}) async {
    final headers = authHeader;
    var body;
    if (id == "0") {
      body = jsonEncode({
        "code": code,
        "name": name,
        "serial_no": serial_no,
        "px_no": px_no,
        "machine": machine,
        "location": location,
        "remark": remark,
        "wherefrom": wherefrom,
        "price": int.parse(Prize)
      });

      var response = await client.post(BASEURL + 'updateinventory',
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var json = response.body;
        var castsResp = addInventorylResponseFromJson(json);
        return castsResp;
      } else {
        return null;
      }
    } else {
      body = jsonEncode({
        "id": id,
        "code": code,
        "name": name,
        "serial_no": serial_no,
        "px_no": px_no,
        "machine": machine,
        "location": location,
        "remark": remark,
        "status_id": status_id,
        "wherefrom": wherefrom,
        "price": int.parse(Prize)
      });

      var response = await client.post(BASEURL + 'createinventory',
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var json = response.body;
        print("Response" + json.toString());
        var castsResp = addInventorylResponseFromJson(json);
        return castsResp;
      } else {
        return null;
      }
    }

    // http.MultipartFile f1 = http.MultipartFile.fromString("code", code);
    // http.MultipartFile f2 = http.MultipartFile.fromString("name", name);
    // http.MultipartFile f3 =
    // http.MultipartFile.fromString("serial_no", serial_no);
    // http.MultipartFile f4 = http.MultipartFile.fromString("px_no", px_no);
    // http.MultipartFile f5 = http.MultipartFile.fromString("machine", machine);
    // http.MultipartFile f6 = http.MultipartFile.fromString("location", location);
    // http.MultipartFile f7 =
    // http.MultipartFile.fromString("remark", remark);
    // http.MultipartFile f8 = http.MultipartFile.fromString("photo", photo);

    // http.Response.fromStream(response).then((value) {
    //
    // });

//     // var responseString = await response.stream.bytesToString();
// // print("respnse"+responseString);
//     if (response.statusCode == 200) {
//       // print("respnse" + responseString);
//
//       });
//     } else {
//       return null;
//     }
  }

  static Future<List<user.Datum>> fetchuserlist() async {
    var response = await client.get(BASEURL + 'userlist', headers: authHeader);
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = user.userlistResponseFromJson(json);
      if (castsResp.succes) {
        return castsResp.data;
      } else {
        Fluttertoast.showToast(
            msg: castsResp.message, toastLength: Toast.LENGTH_LONG);
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<inventory.Datum>> fetchinventorylist(token) async {
    print("reds" + token.toString());

    var response =
        await client.get(BASEURL + 'inventorylist', headers: authHeader);
    if (response.statusCode == 200) {
      var json = response.body;
      print("dadad" + response.body.toString());

      var castsResp = inventory.inventorylistResponseFromJson(json);
      if (castsResp.succes) {
        return castsResp.data;
      } else {
        Fluttertoast.showToast(msg: castsResp.message);
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<status.Datum>> fetchstatuslist(token) async {
    // createAuthHeader(token);
    var body = jsonEncode({
      "type": "1",
    });
    var response = await client.post(BASEURL + 'inventorystatus',
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      print("reds" + json.toString());

      var castsResp = status.inventoryStatusResponseFromJson(json);
      return castsResp.data;
    } else {
      return null;
    }
  }

  static Future<List<pending.Datum>> pendingitems({String iscompleted}) async {
    var body = jsonEncode({
      "iscompleted": iscompleted,
    });
    var response = await client.post(BASEURL + 'tourlist',
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      print("reds" + json.toString());

      var castsResp = pendingResponseFromJson(json);
      return castsResp.data;
    } else {
      return null;
    }
  }

  static Future<List<wallet.Datum>> wallethistory() async {
    var response =
        await client.get(BASEURL + 'wallethistory', headers: authHeader);
    if (response.statusCode == 200) {
      var json = response.body;
      print("reds" + json.toString());

      var castsResp = wallet.walletHistoryResponseFromJson(json);
      return castsResp.data;
    } else {
      return null;
    }
  }
}
