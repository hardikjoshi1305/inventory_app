// To parse this JSON data, do
//
//     final getRemarkResponse = getRemarkResponseFromJson(jsonString);

import 'dart:convert';

GetRemarkResponse getRemarkResponseFromJson(String str) =>
    GetRemarkResponse.fromJson(json.decode(str));

String getRemarkResponseToJson(GetRemarkResponse data) =>
    json.encode(data.toJson());

class GetRemarkResponse {
  GetRemarkResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory GetRemarkResponse.fromJson(Map<String, dynamic> json) =>
      GetRemarkResponse(
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
    this.id,
    this.tourId,
    this.dailyremark,
    this.createdAt,
  });

  int id;
  String tourId;
  String dailyremark;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        tourId: json["tour_id"],
        dailyremark: json["dailyremark"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tour_id": tourId,
        "dailyremark": dailyremark,
        "created_at": createdAt.toIso8601String(),
      };
}
