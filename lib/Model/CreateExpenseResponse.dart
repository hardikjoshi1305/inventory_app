// To parse this JSON data, do
//
//     final createExpenseResponse = createExpenseResponseFromJson(jsonString);

import 'dart:convert';

CreateExpenseResponse createExpenseResponseFromJson(String str) =>
    CreateExpenseResponse.fromJson(json.decode(str));

String createExpenseResponseToJson(CreateExpenseResponse data) =>
    json.encode(data.toJson());

class CreateExpenseResponse {
  CreateExpenseResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory CreateExpenseResponse.fromJson(Map<String, dynamic> json) =>
      CreateExpenseResponse(
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
    this.tourId,
    this.expensesName,
    this.amount,
    this.id,
  });

  String tourId;
  String expensesName;
  String amount;
  var id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tourId: json["TourId"],
        expensesName: json["ExpName"],
        amount: json["Amount"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "TourId": tourId,
        "ExpName": expensesName,
        "Amount": amount,
        "id": id,
      };
}
