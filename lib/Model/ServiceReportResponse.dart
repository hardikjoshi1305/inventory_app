// To parse this JSON data, do
//
//     final serviceReportResponse = serviceReportResponseFromJson(jsonString);

import 'dart:convert';

ServiceReportResponse serviceReportResponseFromJson(String str) =>
    ServiceReportResponse.fromJson(json.decode(str));

String serviceReportResponseToJson(ServiceReportResponse data) =>
    json.encode(data.toJson());

class ServiceReportResponse {
  ServiceReportResponse({
    this.data,
    this.succes,
    this.message,
  });

  Data data;
  bool succes;
  String message;

  factory ServiceReportResponse.fromJson(Map<String, dynamic> json) =>
      ServiceReportResponse(
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
    this.serviceReport,
    this.id,
  });

  var tourId;
  String serviceReport;
  var id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tourId: json["tour_id"],
        serviceReport: json["service_report"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "tour_id": tourId,
        "service_report": serviceReport,
        "id": id,
      };
}
