// To parse this JSON data, do
//
//     final walletHistoryResponse = walletHistoryResponseFromJson(jsonString);

import 'dart:convert';

WalletHistoryResponse walletHistoryResponseFromJson(String str) =>
    WalletHistoryResponse.fromJson(json.decode(str));

String walletHistoryResponseToJson(WalletHistoryResponse data) =>
    json.encode(data.toJson());

class WalletHistoryResponse {
  WalletHistoryResponse({
    this.data,
    this.succes,
    this.message,
  });

  List<Datum> data;
  bool succes;
  String message;

  factory WalletHistoryResponse.fromJson(Map<String, dynamic> json) =>
      WalletHistoryResponse(
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
    this.userId,
    this.expenseId,
    this.creditAmount,
    this.debitAmount,
    this.walletBalance,
    this.createdAt,
    this.expensesName,
    this.amount,
    this.tourname,
    this.photo,
    this.is_approved,
  });

  var id;
  var userId;
  var expenseId;
  String creditAmount;
  String debitAmount;
  var walletBalance;
  DateTime createdAt;
  String expensesName;
  String amount;
  String tourname;
  var photo;
  var is_approved;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["UserId"],
        expenseId: json["ExpId"] == null ? null : json["ExpId"],
        creditAmount:
            json["CreditAmount"] == null ? null : json["CreditAmount"],
        debitAmount: json["DebitAmount"] == null ? null : json["DebitAmount"],
        walletBalance: json["WalletBalance"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        expensesName: json["ExpName"] == null ? null : json["ExpName"],
        amount: json["Amount"] == null ? null : json["Amount"],
        tourname: json["TourName"] == null ? null : json["TourName"],
        photo: json["Photo"] == null ? null : json["Photo"],
        is_approved: json["IsApproved"] == null ? null : json["IsApproved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "UserId": userId,
        "ExpId": expenseId == null ? null : expenseId,
        "CreditAmount": creditAmount == null ? null : creditAmount,
        "DebitAmount": debitAmount == null ? null : debitAmount,
        "WalletBalance": walletBalance,
        "CreatedAt": createdAt.toIso8601String(),
        "ExpName": expensesName == null ? null : expensesName,
        "Amount": amount == null ? null : amount,
        "TourName": tourname == null ? null : tourname,
        "Photo": photo == null ? null : photo,
        "IsApproved": is_approved == null ? null : is_approved,
      };
}
