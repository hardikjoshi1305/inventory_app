// To parse this JSON data, do
//
//     final addInventorylResponse = addInventorylResponseFromJson(jsonString);

import 'dart:convert';

AddInventorylResponse addInventorylResponseFromJson(String str) =>
    AddInventorylResponse.fromJson(json.decode(str));

String addInventorylResponseToJson(AddInventorylResponse data) =>
    json.encode(data.toJson());

class AddInventorylResponse {
  AddInventorylResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory AddInventorylResponse.fromJson(Map<String, dynamic> json) =>
      AddInventorylResponse(
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
    this.id,
  });

  String code;
  String name;
  String serialNo;
  String pxNo;
  String machine;
  String location;
  String remark;
  String statusId;
  String wherefrom;
  int price;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
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
        "id": id,
      };
}
