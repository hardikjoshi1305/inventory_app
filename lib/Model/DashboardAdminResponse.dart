// To parse this JSON data, do
//
//     final dashboardAdminResponse = dashboardAdminResponseFromJson(jsonString);

import 'dart:convert';

DashboardAdminResponse dashboardAdminResponseFromJson(String str) =>
    DashboardAdminResponse.fromJson(json.decode(str));

String dashboardAdminResponseToJson(DashboardAdminResponse data) =>
    json.encode(data.toJson());

class DashboardAdminResponse {
  DashboardAdminResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory DashboardAdminResponse.fromJson(Map<String, dynamic> json) =>
      DashboardAdminResponse(
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
    this.totalamot,
    this.expensepending,
    this.returnpending,
    this.adminsendpart,
  });

  var totalamot;
  var expensepending;
  var returnpending;
  List<Adminsendpart> adminsendpart;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        totalamot: json["totalamot"],
        expensepending: json["expensepending"],
        returnpending: json["returnpending"],
        adminsendpart: List<Adminsendpart>.from(
            json["adminsendpart"].map((x) => Adminsendpart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalamot": totalamot,
        "expensepending": expensepending,
        "returnpending": returnpending,
        "adminsendpart":
            List<dynamic>.from(adminsendpart.map((x) => x.toJson())),
      };
}

class Adminsendpart {
  Adminsendpart({
    this.code,
    this.name,
    this.userId,
  });

  String code;
  String name;
  String userId;

  factory Adminsendpart.fromJson(Map<String, dynamic> json) => Adminsendpart(
        code: json["code"],
        name: json["name"],
        userId: json["UserID"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "UserID": userId,
      };
}
