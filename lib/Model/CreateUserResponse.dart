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
    this.userid,
    this.mobile,
    this.walletAmount,
    this.deviceid,
    this.is_visible,
    this.id,
    this.apiToken,
  });

  String userid;
  String mobile;
  String walletAmount;
  String deviceid;
  String is_visible;
  var id;
  String apiToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userid: json["userid"],
        mobile: json["mobile"],
        walletAmount: json["wallet_amount"],
        deviceid: json["deviceid"],
        is_visible: json["is_visible"],
        id: json["id"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "mobile": mobile,
        "wallet_amount": walletAmount,
        "deviceid": deviceid,
        "is_visible": is_visible,
        "id": id,
        "api_token": apiToken,
      };
}
