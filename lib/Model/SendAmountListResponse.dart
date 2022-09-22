// To parse this JSON data, do
//
//     final sendAmountListResponse = sendAmountListResponseFromJson(jsonString);

import 'dart:convert';

SendAmountListResponse sendAmountListResponseFromJson(String str) =>
    SendAmountListResponse.fromJson(json.decode(str));

String sendAmountListResponseToJson(SendAmountListResponse data) =>
    json.encode(data.toJson());

class SendAmountListResponse {
  SendAmountListResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory SendAmountListResponse.fromJson(Map<String, dynamic> json) =>
      SendAmountListResponse(
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
    this.photo,
    this.amount,
    this.walletId,
    this.remark,
    this.usename,
  });

  var id;
  String userId;
  String photo;
  String amount;
  String walletId;
  dynamic remark;
  String usename;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["UserId"],
        photo: json["Photo"] == null ? null : json["Photo"],
        amount: json["Amount"],
        walletId: json["walletId"],
        remark: json["remark"],
        usename: json["usename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "Photo": photo == null ? null : photo,
        "Amount": amount,
        "walletId": walletId,
        "remark": remark,
        "usename": usename,
      };
}
