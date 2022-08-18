// To parse this JSON data, do
//
//     final createUserResponse = createUserResponseFromJson(jsonString);

import 'dart:convert';

CreateUserResponse createUserResponseFromJson(String str) =>
    CreateUserResponse.fromJson(json.decode(str));

String createUserResponseToJson(CreateUserResponse data) =>
    json.encode(data.toJson());

class CreateUserResponse {
  CreateUserResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      CreateUserResponse(
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
    this.email,
    this.status,
    this.city,
    this.walletAmount,
    this.photo,
    this.mobileNumber,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.apiToken,
  });

  String name;
  String email;
  String status;
  String city;
  String walletAmount;
  dynamic photo;
  String mobileNumber;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String apiToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        status: json["status"],
        city: json["city"],
        walletAmount: json["wallet_amount"],
        photo: json["photo"],
        mobileNumber: json["mobile_number"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "status": status,
        "city": city,
        "wallet_amount": walletAmount,
        "photo": photo,
        "mobile_number": mobileNumber,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "api_token": apiToken,
      };
}
