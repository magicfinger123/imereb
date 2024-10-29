// To parse this JSON data, do
//
//     final messageData = messageDataFromJson(jsonString);

import 'dart:convert';

List<MessageData> messageDataFromJson(String str) => List<MessageData>.from(json.decode(str).map((x) => MessageData.fromJson(x)));

String messageDataToJson(List<MessageData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageData {
  num? idxMensaje;
  num? idColegio;
  num? remidxMaestro;
  String? remTipoMaestro;
  String? remCedula;
  String? remNombre;
  num? respondeAidxMsg;
  String? desidxMaestro;
  String? desNombre;
  String? desidxMaestroCc;
  String? desNombreCc;
  String? asunto;
  String? contenido;
  bool? enviado;
  bool? urgente;
  DateTime? fechaEnvio;
  bool? eliminado;
  bool? vaciado;
  String? archivo;
  bool? paraApps;
  bool? importante;
  bool? adjunto;
  String? backgrount;
  String? desIdxMaestroCco;
  String? desNombreCco;
  num? idxMensajeRedirect;
  num? tipoRpt;

  MessageData({
    this.idxMensaje,
    this.idColegio,
    this.remidxMaestro,
    this.remTipoMaestro,
    this.remCedula,
    this.remNombre,
    this.respondeAidxMsg,
    this.desidxMaestro,
    this.desNombre,
    this.desidxMaestroCc,
    this.desNombreCc,
    this.asunto,
    this.contenido,
    this.enviado,
    this.urgente,
    this.fechaEnvio,
    this.eliminado,
    this.vaciado,
    this.archivo,
    this.paraApps,
    this.importante,
    this.adjunto,
    this.backgrount,
    this.desIdxMaestroCco,
    this.desNombreCco,
    this.idxMensajeRedirect,
    this.tipoRpt,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
    idxMensaje: json["idxMensaje"],
    idColegio: json["idColegio"],
    remidxMaestro: json["RemidxMaestro"],
    remTipoMaestro: json["RemTipoMaestro"],
    remCedula: json["RemCedula"],
    remNombre: json["RemNombre"],
    respondeAidxMsg: json["RespondeAidxMsg"],
    desidxMaestro: json["DesidxMaestro"],
    desNombre: json["DesNombre"],
    desidxMaestroCc: json["DesidxMaestroCC"],
    desNombreCc: json["DesNombreCC"],
    asunto: json["Asunto"],
    contenido: json["Contenido"],
    enviado: json["Enviado"],
    urgente: json["Urgente"],
    fechaEnvio: json["FechaEnvio"] == null ? null : DateTime.parse(json["FechaEnvio"]),
    eliminado: json["Eliminado"],
    vaciado: json["Vaciado"],
    archivo: json["Archivo"],
    paraApps: json["ParaApps"],
    importante: json["importante"],
    adjunto: json["adjunto"],
    backgrount: json["backgrount"],
    desIdxMaestroCco: json["DesIdxMaestroCCO"],
    desNombreCco: json["DesNombreCCO"],
    idxMensajeRedirect: json["IdxMensajeRedirect"],
    tipoRpt: json["tipoRpt"],
  );

  Map<String, dynamic> toJson() => {
    "idxMensaje": idxMensaje,
    "idColegio": idColegio,
    "RemidxMaestro": remidxMaestro,
    "RemTipoMaestro": remTipoMaestro,
    "RemCedula": remCedula,
    "RemNombre": remNombre,
    "RespondeAidxMsg": respondeAidxMsg,
    "DesidxMaestro": desidxMaestro,
    "DesNombre": desNombre,
    "DesidxMaestroCC": desidxMaestroCc,
    "DesNombreCC": desNombreCc,
    "Asunto": asunto,
    "Contenido": contenido,
    "Enviado": enviado,
    "Urgente": urgente,
    "FechaEnvio": fechaEnvio?.toIso8601String(),
    "Eliminado": eliminado,
    "Vaciado": vaciado,
    "Archivo": archivo,
    "ParaApps": paraApps,
    "importante": importante,
    "adjunto": adjunto,
    "backgrount": backgrount,
    "DesIdxMaestroCCO": desIdxMaestroCco,
    "DesNombreCCO": desNombreCco,
    "IdxMensajeRedirect": idxMensajeRedirect,
    "tipoRpt": tipoRpt,
  };
}
