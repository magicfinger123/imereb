import 'dart:convert';

NotasDetailerRequest notasDetailerRequestFromJson(String str) => NotasDetailerRequest.fromJson(json.decode(str));

String notasDetailerRequestToJson(NotasDetailerRequest data) => json.encode(data.toJson());

class NotasDetailerRequest {
  int? ano;
  int? bimestre;
  int? idColegio;
  int?  idioma;
  String? cedula;
  String? codmat;

  NotasDetailerRequest({
     this.ano,
     this.bimestre,
     this.idColegio,
     this.idioma,
     this.cedula,
     this.codmat,
  });

  factory NotasDetailerRequest.fromJson(Map<String, dynamic> json) => NotasDetailerRequest(
    ano: json["ano"],
    bimestre: json["bimestre"],
    idColegio: json["idColegio"],
    idioma: json["idioma"],
    cedula: json["cedula"],
    codmat: json["codmat"],
  );

  Map<String, dynamic> toJson() => {
    "ano": ano,
    "bimestre": bimestre,
    "idColegio": idColegio,
    "idioma": idioma,
    "cedula": cedula,
    "codmat": codmat,
  };
}
