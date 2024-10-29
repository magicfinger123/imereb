import 'dart:convert';
AgendaListRequest agendaListRequestFromJson(String str) => AgendaListRequest.fromJson(json.decode(str));
String agendaListRequestToJson(AgendaListRequest data) => json.encode(data.toJson());

class AgendaListRequest {
  String idcolegio;
  String ano;
  String cedula;
  String bimestre;
  DateTime fechaI;
  DateTime fechaF;

  AgendaListRequest({
    required this.idcolegio,
    required this.ano,
    required this.cedula,
    required this.bimestre,
    required this.fechaI,
    required this.fechaF,
  });

  factory AgendaListRequest.fromJson(Map<String, dynamic> json) => AgendaListRequest(
    idcolegio: json["idcolegio"],
    ano: json["ano"],
    cedula: json["cedula"],
    bimestre: json["bimestre"],
    fechaI: DateTime.parse(json["fechaI"]),
    fechaF: DateTime.parse(json["fechaF"]),
  );

  Map<String, dynamic> toJson() => {
    "idcolegio": idcolegio,
    "ano": ano,
    "cedula": cedula,
    "bimestre": bimestre,
    "fechaI": "${fechaI.year.toString().padLeft(4, '0')}-${fechaI.day.toString().padLeft(2, '0')}-${fechaI.month.toString().padLeft(2, '0')}",
    "fechaF": "${fechaF.year.toString().padLeft(4, '0')}-${fechaF.day.toString().padLeft(2, '0')}-${fechaF.month.toString().padLeft(2, '0')}",
  };
}
