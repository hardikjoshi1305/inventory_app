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
  Data(
      {this.code,
      this.name,
      this.serialNo,
      this.pxNo,
      this.machine,
      this.location,
      this.remark,
      this.wherefrom,
      this.price,
      this.id,
      this.StatusDeatils});

  String code;
  String name;
  String serialNo;
  String pxNo;
  String machine;
  String location;
  String remark;
  String wherefrom;
  var StatusDeatils;
  var price;
  var id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["Code"],
        name: json["Name"],
        serialNo: json["SerialNumber"],
        pxNo: json["PxNo"],
        machine: json["Machine"],
        location: json["Location"],
        remark: json["Remark"],
        wherefrom: json["WhereFrom"],
        StatusDeatils: json["StatusDeatils"],
        price: json["Price"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Name": name,
        "SerialNumber": serialNo,
        "PxNo": pxNo,
        "Machine": machine,
        "Location": location,
        "Remark": remark,
        "WhereFrom": wherefrom,
        "Price": price,
        "id": id,
      };
}
