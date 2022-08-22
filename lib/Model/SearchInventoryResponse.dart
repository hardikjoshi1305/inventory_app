// To parse this JSON data, do
//
//     final searchInventoryResponse = searchInventoryResponseFromJson(jsonString);

import 'dart:convert';

SearchInventoryResponse searchInventoryResponseFromJson(String str) =>
    SearchInventoryResponse.fromJson(json.decode(str));

String searchInventoryResponseToJson(SearchInventoryResponse data) =>
    json.encode(data.toJson());

class SearchInventoryResponse {
  SearchInventoryResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory SearchInventoryResponse.fromJson(Map<String, dynamic> json) =>
      SearchInventoryResponse(
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
  });

  var id;
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
      };
}
