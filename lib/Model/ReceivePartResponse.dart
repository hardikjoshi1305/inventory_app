// To parse this JSON data, do
//
//     final receivePartResponse = receivePartResponseFromJson(jsonString);

import 'dart:convert';

ReceivePartResponse receivePartResponseFromJson(String str) => ReceivePartResponse.fromJson(json.decode(str));

String receivePartResponseToJson(ReceivePartResponse data) => json.encode(data.toJson());

class ReceivePartResponse {
  ReceivePartResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<dynamic> data;
  bool succes;
  String message;

  factory ReceivePartResponse.fromJson(Map<String, dynamic> json) => ReceivePartResponse(
    data: List<dynamic>.from(json["data"].map((x) => x)),
    succes: json["succes"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x)),
    "succes": succes,
    "message": message,
  };
}
