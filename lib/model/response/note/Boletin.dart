// To parse this JSON data, do
//
//     final boletin = boletinFromJson(jsonString);

import 'dart:convert';

List<Boletin> boletinFromJson(String str) => List<Boletin>.from(json.decode(str).map((x) => Boletin.fromJson(x)));

String boletinToJson(List<Boletin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Boletin {
  int? idcolegio;
  int? ano;
  String? codest;
  String? codplan;
  String? codmat;
  String? nommat;
  dynamic i;
  dynamic ii;
  dynamic iii;
  dynamic iv;
  String? pf;
  String? codigo;
  String? comentario;
  String? iAt;
  String? iiAt;
  String? iiiAt;
  String? ivAt;

  Boletin({
    this.idcolegio,
    this.ano,
    this.codest,
    this.codplan,
    this.codmat,
    this.nommat,
    this.i,
    this.ii,
    this.iii,
    this.iv,
    this.pf,
    this.codigo,
    this.comentario,
    this.iAt,
    this.iiAt,
    this.iiiAt,
    this.ivAt,
  });

  factory Boletin.fromJson(Map<String, dynamic> json) => Boletin(
    idcolegio: json["idcolegio"],
    ano: json["ano"],
    codest: json["codest"],
    codplan: json["codplan"],
    codmat: json["codmat"],
    nommat: json["nommat"],
    i: json["I"],
    ii: json["II"],
    iii: json["III"],
    iv: json["IV"],
    pf: json["PF"],
    codigo: json["codigo"],
    comentario: json["comentario"],
    iAt: json["I_AT"],
    iiAt: json["II_AT"],
    iiiAt: json["III_AT"],
    ivAt: json["IV_AT"],
  );

  Map<String, dynamic> toJson() => {
    "idcolegio": idcolegio,
    "ano": ano,
    "codest": codest,
    "codplan": codplan,
    "codmat": codmat,
    "nommat": nommat,
    "I": i,
    "II": ii,
    "III": iii,
    "IV": iv,
    "PF": pf,
    "codigo": codigo,
    "comentario": comentario,
    "I_AT": iAt,
    "II_AT": iiAt,
    "III_AT": iiiAt,
    "IV_AT": ivAt,
  };

  String getPromedio(String value){
    switch (value) {
      case "1":
        return i.toString();
      case "2":
        return ii.toString();
      case "3":
        return iii.toString();
      case "4":
        return iv.toString();
    }
    return "";
  }
}
