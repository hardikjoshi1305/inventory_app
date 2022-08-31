// To parse this JSON data, do
//
//     final addDailyRemarkListResponse = addDailyRemarkListResponseFromJson(jsonString);

import 'dart:convert';

AddDailyRemarkListResponse addDailyRemarkListResponseFromJson(String str) =>
    AddDailyRemarkListResponse.fromJson(json.decode(str));

String addDailyRemarkListResponseToJson(AddDailyRemarkListResponse data) =>
    json.encode(data.toJson());

class AddDailyRemarkListResponse {
  AddDailyRemarkListResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory AddDailyRemarkListResponse.fromJson(Map<String, dynamic> json) =>
      AddDailyRemarkListResponse(
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
    this.userId,
    this.tourname,
    this.errorname,
    this.city,
    this.iscompleted,
    this.createdAt,
    this.userid,
    this.mobile,
    this.apiToken,
    this.password,
    this.type,
    this.isActive,
    this.deviceid,
    this.walletAmount,
    this.tourId,
    this.dailyremark,
  });

  int id;
  int userId;
  String tourname;
  String errorname;
  String city;
  String iscompleted;
  DateTime createdAt;
  String userid;
  String mobile;
  String apiToken;
  String password;
  String type;
  String isActive;
  String deviceid;
  String walletAmount;
  int tourId;
  String dailyremark;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        tourname: json["tourname"],
        errorname: json["errorname"],
        city: json["city"],
        iscompleted: json["iscompleted"],
        createdAt: DateTime.parse(json["created_at"]),
        userid: json["userid"],
        mobile: json["mobile"],
        apiToken: json["api_token"],
        password: json["password"],
        type: json["type"],
        isActive: json["is_active"],
        deviceid: json["deviceid"],
        walletAmount: json["wallet_amount"],
        tourId: json["tour_id"],
        dailyremark: json["dailyremark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "tourname": tourname,
        "errorname": errorname,
        "city": city,
        "iscompleted": iscompleted,
        "created_at": createdAt.toIso8601String(),
        "userid": userid,
        "mobile": mobile,
        "api_token": apiToken,
        "password": password,
        "type": type,
        "is_active": isActive,
        "deviceid": deviceid,
        "wallet_amount": walletAmount,
        "tour_id": tourId,
        "dailyremark": dailyremark,
      };
}
