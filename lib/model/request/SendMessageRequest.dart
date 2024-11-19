import 'dart:convert';
SendMessageRequest sendMessageRequestFromJson(String str) => SendMessageRequest.fromJson(json.decode(str));
String sendMessageRequestToJson(SendMessageRequest data) => json.encode(data.toJson());

class SendMessageRequest {
  int idColegio;
  int remidxMaestro;
  String remTipoMaestro;
  String remCedula;
  String remNombre;
  int respondeAidxMsg;
  String desidxMaestro;
  String desNombre;
  String desidxMaestroCc;
  String desNombreCc;
  String asunto;
  String contenido;
  bool urgente;
  String archivo;
  bool adjunto;
  bool importante;
  bool paraApps;
  String background;
  String desidxMaestroCco;
  String desNombreCco;
  String? fileName;
  String? fileSize;
  SendMessageRequest({
    required this.idColegio,
    required this.remidxMaestro,
    required this.remTipoMaestro,
    required this.remCedula,
    required this.remNombre,
    required this.respondeAidxMsg,
    required this.desidxMaestro,
    required this.desNombre,
    required this.desidxMaestroCc,
    required this.desNombreCc,
    required this.asunto,
    required this.contenido,
    required this.urgente,
    required this.archivo,
    required this.adjunto,
    required this.importante,
    required this.paraApps,
    required this.background,
    required this.desidxMaestroCco,
    required this.desNombreCco,
     this.fileName,
     this.fileSize,
  });
  factory SendMessageRequest.fromJson(Map<String, dynamic> json) => SendMessageRequest(
    idColegio: json["idColegio"],
    remidxMaestro: json["remidxMaestro"],
    remTipoMaestro: json["remTipoMaestro"],
    remCedula: json["remCedula"],
    remNombre: json["remNombre"],
    respondeAidxMsg: json["respondeAidxMsg"],
    desidxMaestro: json["desidxMaestro"],
    desNombre: json["desNombre"],
    desidxMaestroCc: json["desidxMaestroCC"],
    desNombreCc: json["desNombreCC"],
    asunto: json["asunto"],
    contenido: json["contenido"],
    urgente: json["urgente"],
    archivo: json["archivo"],
    adjunto: json["adjunto"],
    importante: json["importante"],
    paraApps: json["paraApps"],
    background: json["background"],
    desidxMaestroCco: json["desidxMaestroCCO"],
    desNombreCco: json["desNombreCCO"],
  );
  Map<String, dynamic> toJson() => {
    "idColegio": idColegio,
    "remidxMaestro": remidxMaestro,
    "remTipoMaestro": remTipoMaestro,
    "remCedula": remCedula,
    "remNombre": remNombre,
    "respondeAidxMsg": respondeAidxMsg,
    "desidxMaestro": desidxMaestro,
    "desNombre": desNombre,
    "desidxMaestroCC": desidxMaestroCc,
    "desNombreCC": desNombreCc,
    "asunto": asunto,
    "contenido": contenido,
    "urgente": urgente,
    "archivo": archivo,
    "adjunto": adjunto,
    "importante": importante,
    "paraApps": paraApps,
    "background": background,
    "desidxMaestroCCO": desidxMaestroCco,
    "desNombreCCO": desNombreCco,
  };
}
