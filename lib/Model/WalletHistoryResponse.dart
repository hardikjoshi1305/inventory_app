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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        expenseId: json["expense_id"] == null ? null : json["expense_id"],
        creditAmount:
            json["credit_amount"] == null ? null : json["credit_amount"],
        debitAmount: json["debit_amount"] == null ? null : json["debit_amount"],
        walletBalance: json["wallet_balance"],
        createdAt: DateTime.parse(json["created_at"]),
        expensesName:
            json["expenses_name"] == null ? null : json["expenses_name"],
        amount: json["amount"] == null ? null : json["amount"],
        tourname: json["tourname"] == null ? null : json["tourname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "expense_id": expenseId == null ? null : expenseId,
        "credit_amount": creditAmount == null ? null : creditAmount,
        "debit_amount": debitAmount == null ? null : debitAmount,
        "wallet_balance": walletBalance,
        "created_at": createdAt.toIso8601String(),
        "expenses_name": expensesName == null ? null : expensesName,
        "amount": amount == null ? null : amount,
        "tourname": tourname == null ? null : tourname,
      };
}
