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


MessageRequest messageRequestFromJson(String str) => MessageRequest.fromJson(json.decode(str));

String messageRequestToJson(MessageRequest data) => json.encode(data.toJson());

class MessageRequest {
  String? idxMensaje;
  String? idxMaestro;

  MessageRequest({
    this.idxMensaje,
    this.idxMaestro,
  });

  factory MessageRequest.fromJson(Map<String, dynamic> json) => MessageRequest(
    idxMensaje: json["idxMensaje"],
    idxMaestro: json["idxMaestro"],
  );

  Map<String, dynamic> toJson() => {
    "idxMensaje": idxMensaje,
    "idxMaestro": idxMaestro,
  };
}


MessageReadRequest messageReadRequestFromJson(String str) => MessageReadRequest.fromJson(json.decode(str));

String messageReadRequestToJson(MessageReadRequest data) => json.encode(data.toJson());

class MessageReadRequest {
  int? idMensaje;
  int? idxMaestro;
  String? tipoMaestro;

  MessageReadRequest({
    this.idMensaje,
    this.idxMaestro,
    this.tipoMaestro,
  });

  factory MessageReadRequest.fromJson(Map<String, dynamic> json) => MessageReadRequest(
    idMensaje: json["idMensaje"],
    idxMaestro: json["idxMaestro"],
    tipoMaestro: json["tipoMaestro"],
  );

  Map<String, dynamic> toJson() => {
    "idMensaje": idMensaje,
    "idxMaestro": idxMaestro,
    "tipoMaestro": tipoMaestro,
  };
}
