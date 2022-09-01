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
  });

  int totalamot;
  int expensepending;
  int returnpending;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        totalamot: json["totalamot"],
        expensepending: json["expensepending"],
        returnpending: json["returnpending"],
      );

  Map<String, dynamic> toJson() => {
        "totalamot": totalamot,
        "expensepending": expensepending,
        "returnpending": returnpending,
      };
}
