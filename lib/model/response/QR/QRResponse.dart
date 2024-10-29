
import 'dart:convert';
import 'package:flutter/material.dart';

List<Qr> qrFromJson(String str) => List<Qr>.from(json.decode(str).map((x) => Qr.fromJson(x)));

String qrToJson(List<Qr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Qr {
  int? idxEstudiante;
  String? nombre1;
  String? nombre2;
  String? apellido1;
  String? apellido2;
  String? cedula;
  String? grupo;
  String? nombre;
  String? codigoBase64;

  Qr({
    this.idxEstudiante,
    this.nombre1,
    this.nombre2,
    this.apellido1,
    this.apellido2,
    this.cedula,
    this.grupo,
    this.nombre,
    this.codigoBase64,
  });

  factory Qr.fromJson(Map<String, dynamic> json) => Qr(
    idxEstudiante: json["idxEstudiante"],
    nombre1: json["nombre1"],
    nombre2: json["nombre2"],
    apellido1: json["apellido1"],
    apellido2: json["apellido2"],
    cedula: json["Cedula"],
    grupo: json["Grupo"],
    nombre: json["Nombre"],
    codigoBase64: json["CodigoBase64"],
  );

  Map<String, dynamic> toJson() => {
    "idxEstudiante": idxEstudiante,
    "nombre1": nombre1,
    "nombre2": nombre2,
    "apellido1": apellido1,
    "apellido2": apellido2,
    "Cedula": cedula,
    "Grupo": grupo,
    "Nombre": nombre,
    "CodigoBase64": codigoBase64,
  };

  Image? getQRCodeImage() {
    if (codigoBase64 == null){
      return null;
    }
    var base64String =  base64Decode(codigoBase64!);
    return Image.memory(base64String);
  }
}
