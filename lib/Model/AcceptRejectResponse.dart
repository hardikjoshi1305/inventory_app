// To parse this JSON data, do
//
//     final acceptRejectResponse = acceptRejectResponseFromJson(jsonString);

import 'dart:convert';

AcceptRejectResponse acceptRejectResponseFromJson(String str) => AcceptRejectResponse.fromJson(json.decode(str));

String acceptRejectResponseToJson(AcceptRejectResponse data) => json.encode(data.toJson());

class AcceptRejectResponse {
  AcceptRejectResponse({
    this.message,
    this.succes,
    this.data,
  });

  String message;
  bool succes;
  List<dynamic> data;

  factory AcceptRejectResponse.fromJson(Map<String, dynamic> json) => AcceptRejectResponse(
    message: json["message"],
    succes: json["succes"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "succes": succes,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
