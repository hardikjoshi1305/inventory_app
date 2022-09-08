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

  Data data;
  bool succes;
  String message;

  factory TourHistoryResponse.fromJson(Map<String, dynamic> json) =>
      TourHistoryResponse(
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
    this.expenselist,
    this.totalexpenses,
  });

  List<Expenselist> expenselist;
  var totalexpenses;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        expenselist: List<Expenselist>.from(
            json["expenselist"].map((x) => Expenselist.fromJson(x))),
        totalexpenses: json["totalexpenses"],
      );

  Map<String, dynamic> toJson() => {
        "expenselist": List<dynamic>.from(expenselist.map((x) => x.toJson())),
        "totalexpenses": totalexpenses,
      };
}

class Expenselist {
  Expenselist({
    this.id,
    this.userId,
    this.tourName,
    this.errorName,
    this.city,
    this.amount,
    this.isCompleted,
    this.createdAt,
  });

  int id;
  String userId;
  String tourName;
  String errorName;
  String city;
  String isCompleted;
  var amount;
  DateTime createdAt;

  factory Expenselist.fromJson(Map<String, dynamic> json) => Expenselist(
        id: json["id"],
        userId: json["UserID"],
        tourName: json["tourname"],
        errorName: json["ErrorName"],
        city: json["city"],
        amount: json["Amount"],
        isCompleted: json["IsCompleted"],
        createdAt: DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "tourname": tourName,
        "ErrorName": errorName,
        "city": city,
        "Amount": amount,
        "IsCompleted": isCompleted,
        "CreatedAt": createdAt.toIso8601String(),
      };
}
