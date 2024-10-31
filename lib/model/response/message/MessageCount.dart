import 'dart:convert';
List<MessageCount> messageCountFromJson(String str) => List<MessageCount>.from(json.decode(str).map((x) => MessageCount.fromJson(x)));
String messageCountToJson(List<MessageCount> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageCount {
  int? cantidad;

  MessageCount({
    this.cantidad,
  });

  factory MessageCount.fromJson(Map<String, dynamic> json) => MessageCount(
    cantidad: json["Cantidad"],
  );

  Map<String, dynamic> toJson() => {
    "Cantidad": cantidad,
  };
}
