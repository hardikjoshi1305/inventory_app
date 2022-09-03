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
    this.userId,
    this.amount,
    this.id,
    this.walletId,
  });

  var userId;
  var amount;
  int id;
  var walletId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["UserId"],
        amount: json["Amount"],
        walletId: json["walletId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "Amount": amount,
        "walletId": walletId,
        "id": id,
      };
}
