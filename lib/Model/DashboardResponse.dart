// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) =>
    json.encode(data.toJson());

class DashboardResponse {
  DashboardResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
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
    this.userwallerAmt,
    this.isVisible,
    this.userid,
    this.sendpart,
    this.adminsendAmt,
  });

  String userwallerAmt;
  var isVisible;
  var userid;
  var sendpart;
  List<AdminsendAmt> adminsendAmt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userwallerAmt: json["userwallerAmt"],
        isVisible: json["is_visible"],
        userid: json["userid"],
        sendpart: json["sendpart"],
        adminsendAmt: List<AdminsendAmt>.from(
            json["adminsendAmt"].map((x) => AdminsendAmt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userwallerAmt": userwallerAmt,
        "is_visible": isVisible,
        "userid": userid,
        "sendpart": sendpart,
        "adminsendAmt": List<dynamic>.from(adminsendAmt.map((x) => x.toJson())),
      };
}

class AdminsendAmt {
  AdminsendAmt({
    this.id,
    this.userId,
    this.photo,
    this.amount,
    this.walletId,
  });

  var id;
  var userId;
  String photo;
  var amount;
  var walletId;

  factory AdminsendAmt.fromJson(Map<String, dynamic> json) => AdminsendAmt(
        id: json["id"],
        userId: json["UserId"],
        photo: json["Photo"] == null ? null : json["Photo"],
        amount: json["Amount"],
        walletId: json["walletId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "Photo": photo == null ? null : photo,
        "Amount": amount,
        "walletId": walletId,
      };
}
