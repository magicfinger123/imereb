import 'dart:convert';
GeneralRequest generalRequestFromJson(String str) => GeneralRequest.fromJson(json.decode(str));
String generalRequestToJson(GeneralRequest data) => json.encode(data.toJson());

class GeneralRequest {
  int? idColegio;
  int? idioma;
  String? cedula;
  int? idxestudiante;
  GeneralRequest({
    this.idColegio,
    this.idioma,
    this.cedula,
    this.idxestudiante,
  });
  factory GeneralRequest.fromJson(Map<String, dynamic> json) => GeneralRequest(
    idColegio: json["idColegio"],
    idioma: json["idioma"],
    cedula: json["cedula"],
    idxestudiante: json["idxestudiante"],
  );
  Map<String, dynamic> toJson() => {
    "idColegio": idColegio,
    "idioma": idioma,
    "cedula": cedula,
    "idxestudiante": idxestudiante,
  };
}
