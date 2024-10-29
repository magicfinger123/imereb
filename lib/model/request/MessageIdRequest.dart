import 'dart:convert';

MessageIdRequest messageIdRequestFromJson(String str) => MessageIdRequest.fromJson(json.decode(str));
String messageIdRequestToJson(MessageIdRequest data) => json.encode(data.toJson());
class MessageIdRequest {
  String idMensaje;
  MessageIdRequest({
    required this.idMensaje,
  });
  factory MessageIdRequest.fromJson(Map<String, dynamic> json) => MessageIdRequest(
    idMensaje: json["idMensaje"],
  );
  Map<String, dynamic> toJson() => {
    "idMensaje": idMensaje,
  };
}
