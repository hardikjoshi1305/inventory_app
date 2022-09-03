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
  var id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tourId: json["TourId"],
        dailyremark: json["DailyRemark"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "TourId": tourId,
        "DailyRemark": dailyremark,
        "id": id,
      };
}
