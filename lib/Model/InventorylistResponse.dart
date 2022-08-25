// To parse this JSON data, do
//
//     final inventorylistResponse = inventorylistResponseFromJson(jsonString);

import 'dart:convert';

InventorylistResponse inventorylistResponseFromJson(String str) =>
    InventorylistResponse.fromJson(json.decode(str));

String inventorylistResponseToJson(InventorylistResponse data) =>
    json.encode(data.toJson());

class InventorylistResponse {
  InventorylistResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory InventorylistResponse.fromJson(Map<String, dynamic> json) =>
      InventorylistResponse(
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
    this.code,
    this.name,
    this.serialNo,
    this.pxNo,
    this.machine,
    this.location,
    this.remark,
    this.statusId,
    this.wherefrom,
    this.price,
    this.status_name,
  });

  int id;
  String code;
  String name;
  String serialNo;
  String pxNo;
  String machine;
  String location;
  String remark;
  String statusId;
  String wherefrom;
  var price;
  var status_name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        serialNo: json["serial_no"],
        pxNo: json["px_no"],
        machine: json["machine"],
        location: json["location"],
        remark: json["remark"],
        statusId: json["status_id"],
        wherefrom: json["wherefrom"],
        price: json["price"],
        status_name: json["status_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "serial_no": serialNo,
        "px_no": pxNo,
        "machine": machine,
        "location": location,
        "remark": remark,
        "status_id": statusId,
        "wherefrom": wherefrom,
        "price": price,
        "status_name": status_name,
      };
}
