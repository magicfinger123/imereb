// To parse this JSON data, do
//
//     final agendaItem = agendaItemFromJson(jsonString);

import 'dart:convert';

List<AgendaItem> agendaItemFromJson(String str) => List<AgendaItem>.from(json.decode(str).map((x) => AgendaItem.fromJson(x)));

String agendaItemToJson(List<AgendaItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgendaItem {
  num? idactividad;
  DateTime? fecha;
  num? idxagendatipoact;
  String? tipo;
  String? codmat;
  String? titulo;
  String? actividad;
  num? pbim;
  String? color;
  String? tipoactividad;

  AgendaItem({
    this.idactividad,
    this.fecha,
    this.idxagendatipoact,
    this.tipo,
    this.codmat,
    this.titulo,
    this.actividad,
    this.pbim,
    this.color,
    this.tipoactividad,
  });

  factory AgendaItem.fromJson(Map<String, dynamic> json) => AgendaItem(
    idactividad: json["idactividad"],
    fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
    idxagendatipoact: json["idxagendatipoact"],
    tipo: json["tipo"],
    codmat: json["codmat"],
    titulo: json["titulo"],
    actividad: json["actividad"],
    pbim: json["pbim"],
    color: json["color"],
    tipoactividad: json["tipoactividad"],
  );

  Map<String, dynamic> toJson() => {
    "idactividad": idactividad,
    "fecha": fecha?.toIso8601String(),
    "idxagendatipoact": idxagendatipoact,
    "tipo": tipo,
    "codmat": codmat,
    "titulo": titulo,
    "actividad": actividad,
    "pbim": pbim,
    "color": color,
    "tipoactividad": tipoactividad,
  };
}
