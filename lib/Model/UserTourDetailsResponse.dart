// To parse this JSON data, do
//
//     final userTourDetailsResponse = userTourDetailsResponseFromJson(jsonString);

import 'dart:convert';

UserTourDetailsResponse userTourDetailsResponseFromJson(String str) =>
    UserTourDetailsResponse.fromJson(json.decode(str));

String userTourDetailsResponseToJson(UserTourDetailsResponse data) =>
    json.encode(data.toJson());

class UserTourDetailsResponse {
  UserTourDetailsResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory UserTourDetailsResponse.fromJson(Map<String, dynamic> json) =>
      UserTourDetailsResponse(
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
    this.dailyremark,
    this.servicereport,
    this.finaldignose,
  });

  List<Dailyremark> dailyremark;
  List<Servicereport> servicereport;
  List<Finaldignose> finaldignose;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dailyremark: List<Dailyremark>.from(
            json["dailyremark"].map((x) => Dailyremark.fromJson(x))),
        servicereport: List<Servicereport>.from(
            json["servicereport"].map((x) => Servicereport.fromJson(x))),
        finaldignose: List<Finaldignose>.from(
            json["finaldignose"].map((x) => Finaldignose.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dailyremark": List<dynamic>.from(dailyremark.map((x) => x.toJson())),
        "servicereport":
            List<dynamic>.from(servicereport.map((x) => x.toJson())),
        "finaldignose": List<dynamic>.from(finaldignose.map((x) => x.toJson())),
      };
}

class Dailyremark {
  Dailyremark({
    this.dailyremark,
    this.createdAt,
  });

  String dailyremark;
  DateTime createdAt;

  factory Dailyremark.fromJson(Map<String, dynamic> json) => Dailyremark(
        dailyremark: json["DailyRemark"],
        createdAt: DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "DailyRemark": dailyremark,
        "CreatedAt": createdAt.toIso8601String(),
      };
}

class Finaldignose {
  Finaldignose({
    this.finalDignose,
    this.createdAt,
  });

  String finalDignose;
  DateTime createdAt;

  factory Finaldignose.fromJson(Map<String, dynamic> json) => Finaldignose(
        finalDignose: json["FinalDignose"],
        createdAt: DateTime.parse(json["CreatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "FinalDignose": finalDignose,
        "CreatedAt": createdAt.toIso8601String(),
      };
}

class Servicereport {
  Servicereport({
    this.serviceReport,
  });

  String serviceReport;

  factory Servicereport.fromJson(Map<String, dynamic> json) => Servicereport(
        serviceReport: json["ServiceReport"],
      );

  Map<String, dynamic> toJson() => {
        "ServiceReport": serviceReport,
      };
}
