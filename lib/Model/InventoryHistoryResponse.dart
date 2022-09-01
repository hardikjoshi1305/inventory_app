// To parse this JSON data, do
//
//     final inventoryHistoryResponse = inventoryHistoryResponseFromJson(jsonString);

import 'dart:convert';

InventoryHistoryResponse inventoryHistoryResponseFromJson(String str) =>
    InventoryHistoryResponse.fromJson(json.decode(str));

String inventoryHistoryResponseToJson(InventoryHistoryResponse data) =>
    json.encode(data.toJson());

class InventoryHistoryResponse {
  InventoryHistoryResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory InventoryHistoryResponse.fromJson(Map<String, dynamic> json) =>
      InventoryHistoryResponse(
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
    this.userid,
    this.invHistory,
    this.currDate,
  });

  int id;
  String userid;
  String invHistory;
  String currDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userid: json["userid"],
        invHistory: json["InvHistory"] == null ? null : json["InvHistory"],
        currDate: json["currDate"] == null ? null : json["currDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "InvHistory": invHistory == null ? null : invHistory,
        "currDate": currDate == null ? null : currDate,
      };
}
