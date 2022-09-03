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
    this.is_visible,
    this.dailyremark,
  });

  var id;
  var userId;
  String tourname;
  String errorname;
  String city;
  String iscompleted;
  DateTime createdAt;
  var userid;
  String mobile;
  String apiToken;
  String password;
  String type;
  String isActive;
  String deviceid;
  String walletAmount;
  var tourId;
  var is_visible;
  String dailyremark;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["UserId"],
        tourname: json["TourName"],
        errorname: json["ErrorName"],
        city: json["City"],
        iscompleted: json["IsCompleted"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        userid: json["UserID"],
        mobile: json["Mobile"],
        apiToken: json["api_token"],
        password: json["password"],
        type: json["type"],
        isActive: json["IsActive"],
        deviceid: json["DeviceId"],
        walletAmount: json["WalletAmount"],
        tourId: json["TourId"],
        is_visible: json["IsVisible"],
        dailyremark: json["DailyRemark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "TourName": tourname,
        "ErrorName": errorname,
        "City": city,
        "IsCompleted": iscompleted,
        "CreatedAt": createdAt.toIso8601String(),
        "UserID": userid,
        "Mobile": mobile,
        "api_token": apiToken,
        "password": password,
        "type": type,
        "IsActive": isActive,
        "DeviceId": deviceid,
        "WalletAmount": walletAmount,
        "TourId": tourId,
        "IsVisible": is_visible,
        "DailyRemark": dailyremark,
      };
}
