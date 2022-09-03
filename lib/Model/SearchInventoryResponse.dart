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
  Datum(
      {this.id,
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
      this.StatusDeatils});

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
  var StatusDeatils;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        code: json["Code"],
        name: json["Name"],
        serialNo: json["SerialNumber"],
        pxNo: json["PxNo"],
        machine: json["Machine"],
        location: json["Location"],
        remark: json["Remark"],
        statusId: json["Status"],
        wherefrom: json["WhereFrom"],
        price: json["Price"],
        StatusDeatils: json["StatusDeatils"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Code": code,
        "Name": name,
        "SerialNumber": serialNo,
        "PxNo": pxNo,
        "Machine": machine,
        "Location": location,
        "Remark": remark,
        "Status": statusId,
        "WhereFrom": wherefrom,
        "Price": price,
        "StatusDeatils": StatusDeatils,
      };
}
