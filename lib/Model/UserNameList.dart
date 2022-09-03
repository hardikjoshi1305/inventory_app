// To parse this JSON data, do
//
//     final userNameResponse = userNameResponseFromJson(jsonString);

import 'dart:convert';

UserNameResponse userNameResponseFromJson(String str) =>
    UserNameResponse.fromJson(json.decode(str));

String userNameResponseToJson(UserNameResponse data) =>
    json.encode(data.toJson());

class UserNameResponse {
  UserNameResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory UserNameResponse.fromJson(Map<String, dynamic> json) =>
      UserNameResponse(
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
    this.userid,
    this.wallet_amount,
  });

  int id;
  var userid;
  String wallet_amount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userid: json["UserID"],
        wallet_amount: json["WalletAmount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserID": userid,
        "WalletAmount": wallet_amount,
      };
}
