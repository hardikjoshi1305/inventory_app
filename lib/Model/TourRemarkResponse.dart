// To parse this JSON data, do
//
//     final tourRemarkResponse = tourRemarkResponseFromJson(jsonString);

import 'dart:convert';

TourRemarkResponse tourRemarkResponseFromJson(String str) =>
    TourRemarkResponse.fromJson(json.decode(str));

String tourRemarkResponseToJson(TourRemarkResponse data) =>
    json.encode(data.toJson());

class TourRemarkResponse {
  TourRemarkResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory TourRemarkResponse.fromJson(Map<String, dynamic> json) =>
      TourRemarkResponse(
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
    this.tourId,
    this.dailyremark,
    this.id,
  });

  var tourId;
  String dailyremark;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tourId: json["tour_id"],
        dailyremark: json["dailyremark"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "tour_id": tourId,
        "dailyremark": dailyremark,
        "id": id,
      };
}
