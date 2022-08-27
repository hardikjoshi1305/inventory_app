import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_management/Model/AcceptInventoryResponse.dart';
import 'package:inventory_management/Model/AcceptRejectResponse.dart';
import 'package:inventory_management/Model/CreateExpenseResponse.dart';
import 'package:inventory_management/Model/CreateTourResponse.dart';
import 'package:inventory_management/Model/CreateUserResponse.dart';
import 'package:inventory_management/Model/ExpenseListDetailsResponse.dart';
import 'package:inventory_management/Model/FinalDignoseResponse.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart'
    as inventory;
import 'package:inventory_management/Model/InventorylistResponse.dart'
    as adminreturninventory;
import 'package:inventory_management/Model/LoginResponse.dart';
import 'package:inventory_management/Model/PendingResponse.dart';
import 'package:inventory_management/Model/ReceivePartResponse.dart';
import 'package:inventory_management/Model/SendPartResponse.dart';
import 'package:inventory_management/Model/ServiceReportResponse.dart';
import 'package:inventory_management/Model/TourRemarkResponse.dart';
import 'package:inventory_management/Model/UserTourDetailsResponse.dart';
import 'package:inventory_management/Model/UserlistResponse.dart' as user;
import 'package:inventory_management/Model/UserNameList.dart' as name;
import 'package:inventory_management/Model/PendingResponse.dart' as pending;
import 'package:inventory_management/Model/AssignInventoryResponse.dart'
    as assign;
import 'package:inventory_management/Model/SearchInventoryResponse.dart'
    as search;
import 'package:inventory_management/Model/WalletHistoryResponse.dart'
    as wallet;
import 'package:inventory_management/Model/CreateTourResponse.dart'
    as createtour;
import 'package:inventory_management/Model/InventoryStatusResponse.dart'
    as status;
import 'package:inventory_management/Model/TourHistoryResponse.dart' as history;
import 'package:inventory_management/Model/ExpenseListDetailsResponse.dart'
    as expense;
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Views/Users/CreateUser.dart';

import '../Model/AddInventoryResponse.dart';
import '../Model/GetRemarkResponse.dart';

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
      var finaldata = jsonDecode(json);
      print("res" + finaldata.toString());
      // return null;
      if ((finaldata as Map)['succes']) {
        var castsResp = loginResponseFromJson(json);
        return castsResp;
      } else {
        Fluttertoast.showToast(msg: (finaldata as Map)['message']);
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<search.Datum>> searchinventory({String query}) async {
    final body = jsonEncode({
      'search': query,
    });
    var response = await client
        .post(BASEURL + 'searchinventory', headers: authHeader, body: body)
        .catchError((error) {
      print("error" + error.toString());
    });
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = search.searchInventoryResponseFromJson(json);
      return castsResp.data;
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
    print("cretattt$service_report");

    req.fields.addAll({'tour_id': tour_id});
    req.files.add(
        await http.MultipartFile.fromPath('service_report', service_report));

    req.headers.addAll(authHeader);

    var response = await req.send();
    var json = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      var castsResp = serviceReportResponseFromJson(json.body);
      print("cretattt$json.body");

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
    if (photo != null && photo != "") {
      req.files.add(await http.MultipartFile.fromPath('photo', photo));
    }

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

  static Future createremark(
      {String tour_id, String remarkid, String remark}) async {
    print("remark" + remark);
    print("remarkid" + remarkid);

    final body = jsonEncode({
      "id": remarkid,
      "tour_id": tour_id,
      "dailyremark": remark,
      // "status": "Pending",
    });
    var response = await client.post(BASEURL + "tourdailyremark",
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      print("dadai" + json.toString());
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
      String phone,
      String password,
      String deviceid,
      String wallet_amount}) async {
//     final headers = authHeader;
//     http.MultipartFile f1 = http.MultipartFile.fromString("userid", name);
//     http.MultipartFile f3 = http.MultipartFile.fromString("mobile", phone);
//     http.MultipartFile f4 = http.MultipartFile.fromString("password", password);
//     http.MultipartFile f6 = http.MultipartFile.fromString("deviceid", deviceid);
//     http.MultipartFile f7 =
//         http.MultipartFile.fromString("wallet_amount", wallet_amount);
//     // http.MultipartFile f8 = http.MultipartFile.fromString("photo", photo);
//
//     var req = http.MultipartRequest("POST", Uri.parse('${BASEURL}createuser'));
// // print("cretattt$req");
//
//     req.files.add(f1);
//     req.files.add(f3);
//     req.files.add(f4);
//     req.files.add(f6);
//     req.files.add(f7);
//     req.headers.addAll(headers);
    var body = jsonEncode({
      "userid": name,
      "mobile": phone,
      "password": password,
      "deviceid": deviceid,
      "wallet_amount": wallet_amount,
    });

    var response = await client.post(BASEURL + 'createuser',
        headers: authHeader, body: body);

    // var response = await req.send();
    // var json = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = createUserResponseFromJson(json);
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
      // String status_id,
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

      var response = await client.post(BASEURL + 'createinventory',
          headers: headers, body: body);
      if (response.statusCode == 200) {
        var json = response.body;
        var castsResp = addInventorylResponseFromJson(json);
        if (castsResp.succes) {
          return castsResp;
        } else {
          Fluttertoast.showToast(msg: castsResp.message);
          return null;
        }
      } else {
        return null;
      }
    } else {
      body = jsonEncode({
        "inventory_id": id,
        "code": code,
        "name": name,
        "serial_no": serial_no,
        "px_no": px_no,
        "machine": machine,
        "location": location,
        "remark": remark,
        // "status_id": status_id,
        "wherefrom": wherefrom,
        "price": int.parse(Prize)
      });

      var response = await client.post(BASEURL + 'updateinventory',
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
    var response = await client
        .get(BASEURL + 'userlist', headers: authHeader)
        .catchError((error) {
      print("error" + error.toString());
    });
    ;
    if (response.statusCode == 200) {
      var json = response.body;
      print("userlist" + response.body.toString());

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

  static Future<List<name.Datum>> fetchusernamelist() async {
    var response = await client
        .get(BASEURL + 'users', headers: authHeader)
        .catchError((error) {
      print("error" + error.toString());
    });
    ;
    if (response.statusCode == 200) {
      var json = response.body;
      print("userlist" + response.body.toString());

      var castsResp = name.userNameResponseFromJson(json);
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

    var response = await client
        .get(BASEURL + 'inventorylist', headers: authHeader)
        .catchError((error) {
      print("error" + error.toString());
    });
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

  static Future<List<assign.Datum>> fetchuserinventorylist(status) async {
    var body = jsonEncode({
      "status": status,
    });
    var response = await client
        .post(BASEURL + 'getassigninventory', headers: authHeader, body: body)
        .catchError((error) {
      print("error" + error.toString());
    });
    ;
    if (response.statusCode == 200) {
      var json = response.body;
      print("dadad" + response.body.toString());

      var castsResp = assign.assignInventoryResponseFromJson(json);
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

  static Future<List<status.Datum>> fetchstatuslist() async {
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

  static sendpart(
      {String userid,
      String tourname,
      List<String> photo,
      List<String> inventory_id}) async {
    var req = http.MultipartRequest("POST", Uri.parse('${BASEURL}sendpart'));
// print("cretattt$req");

    req.fields.addAll({
      'userid': userid,
      'tourname': tourname,
    });

    inventory_id.map((e) {
      var index = inventory_id.indexOf(e);
      return req.fields.addAll({
        'inventory_id[${index}]': inventory_id[index],
        'photo[${index}]': photo[index]
      });
    }).toList();
    photo.map((e) async {
      var index = photo.indexOf(e);
      if (photo[index] != "") {
        return req.files.add(
            await http.MultipartFile.fromPath('photo[${index}]', photo[index]));
      } else {
        // File myfile = File(null);
        //
        // return req.files.add(await http.MultipartFile.fromPath(
        //     'photo[${index}]',myfile.toString()));
      }
    }).toList();
    // req.files.add(
    //     await http.MultipartFile.fromPath('photo[]', photo));

    req.headers.addAll(authHeader);
    print("request filed:  " + req.fields.toString());
    print(" files length:  " + req.files.length.toString());
    print("request files:  " + req.files.toString());
    var response = await req.send();
    var json = await http.Response.fromStream(response);
    print("request response :  " + json.body.toString());

    if (response.statusCode == 200) {
      var castsResp = sendPartResponseFromJson(json.body);
      if (castsResp.succes) {
        return castsResp;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static acceptinventory(String inventoryid) async {
    var body = jsonEncode({
      "sendid": inventoryid,
    });
    print("inventoryid" + inventoryid);

    var response = await client.post(BASEURL + 'acceptinventory',
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      print("accept" + response.body.toString());
      var castsResp = acceptInventoryResponseFromJson(json);
      if (castsResp.succes) {
        return castsResp;
      } else {
        Fluttertoast.showToast(msg: castsResp.message);
        return null;
      }
    } else {
      print("acceptfail");

      return null;
    }
  }

  static receivepart(assign.Datum userModel, String statusid, String imgpatth,
      String remark) async {
    var req = http.MultipartRequest("POST", Uri.parse('${BASEURL}receivepart'));

    req.fields.addAll({
      'userid': userModel.userId.toString(),
      'inventory_id': userModel.inventoryId.toString(),
      'send_parts_id': userModel.sendPartsId.toString(),
      'status': statusid,
      'remark': remark,
    });
    if (imgpatth.toString() != "") {
      req.files.add(await http.MultipartFile.fromPath('photo', imgpatth));
    }

    req.headers.addAll(authHeader);
    print("request filed:  " + req.fields.toString());
    print(" files length:  " + req.files.length.toString());
    print("request files:  " + req.files.toString());
    var response = await req.send();
    var json = await http.Response.fromStream(response);
    print("request response :  " + json.body.toString());

    if (response.statusCode == 200) {
      var castsResp = receivePartResponseFromJson(json.body);
      if (castsResp.succes) {
        return castsResp;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static fetchinventoryhistory(String code) async {
    var body = jsonEncode({
      "code": code,
    });
    var response = await client.post(BASEURL + 'inventoryhistory',
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

  static fetchtourlist(String userid) async {
    var body = jsonEncode({
      "user_id": userid,
    });
    var response = await client.post(BASEURL + 'tourhistory',
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      print("reds" + json.toString());
      var castsResp = history.tourHistoryResponseFromJson(json);
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

  static usertourdetail(String tourid) async {
    var body = jsonEncode({
      "tour_id": tourid,
    });
    var response = await client.post(BASEURL + 'tourhistorydetails',
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      print("reds" + json.toString());
      var castsResp = userTourDetailsResponseFromJson(json);
      if (castsResp.succes) {
        return castsResp;
      } else {
        Fluttertoast.showToast(msg: castsResp.message);
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<expense.Datum>> expenselist(String userid) async {
    var body = jsonEncode({
      "user_id": userid,
    });
    print("reds" + userid);

    var response = await client.post(BASEURL + 'expenselist',
        headers: authHeader, body: body);

    if (response.statusCode == 200) {
      var json = response.body;
      print("reds" + json.toString());
      var castsResp = expenseListDetailsResponseFromJson(json);
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

  static acceptreject(String is_approved, String expense_id) async {
    var body = jsonEncode({
      "expense_id": expense_id,
      "is_approved": is_approved,
    });
    var response = await client.post(BASEURL + 'accept_reject_expense',
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      print("reds" + json.toString());
      var castsResp = acceptRejectResponseFromJson(json);
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

  static getdailyremark({String tour_id}) async {
    final body = jsonEncode({
      "tour_id": tour_id,
      // "status": "Pending",
    });
    var response = await client.post(BASEURL + "dailyremark",
        headers: authHeader, body: body);
    if (response.statusCode == 200) {
      var json = response.body;
      print("dadai" + json.toString());
      var finaldata = jsonDecode(json);
      print("res" + finaldata.toString());
      // return null;
      if ((finaldata as Map)['succes']) {
        var castsResp = getRemarkResponseFromJson(json);
        return castsResp;
      } else {
        // Fluttertoast.showToast(msg: (finaldata as Map)['message']);
        return null;
      }
      var castsResp = getRemarkResponseFromJson(json);

      return castsResp;
    } else {
      return null;
    }
  }

  static Future<List<adminreturninventory.Datum>>
      fetchadminreturninventorylist() async {
    var response = await client
        .get(BASEURL + 'returninventory', headers: authHeader)
        .catchError((error) {
      print("error" + error.toString());
    });
    if (response.statusCode == 200) {
      var json = response.body;
      print("dadad" + response.body.toString());

      var castsResp = adminreturninventory.inventorylistResponseFromJson(json);
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
}
