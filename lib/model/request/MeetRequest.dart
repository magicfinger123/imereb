// To parse this JSON data, do
//
//     final meetRequest = meetRequestFromJson(jsonString);

import 'dart:convert';

MeetRequest meetRequestFromJson(String str) => MeetRequest.fromJson(json.decode(str));

String meetRequestToJson(MeetRequest data) => json.encode(data.toJson());

class MeetRequest {
  int? idxEstudiante;
  int? idColegio;
  int? mes;
  int? ano;

  MeetRequest({
    this.idxEstudiante,
    this.idColegio,
    this.mes,
    this.ano,
  });

  factory MeetRequest.fromJson(Map<String, dynamic> json) => MeetRequest(
    idxEstudiante: json["idxEstudiante"],
    idColegio: json["IdColegio"],
    mes: json["mes"],
    ano: json["ano"],
  );

  Map<String, dynamic> toJson() => {
    "idxEstudiante": idxEstudiante,
    "IdColegio": idColegio,
    "mes": mes,
    "ano": ano,
  };
}
