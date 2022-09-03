// To parse this JSON data, do
//
//     final tourHistoryResponse = tourHistoryResponseFromJson(jsonString);

import 'dart:convert';

TourHistoryResponse tourHistoryResponseFromJson(String str) =>
    TourHistoryResponse.fromJson(json.decode(str));

String tourHistoryResponseToJson(TourHistoryResponse data) =>
    json.encode(data.toJson());

class TourHistoryResponse {
  TourHistoryResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory TourHistoryResponse.fromJson(Map<String, dynamic> json) =>
      TourHistoryResponse(
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
  var userId;
  String tourname;
  String errorname;
  String city;
  String iscompleted;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["UserId"],
        tourname: json["TourName"],
        errorname: json["ErrorName"] == null ? null : json["ErrorName"],
        city: json["City"],
        iscompleted: json["IsCompleted"],
        createdAt: DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "TourName": tourname,
        "ErrorName": errorname == null ? null : errorname,
        "City": city,
        "IsCompleted": iscompleted,
        "CreatedAt": createdAt.toIso8601String(),
      };
}
