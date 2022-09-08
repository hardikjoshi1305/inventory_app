// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
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
    this.IsCompleted,
    this.FinalDignose,
    this.ErrorName,
    this.createdAt,
  });

  var id;
  var userId;
  String tourname;
  String expName;
  String amount;
  String photo;
  String IsCompleted;
  String FinalDignose;
  String ErrorName;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["UserID"],
        tourname: json["tourname"],
        expName: json["ExpName"],
        amount: json["amount"],
        photo: json["photo"] == null ? null : json["photo"],
        IsCompleted: json["IsCompleted"],
        FinalDignose: json["FinalDignose"],
        ErrorName: json["ErrorName"],
        createdAt: DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserID": userId,
        "tourname": tourname,
        "ExpName": expName,
        "amount": amount,
        "photo": photo == null ? null : photo,
        "IsCompleted": IsCompleted,
        "FinalDignose": FinalDignose,
        "ErrorName": ErrorName,
        "CreatedAt": createdAt.toIso8601String(),
      };
}
