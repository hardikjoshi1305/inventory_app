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
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tourId: json["tour_id"],
        expensesName: json["expenses_name"],
        amount: json["amount"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "tour_id": tourId,
        "expenses_name": expensesName,
        "amount": amount,
        "id": id,
      };
}
