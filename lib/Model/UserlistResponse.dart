// To parse this JSON data, do
//
//     final userlistResponse = userlistResponseFromJson(jsonString);

import 'dart:convert';

UserlistResponse userlistResponseFromJson(String str) => UserlistResponse.fromJson(json.decode(str));

String userlistResponseToJson(UserlistResponse data) => json.encode(data.toJson());

class UserlistResponse {
  UserlistResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory UserlistResponse.fromJson(Map<String, dynamic> json) => UserlistResponse(
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
    this.mobileNumber,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  String apiToken;
  dynamic emailVerifiedAt;
  String type;
  String photo;
  String status;
  String city;
  String walletAmount;
  dynamic mobileNumber;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    apiToken: json["api_token"],
    emailVerifiedAt: json["email_verified_at"],
    type: json["type"],
    photo: json["photo"] == null ? null : json["photo"],
    status: json["status"],
    city: json["city"],
    walletAmount: json["wallet_amount"],
    mobileNumber: json["mobile_number"],
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
    "photo": photo == null ? null : photo,
    "status": status,
    "city": city,
    "wallet_amount": walletAmount,
    "mobile_number": mobileNumber,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
