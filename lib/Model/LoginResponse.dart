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
  var userid;
  String mobile;
  String apiToken;
  String type;
  String isActive;
  dynamic deviceid;
  dynamic walletAmount;
  var is_visible;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userid: json["UserID"],
        mobile: json["Mobile"],
        apiToken: json["api_token"],
        type: json["type"],
        isActive: json["IsActive"],
        deviceid: json["DeviceId"],
        walletAmount: json["WalletAmount"],
        is_visible: json["IsVisible"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserID": userid,
        "Mobile": mobile,
        "api_token": apiToken,
        "type": type,
        "IsActive": isActive,
        "DeviceId": deviceid,
        "WalletAmount": walletAmount,
        "IsVisible": is_visible,
      };
}
