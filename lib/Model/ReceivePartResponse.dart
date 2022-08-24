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

  Data data;
  bool succes;
  String message;

  factory ReceivePartResponse.fromJson(Map<String, dynamic> json) => ReceivePartResponse(
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
    this.userId,
    this.photo,
    this.id,
  });

  String userId;
  String photo;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    photo: json["photo"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "photo": photo,
    "id": id,
  };
}
