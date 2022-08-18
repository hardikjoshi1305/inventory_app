import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_management/Model/CreateUserResponse.dart';
import 'package:inventory_management/Model/InventorylistResponse.dart'
    as inventory;
import 'package:inventory_management/Model/LoginResponse.dart';
import 'package:inventory_management/Model/UserlistResponse.dart' as user;
import 'package:inventory_management/Model/casts.dart';
import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:inventory_management/Utility/SharedPreferenceHelper.dart';
import 'package:inventory_management/Views/Users/CreateUser.dart';

class RequestCall {
  static var client = http.Client();
  static var BASEURL = "http://192.168.0.8/inventorymanagement/api/";
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
      'email': email,
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

  static Future<List<Cast>> creatTour(
      {String tourname, String problem, String city}) async {
    var response = await client.get(
        'https://api.themoviedb.org/3/movie/$tourname/credits?api_key=a92f28e11a27e8e5938a2020be68ba9c');
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = castsFromJson(json);
      return castsResp.cast;
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

  static Future<List<user.Datum>> fetchuserlist() async {
    var response = await client.get(BASEURL + 'userlist', headers: authHeader);
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = user.userlistResponseFromJson(json);
      return castsResp.data;
    } else {
      return null;
    }
  }

  static Future<List<inventory.Datum>> fetchinventorylist() async {
    var response =
        await client.get(BASEURL + 'inventorylist', headers: authHeader);
    print(authHeader.toString());
    if (response.statusCode == 200) {
      var json = response.body;
      print("reds" + json.toString());

      var castsResp = inventory.inventorylistResponseFromJson(json);
      return castsResp.data;
    } else {
      return null;
    }
  }

  static Future<List<Cast>> pendingitems({String userid}) async {
    var response = await client.get(
        'https://api.themoviedb.org/3/movie/$userid/credits?api_key=a92f28e11a27e8e5938a2020be68ba9c');
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = castsFromJson(json);
      return castsResp.cast;
    } else {
      return null;
    }
  }
}
