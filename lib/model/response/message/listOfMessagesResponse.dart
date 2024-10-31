// To parse this JSON data, do
//
//     final messages = messagesFromJson(jsonString);

import 'dart:convert';

List<Messages> messagesFromJson(String str) => List<Messages>.from(json.decode(str).map((x) => Messages.fromJson(x)));

String messagesToJson(List<Messages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Messages {
  double? idmensaje;
  String? remitenteCedula;
  String? remitenteTipo;
  String? remitenteNombre;
  DateTime? fechaenvio;
  DateTime? f;
  String? asunto;
  String? estado;

  Messages({
    this.idmensaje,
    this.remitenteCedula,
    this.remitenteTipo,
    this.remitenteNombre,
    this.fechaenvio,
    this.f,
    this.asunto,
    this.estado,
  });

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
    idmensaje: json["idmensaje"] ?? json["idxMensaje"] ,
    remitenteCedula: json["REMITENTE_CEDULA"],
    remitenteTipo: json["REMITENTE_TIPO"],
    remitenteNombre: json["REMITENTE_NOMBRE"] ?? json["RemNombre"],
    fechaenvio: json["FECHAENVIO"] != null ? DateTime.parse(json["FECHAENVIO"]) : json["FechaEnvio"] != null ? DateTime.parse(json["FechaEnvio"]) : null,
    f: json["F"] == null ? null : DateTime.parse(json["F"]),
    asunto: json["asunto"] ?? json["Asunto"] ,
    estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
    "idmensaje": idmensaje,
    "REMITENTE_CEDULA": remitenteCedula,
    "REMITENTE_TIPO": remitenteTipo,
    "REMITENTE_NOMBRE": remitenteNombre,
    "FECHAENVIO": fechaenvio?.toIso8601String(),
    "F": f?.toIso8601String(),
    "asunto": asunto,
    "estado": estado,
  };


}