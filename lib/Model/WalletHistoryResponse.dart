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
    this.tourId,
    this.expensesName,
    this.amount,
    this.photo,
    this.isApproved,
    this.tourname,
    this.errorname,
    this.city,
    this.iscompleted,
    this.userid,
    this.mobile,
    this.apiToken,
    this.password,
    this.type,
    this.isActive,
    this.deviceid,
    this.walletAmount,
  });

  int id;
  int userId;
  int expenseId;
  String creditAmount;
  String debitAmount;
  int walletBalance;
  DateTime createdAt;
  int tourId;
  String expensesName;
  String amount;
  String photo;
  String isApproved;
  String tourname;
  String errorname;
  String city;
  String iscompleted;
  String userid;
  String mobile;
  String apiToken;
  String password;
  String type;
  String isActive;
  String deviceid;
  String walletAmount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        expenseId: json["expense_id"] == null ? null : json["expense_id"],
        creditAmount:
            json["credit_amount"] == null ? null : json["credit_amount"],
        debitAmount: json["debit_amount"] == null ? null : json["debit_amount"],
        walletBalance: json["wallet_balance"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        tourId: json["tour_id"] == null ? null : json["tour_id"],
        expensesName:
            json["expenses_name"] == null ? null : json["expenses_name"],
        amount: json["amount"] == null ? null : json["amount"],
        photo: json["photo"] == null ? null : json["photo"],
        isApproved: json["is_approved"] == null ? null : json["is_approved"],
        tourname: json["tourname"] == null ? null : json["tourname"],
        errorname: json["errorname"] == null ? null : json["errorname"],
        city: json["city"] == null ? null : json["city"],
        iscompleted: json["iscompleted"] == null ? null : json["iscompleted"],
        userid: json["userid"],
        mobile: json["mobile"],
        apiToken: json["api_token"],
        password: json["password"],
        type: json["type"],
        isActive: json["is_active"],
        deviceid: json["deviceid"],
        walletAmount: json["wallet_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId == null ? null : userId,
        "expense_id": expenseId == null ? null : expenseId,
        "credit_amount": creditAmount == null ? null : creditAmount,
        "debit_amount": debitAmount == null ? null : debitAmount,
        "wallet_balance": walletBalance,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "tour_id": tourId == null ? null : tourId,
        "expenses_name": expensesName == null ? null : expensesName,
        "amount": amount == null ? null : amount,
        "photo": photo == null ? null : photo,
        "is_approved": isApproved == null ? null : isApproved,
        "tourname": tourname == null ? null : tourname,
        "errorname": errorname == null ? null : errorname,
        "city": city == null ? null : city,
        "iscompleted": iscompleted == null ? null : iscompleted,
        "userid": userid,
        "mobile": mobile,
        "api_token": apiToken,
        "password": password,
        "type": type,
        "is_active": isActive,
        "deviceid": deviceid,
        "wallet_amount": walletAmount,
      };
}
