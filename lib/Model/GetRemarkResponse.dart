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
  var tourId;
  String dailyremark;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        tourId: json["TourId"],
        dailyremark: json["DailyRemark"],
        createdAt: DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "TourId": tourId,
        "DailyRemark": dailyremark,
        "CreatedAt": createdAt.toIso8601String(),
      };
}
