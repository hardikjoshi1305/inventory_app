// To parse this JSON data, do
//
//     final acceptInventoryResponse = acceptInventoryResponseFromJson(jsonString);

import 'dart:convert';

AcceptInventoryResponse acceptInventoryResponseFromJson(String str) => AcceptInventoryResponse.fromJson(json.decode(str));

String acceptInventoryResponseToJson(AcceptInventoryResponse data) => json.encode(data.toJson());

class AcceptInventoryResponse {
  AcceptInventoryResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory AcceptInventoryResponse.fromJson(Map<String, dynamic> json) => AcceptInventoryResponse(
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
    this.id,
    this.sendPartsId,
    this.inventoryId,
    this.status,
  });

  var id;
  var sendPartsId;
  var inventoryId;
  var status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    sendPartsId: json["send_parts_id"],
    inventoryId: json["inventory_id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "send_parts_id": sendPartsId,
    "inventory_id": inventoryId,
    "status": status,
  };
}
