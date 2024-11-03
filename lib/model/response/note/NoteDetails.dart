// To parse this JSON data, do
//
//     final noteDetails = noteDetailsFromJson(jsonString);

import 'dart:convert';

List<NoteDetails> noteDetailsFromJson(String str) => List<NoteDetails>.from(json.decode(str).map((x) => NoteDetails.fromJson(x)));

String noteDetailsToJson(List<NoteDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoteDetails {
  num? idmatricula;
  num? idevaluacion;
  num? identificador;
  String? profesor;
  String? codmat;
  num? porcentaje;
  String? item;
  String? calificacion;
  String? anunciada;
  String? faltan;
  num? registrada;
  num? bloquear;
  num? editable;
  String? n1;

  NoteDetails({
    this.idmatricula,
    this.idevaluacion,
    this.identificador,
    this.profesor,
    this.codmat,
    this.porcentaje,
    this.item,
    this.calificacion,
    this.anunciada,
    this.faltan,
    this.registrada,
    this.bloquear,
    this.editable,
    this.n1,
  });

  factory NoteDetails.fromJson(Map<String, dynamic> json) => NoteDetails(
    idmatricula: json["idmatricula"],
    idevaluacion: json["idevaluacion"],
    identificador: json["identificador"],
    profesor: json["profesor"],
    codmat: json["codmat"],
    porcentaje: json["porcentaje"],
    item: json["item"],
    calificacion: json["calificacion"],
    anunciada: json["anunciada"],
    faltan: json["faltan"],
    registrada: json["registrada"],
    bloquear: json["bloquear"],
    editable: json["editable"],
    n1: json["n1"],
  );

  Map<String, dynamic> toJson() => {
    "idmatricula": idmatricula,
    "idevaluacion": idevaluacion,
    "identificador": identificador,
    "profesor": profesor,
    "codmat": codmat,
    "porcentaje": porcentaje,
    "item": item,
    "calificacion": calificacion,
    "anunciada": anunciada,
    "faltan": faltan,
    "registrada": registrada,
    "bloquear": bloquear,
    "editable": editable,
    "n1": n1,
  };
}
