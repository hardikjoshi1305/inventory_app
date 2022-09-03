// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: Data.fromJson(json["data"]),
        succes: json["succes"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "succes": succes,
        "message": message,
      };
}

class Data {
  Data({
    this.id,
    this.userid,
    this.mobile,
    this.apiToken,
    this.type,
    this.isActive,
    this.deviceid,
    this.walletAmount,
    this.is_visible,
  });

  int id;
  String userid;
  String mobile;
  String apiToken;
  String type;
  String isActive;
  dynamic deviceid;
  dynamic walletAmount;
  var is_visible;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userid: json["userid"],
        mobile: json["mobile"],
        apiToken: json["api_token"],
        type: json["type"],
        isActive: json["is_active"],
        deviceid: json["deviceid"],
        walletAmount: json["wallet_amount"],
        is_visible: json["is_visible"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "mobile": mobile,
        "api_token": apiToken,
        "type": type,
        "is_active": isActive,
        "deviceid": deviceid,
        "wallet_amount": walletAmount,
        "is_visible": is_visible,
      };
}
