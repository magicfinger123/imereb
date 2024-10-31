// To parse this JSON data, do
//
//     final cupon = cuponFromJson(jsonString);

import 'dart:convert';

List<Cupon> cuponFromJson(String str) => List<Cupon>.from(json.decode(str).map((x) => Cupon.fromJson(x)));

String cuponToJson(List<Cupon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cupon {
  int? idCupon;
  int? idTipoCupon;
  int? ordenCupon;
  String? cupon;
  DateTime? fechaInicio;
  DateTime? fechaFin;
  int? activo;

  Cupon({
    this.idCupon,
    this.idTipoCupon,
    this.ordenCupon,
    this.cupon,
    this.fechaInicio,
    this.fechaFin,
    this.activo,
  });

  factory Cupon.fromJson(Map<String, dynamic> json) => Cupon(
    idCupon: json["id_cupon"],
    idTipoCupon: json["id_tipo_cupon"],
    ordenCupon: json["orden_cupon"],
    cupon: json["cupon"],
    fechaInicio: json["fecha_inicio"] == null ? null : DateTime.parse(json["fecha_inicio"]),
    fechaFin: json["fecha_fin"] == null ? null : DateTime.parse(json["fecha_fin"]),
    activo: json["activo"],
  );

  Map<String, dynamic> toJson() => {
    "id_cupon": idCupon,
    "id_tipo_cupon": idTipoCupon,
    "orden_cupon": ordenCupon,
    "cupon": cupon,
    "fecha_inicio": fechaInicio?.toIso8601String(),
    "fecha_fin": fechaFin?.toIso8601String(),
    "activo": activo,
  };
}
