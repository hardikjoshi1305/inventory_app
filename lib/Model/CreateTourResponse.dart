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
    this.name,
    this.problem,
    this.city,
    this.status,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String name;
  String problem;
  String city;
  String status;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        problem: json["problem"],
        city: json["city"],
        status: json["status"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "problem": problem,
        "city": city,
        "status": status,
        "user_id": userId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
