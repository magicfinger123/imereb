// To parse this JSON data, do
//
//     final agendaDetailRequest = agendaDetailRequestFromJson(jsonString);

import 'dart:convert';

AgendaDetailRequest agendaDetailRequestFromJson(String str) => AgendaDetailRequest.fromJson(json.decode(str));

String agendaDetailRequestToJson(AgendaDetailRequest data) => json.encode(data.toJson());

class AgendaDetailRequest {
  String idColegio;
  String ano;
  DateTime currentDate;
  String cedula;

  AgendaDetailRequest({
    required this.idColegio,
    required this.ano,
    required this.currentDate,
    required this.cedula,
  });

  factory AgendaDetailRequest.fromJson(Map<String, dynamic> json) => AgendaDetailRequest(
    idColegio: json["idColegio"],
    ano: json["Ano"],
    currentDate: DateTime.parse(json["currentDate"]),
    cedula: json["Cedula"],
  );

  Map<String, dynamic> toJson() => {
    "idColegio": idColegio,
    "Ano": ano,
    "currentDate": "${currentDate.year.toString().padLeft(4, '0')}-${currentDate.day.toString().padLeft(2, '0')}-${currentDate.month.toString().padLeft(2, '0')}",
    "Cedula": cedula,
  };
}
