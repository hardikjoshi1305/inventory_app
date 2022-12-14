// To parse this JSON data, do
//
//     final expenseListDetailsResponse = expenseListDetailsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

ExpenseListDetailsResponse expenseListDetailsResponseFromJson(String str) =>
    ExpenseListDetailsResponse.fromJson(json.decode(str));

String expenseListDetailsResponseToJson(ExpenseListDetailsResponse data) =>
    json.encode(data.toJson());

class ExpenseListDetailsResponse {
  ExpenseListDetailsResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory ExpenseListDetailsResponse.fromJson(Map<String, dynamic> json) =>
      ExpenseListDetailsResponse(
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
    this.UserID,
    this.tourname,
    this.expensesName,
    this.amount,
    this.photo,
    this.isApproved,
    this.createdAt,
  });

  var id;
  var UserID;
  String tourname;
  String expensesName;
  String amount;
  String photo;
  var isApproved;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tourname: json["tourname"],
        UserID: json["UserID"],
        expensesName: json["ExpName"],
        amount: json["amount"],
        photo: json["photo"],
        isApproved: json["IsApproved"],
        createdAt: DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tourname": tourname,
        "UserID": UserID,
        "ExpName": expensesName,
        "amount": amount,
        "photo": photo,
        "IsApproved": isApproved,
        "CreatedAt": createdAt.toIso8601String(),
      };
}
