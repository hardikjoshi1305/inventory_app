// To parse this JSON data, do
//
//     final pendingResponse = pendingResponseFromJson(jsonString);

import 'dart:convert';

PendingResponse pendingResponseFromJson(String str) =>
    PendingResponse.fromJson(json.decode(str));

String pendingResponseToJson(PendingResponse data) =>
    json.encode(data.toJson());

class PendingResponse {
  PendingResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory PendingResponse.fromJson(Map<String, dynamic> json) =>
      PendingResponse(
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
  });

  int id;
  int userId;
  String tourname;
  String errorname;
  String city;
  String iscompleted;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        tourname: json["tourname"],
        errorname: json["errorname"],
        city: json["city"],
        iscompleted: json["iscompleted"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "tourname": tourname,
        "errorname": errorname,
        "city": city,
        "iscompleted": iscompleted,
        "created_at": createdAt.toIso8601String(),
      };
}
