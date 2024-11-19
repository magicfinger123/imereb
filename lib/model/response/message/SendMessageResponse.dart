
import 'dart:convert';
SendMessageResponse sendMessageResponseFromJson(String str) => SendMessageResponse.fromJson(json.decode(str));
String sendMessageResponseToJson(SendMessageResponse data) => json.encode(data.toJson());

class SendMessageResponse {
  String? idxMensaje;
  String? flag;
  String? msg;

  SendMessageResponse({
    this.idxMensaje,
    this.flag,
    this.msg,
  });

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) => SendMessageResponse(
    idxMensaje: json["idxMensaje"],
    flag: json["flag"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "idxMensaje": idxMensaje,
    "flag": flag,
    "msg": msg,
  };
}
