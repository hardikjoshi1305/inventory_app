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
  Datum({
    this.id,
    this.userid,
    this.mobile,
    this.apiToken,
    this.type,
    this.isActive,
    this.deviceid,
    this.walletAmount,
  });

  var id;
  String userid;
  String mobile;
  String apiToken;
  String type;
  String isActive;
  String deviceid;
  String walletAmount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userid: json["userid"],
        mobile: json["mobile"],
        apiToken: json["api_token"],
        type: json["type"],
        isActive: json["is_active"],
        deviceid: json["deviceid"],
        walletAmount: json["wallet_amount"],
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
      };
}
