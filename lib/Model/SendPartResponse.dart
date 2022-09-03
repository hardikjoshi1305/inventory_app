// To parse this JSON data, do
//
//     final sendPartResponse = sendPartResponseFromJson(jsonString);

import 'dart:convert';

SendPartResponse sendPartResponseFromJson(String str) =>
    SendPartResponse.fromJson(json.decode(str));

String sendPartResponseToJson(SendPartResponse data) =>
    json.encode(data.toJson());

class SendPartResponse {
  SendPartResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory SendPartResponse.fromJson(Map<String, dynamic> json) =>
      SendPartResponse(
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
    this.photo,
    this.userId,
    this.tourName,
    this.id,
  });

  String photo;
  var userId;
  String tourName;
  int id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        photo: json["photo"],
        userId: json["user_id"],
        tourName: json["tour_name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "user_id": userId,
        "tour_name": tourName,
        "id": id,
      };
}
