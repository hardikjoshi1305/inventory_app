// To parse this JSON data, do
//
//     final createTourResponse = createTourResponseFromJson(jsonString);

import 'dart:convert';

CreateTourResponse createTourResponseFromJson(String str) =>
    CreateTourResponse.fromJson(json.decode(str));

String createTourResponseToJson(CreateTourResponse data) =>
    json.encode(data.toJson());

class CreateTourResponse {
  CreateTourResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory CreateTourResponse.fromJson(Map<String, dynamic> json) =>
      CreateTourResponse(
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
    this.tourname,
    this.errorname,
    this.city,
    this.userId,
    this.id,
  });

  String tourname;
  String errorname;
  String city;
  var userId;
  var id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tourname: json["tourname"],
        errorname: json["errorname"],
        city: json["city"],
        userId: json["user_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "tourname": tourname,
        "errorname": errorname,
        "city": city,
        "user_id": userId,
        "id": id,
      };
}
