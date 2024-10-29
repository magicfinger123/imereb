
import 'dart:convert';
List<TipResponse> tipResponseFromJson(String str) => List<TipResponse>.from(json.decode(str).map((x) => TipResponse.fromJson(x)));
String tipResponseToJson(List<TipResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipResponse {
  num? idxTips;
  String? tipoMaestro;
  String? imgDir;
  DateTime? fechaInicio;
  DateTime? fechaFin;
  bool? activo;
  String? contenido;
  num? cantMax;
  num? idcolegio;
  String? titulo;
  bool? plantilla;
  num? idxTipsColegio;
  num? idxTips1;
  num? idColegio1;
  TipResponse({
    this.idxTips,
    this.tipoMaestro,
    this.imgDir,
    this.fechaInicio,
    this.fechaFin,
    this.activo,
    this.contenido,
    this.cantMax,
    this.idcolegio,
    this.titulo,
    this.plantilla,
    this.idxTipsColegio,
    this.idxTips1,
    this.idColegio1,
  });
  factory TipResponse.fromJson(Map<String, dynamic> json) => TipResponse(
    idxTips: json["IdxTips"],
    tipoMaestro: json["TipoMaestro"],
    imgDir: json["ImgDir"],
    fechaInicio: json["FechaInicio"] == null ? null : DateTime.parse(json["FechaInicio"]),
    fechaFin: json["FechaFin"] == null ? null : DateTime.parse(json["FechaFin"]),
    activo: json["Activo"],
    contenido: json["Contenido"],
    cantMax: json["CantMax"],
    idcolegio: json["Idcolegio"],
    titulo: json["titulo"],
    plantilla: json["plantilla"],
    idxTipsColegio: json["IdxTipsColegio"],
    idxTips1: json["IdxTips1"],
    idColegio1: json["IdColegio1"],
  );
  Map<String, dynamic> toJson() => {
    "IdxTips": idxTips,
    "TipoMaestro": tipoMaestro,
    "ImgDir": imgDir,
    "FechaInicio": fechaInicio?.toIso8601String(),
    "FechaFin": fechaFin?.toIso8601String(),
    "Activo": activo,
    "Contenido": contenido,
    "CantMax": cantMax,
    "Idcolegio": idcolegio,
    "titulo": titulo,
    "plantilla": plantilla,
    "IdxTipsColegio": idxTipsColegio,
    "IdxTips1": idxTips1,
    "IdColegio1": idColegio1,
  };
}
