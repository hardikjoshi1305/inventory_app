// To parse this JSON data, do
//
//     final sendAmountResponse = sendAmountResponseFromJson(jsonString);

import 'dart:convert';

SendAmountResponse sendAmountResponseFromJson(String str) =>
    SendAmountResponse.fromJson(json.decode(str));

String sendAmountResponseToJson(SendAmountResponse data) =>
    json.encode(data.toJson());

class SendAmountResponse {
  SendAmountResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory SendAmountResponse.fromJson(Map<String, dynamic> json) =>
      SendAmountResponse(
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
    this.photo,
    this.userId,
    this.amount,
    this.id,
  });

  String photo;
  String userId;
  String amount;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        photo: json["photo"],
        userId: json["user_id"],
        amount: json["amount"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "user_id": userId,
        "amount": amount,
        "id": id,
      };
}
