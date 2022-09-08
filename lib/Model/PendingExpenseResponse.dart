// To parse this JSON data, do
//
//     final pendingExpenseResponse = pendingExpenseResponseFromJson(jsonString);

import 'dart:convert';

PendingExpenseResponse pendingExpenseResponseFromJson(String str) =>
    PendingExpenseResponse.fromJson(json.decode(str));

String pendingExpenseResponseToJson(PendingExpenseResponse data) =>
    json.encode(data.toJson());

class PendingExpenseResponse {
  PendingExpenseResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory PendingExpenseResponse.fromJson(Map<String, dynamic> json) =>
      PendingExpenseResponse(
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
    this.expName,
    this.amount,
    this.photo,
    this.isApproved,
    this.createdAt,
  });

  int id;
  String userId;
  String tourname;
  String expName;
  String amount;
  dynamic photo;
  String isApproved;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["UserID"],
        tourname: json["tourname"],
        expName: json["ExpName"],
        amount: json["amount"],
        photo: json["photo"],
        isApproved: json["IsApproved"],
        createdAt: DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserID": userId,
        "tourname": tourname,
        "ExpName": expName,
        "amount": amount,
        "photo": photo,
        "IsApproved": isApproved,
        "CreatedAt": createdAt.toIso8601String(),
      };
}
