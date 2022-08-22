// To parse this JSON data, do
//
//     final finalDignoseResponse = finalDignoseResponseFromJson(jsonString);

import 'dart:convert';

FinalDignoseResponse finalDignoseResponseFromJson(String str) =>
    FinalDignoseResponse.fromJson(json.decode(str));

String finalDignoseResponseToJson(FinalDignoseResponse data) =>
    json.encode(data.toJson());

class FinalDignoseResponse {
  FinalDignoseResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory FinalDignoseResponse.fromJson(Map<String, dynamic> json) =>
      FinalDignoseResponse(
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
    this.finaldignose,
    this.id,
  });

  var tourId;
  String finaldignose;
  var id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tourId: json["tour_id"],
        finaldignose: json["finaldignose"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "tour_id": tourId,
        "finaldignose": finaldignose,
        "id": id,
      };
}
