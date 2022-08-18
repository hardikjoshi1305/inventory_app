// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    this.name,
    this.email,
    this.apiToken,
    this.emailVerifiedAt,
    this.type,
    this.photo,
    this.status,
    this.city,
    this.walletAmount,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  String apiToken;
  dynamic emailVerifiedAt;
  String type;
  dynamic photo;
  dynamic status;
  dynamic city;
  dynamic walletAmount;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    apiToken: json["api_token"],
    emailVerifiedAt: json["email_verified_at"],
    type: json["type"],
    photo: json["photo"],
    status: json["status"],
    city: json["city"],
    walletAmount: json["wallet_amount"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "api_token": apiToken,
    "email_verified_at": emailVerifiedAt,
    "type": type,
    "photo": photo,
    "status": status,
    "city": city,
    "wallet_amount": walletAmount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
