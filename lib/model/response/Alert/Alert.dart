import 'dart:convert';
List<StudentAlert> studentAlertFromJson(String str) => List<StudentAlert>.from(json.decode(str).map((x) => StudentAlert.fromJson(x)));
String studentAlertToJson(List<StudentAlert> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentAlert {
  num? idxAlertaContenido;
  num? idxMaestro;
  num? idColegio;
  String? medio;
  num? codAlerta;
  String? asunto;
  String? contenido;
  DateTime? fechaCreacion;
  bool? enviada;
  DateTime? fechaEnvio;
  bool? isFree;
  String? tipomaestro;
  num? leida;
  DateTime? fechaleido;

  StudentAlert({
    this.idxAlertaContenido,
    this.idxMaestro,
    this.idColegio,
    this.medio,
    this.codAlerta,
    this.asunto,
    this.contenido,
    this.fechaCreacion,
    this.enviada,
    this.fechaEnvio,
    this.isFree,
    this.tipomaestro,
    this.leida,
    this.fechaleido,
  });

  factory StudentAlert.fromJson(Map<String, dynamic> json) => StudentAlert(
    idxAlertaContenido: json["idxAlertaContenido"],
    idxMaestro: json["IdxMaestro"],
    idColegio: json["idColegio"],
    medio: json["Medio"],
    codAlerta: json["CodAlerta"],
    asunto: json["Asunto"],
    contenido: json["Contenido"],
    fechaCreacion: json["FechaCreacion"] == null ? null : DateTime.parse(json["FechaCreacion"]),
    enviada: json["Enviada"],
    fechaEnvio: json["FechaEnvio"] == null ? null : DateTime.parse(json["FechaEnvio"]),
    isFree: json["isFree"],
    tipomaestro: json["tipomaestro"],
    leida: json["Leida"],
    fechaleido: json["fechaleido"] == null ? null : DateTime.parse(json["fechaleido"]),
  );

  Map<String, dynamic> toJson() => {
    "idxAlertaContenido": idxAlertaContenido,
    "IdxMaestro": idxMaestro,
    "idColegio": idColegio,
    "Medio": medio,
    "CodAlerta": codAlerta,
    "Asunto": asunto,
    "Contenido": contenido,
    "FechaCreacion": fechaCreacion?.toIso8601String(),
    "Enviada": enviada,
    "FechaEnvio": fechaEnvio?.toIso8601String(),
    "isFree": isFree,
    "tipomaestro": tipomaestro,
    "Leida": leida,
    "fechaleido": fechaleido?.toIso8601String(),
  };
}
