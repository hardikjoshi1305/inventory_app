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
  Datum(
      {this.id,
      this.sendPartsId,
      this.inventoryId,
      this.status,
      this.InvHistory,
      this.currDate,
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
      this.StatusDeatils});

  var id;
  var sendPartsId;
  var inventoryId;
  var status;
  var InvHistory;
  var currDate;
  var userId;
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
  var price;
  var StatusDeatils;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sendPartsId: json["SendPartId"],
        inventoryId: json["InvId"],
        status: json["Status"],
        InvHistory: json["InvHistory"],
        currDate: json["currDate"],
        userId: json["UserId"],
        tourName: json["TourName"],
        photo: json["Photo"],
        code: json["Code"],
        name: json["Name"],
        serialNo: json["SerialNumber"],
        pxNo: json["PxNo"],
        machine: json["Machine"],
        location: json["Location"],
        remark: json["Remark"],
        statusId: json["status_id"],
        wherefrom: json["WhereFrom"],
        price: json["Price"],
        StatusDeatils: json["StatusDeatils"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "SendPartId": sendPartsId,
        "InvId": inventoryId,
        "Status": status,
        "InvHistory": InvHistory,
        "currDate": currDate,
        "UserId": userId,
        "TourName": tourName,
        "Photo": photo,
        "Code": code,
        "Name": name,
        "SerialNumber": serialNo,
        "PxNo": pxNo,
        "Machine": machine,
        "Location": location,
        "Remark": remark,
        "status_id": statusId,
        "WhereFrom": wherefrom,
        "Price": price,
        "StatusDeatils": StatusDeatils,
      };
}
