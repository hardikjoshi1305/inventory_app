// To parse this JSON data, do
//
//     final assignInventoryResponse = assignInventoryResponseFromJson(jsonString);

import 'dart:convert';

AssignInventoryResponse assignInventoryResponseFromJson(String str) =>
    AssignInventoryResponse.fromJson(json.decode(str));

String assignInventoryResponseToJson(AssignInventoryResponse data) =>
    json.encode(data.toJson());

class AssignInventoryResponse {
  AssignInventoryResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory AssignInventoryResponse.fromJson(Map<String, dynamic> json) =>
      AssignInventoryResponse(
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
    this.sendPartsId,
    this.inventoryId,
    this.status,
    this.userId,
    this.tourName,
    this.photo,
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

  int id;
  int sendPartsId;
  int inventoryId;
  int status;
  int userId;
  String tourName;
  String photo;
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sendPartsId: json["send_parts_id"],
        inventoryId: json["inventory_id"],
        status: json["status"],
        userId: json["user_id"],
        tourName: json["tour_name"],
        photo: json["photo"],
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
        "send_parts_id": sendPartsId,
        "inventory_id": inventoryId,
        "status": status,
        "user_id": userId,
        "tour_name": tourName,
        "photo": photo,
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
