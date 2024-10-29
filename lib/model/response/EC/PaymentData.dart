import 'dart:convert';

List<PaymentData> paymentDataFromJson(String str) => List<PaymentData>.from(json.decode(str).map((x) => PaymentData.fromJson(x)));

String paymentDataToJson(List<PaymentData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentData {
  DateTime? date;
  String? description;
  num? debito;
  num? credit;
  num? balance;

  PaymentData({
    this.date,
    this.description,
    this.debito,
    this.credit,
    this.balance,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
    date: json["DATE"] == null ? null : DateTime.parse(json["DATE"]),
    description: json["DESCRIPTION"],
    debito: json["DEBITO"],
    credit: json["CREDIT"],
    balance: json["BALANCE"],
  );

  Map<String, dynamic> toJson() => {
    "DATE": date?.toIso8601String(),
    "DESCRIPTION": description,
    "DEBITO": debito,
    "CREDIT": credit,
    "BALANCE": balance,
  };
}
