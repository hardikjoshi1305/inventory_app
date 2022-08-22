// To parse this JSON data, do
//
//     final inventoryStatusResponse = inventoryStatusResponseFromJson(jsonString);

import 'dart:convert';

InventoryStatusResponse inventoryStatusResponseFromJson(String str) =>
    InventoryStatusResponse.fromJson(json.decode(str));

String inventoryStatusResponseToJson(InventoryStatusResponse data) =>
    json.encode(data.toJson());

class InventoryStatusResponse {
  InventoryStatusResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory InventoryStatusResponse.fromJson(Map<String, dynamic> json) =>
      InventoryStatusResponse(
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
    this.statusName,
    this.isActive,
  });

  var id;
  String statusName;
  var isActive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        statusName: json["status_name"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status_name": statusName,
        "is_active": isActive,
      };
}
