// To parse this JSON data, do
//
//     final documentRequest = documentRequestFromJson(jsonString);

import 'dart:convert';

DocumentRequest documentRequestFromJson(String str) => DocumentRequest.fromJson(json.decode(str));

String documentRequestToJson(DocumentRequest data) => json.encode(data.toJson());

class DocumentRequest {
  String idColegio;
  String cedula;
  String userId;
  String tipoMaestro;

  DocumentRequest({
    required this.idColegio,
    required this.cedula,
    required this.userId,
    required this.tipoMaestro,
  });

  factory DocumentRequest.fromJson(Map<String, dynamic> json) => DocumentRequest(
    idColegio: json["idColegio"],
    cedula: json["cedula"],
    userId: json["userID"],
    tipoMaestro: json["tipoMaestro"],
  );

  Map<String, dynamic> toJson() => {
    "idColegio": idColegio,
    "cedula": cedula,
    "userID": userId,
    "tipoMaestro": tipoMaestro,
  };
}
