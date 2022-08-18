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
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String statusName;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        statusName: json["status_name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status_name": statusName,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
