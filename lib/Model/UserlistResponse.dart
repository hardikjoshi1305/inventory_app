// To parse this JSON data, do
//
//     final userlistResponse = userlistResponseFromJson(jsonString);

import 'dart:convert';

UserlistResponse userlistResponseFromJson(String str) =>
    UserlistResponse.fromJson(json.decode(str));

String userlistResponseToJson(UserlistResponse data) =>
    json.encode(data.toJson());

class UserlistResponse {
  UserlistResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory UserlistResponse.fromJson(Map<String, dynamic> json) =>
      UserlistResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        succes: json["succes"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "succes": succes,
        "message": message,
      };
}

class Datum {
  Datum(
      {this.id,
      this.userid,
      this.mobile,
      this.apiToken,
      this.type,
      this.isActive,
      this.deviceid,
      this.walletAmount,
      this.pass,
      this.IsVisible});

  var id;
  var userid;
  String mobile;
  String apiToken;
  String type;
  String isActive;
  String deviceid;
  String walletAmount;
  var IsVisible;
  var pass;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userid: json["UserID"],
        mobile: json["Mobile"],
        apiToken: json["api_token"],
        type: json["type"],
        isActive: json["IsActive"],
        deviceid: json["DeviceId"],
        walletAmount: json["WalletAmount"],
        IsVisible: json["IsVisible"],
        pass: json["pass"],
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
        "IsVisible": IsVisible,
        "pass": pass,
      };
}
