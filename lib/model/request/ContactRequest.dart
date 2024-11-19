
import 'dart:convert';
ContactRequest contactRequestFromJson(String str) => ContactRequest.fromJson(json.decode(str));
String contactRequestToJson(ContactRequest data) => json.encode(data.toJson());

class ContactRequest {
  int? idcolegio;
  int? idxMaestro;
  String? tipoMaestro;

  ContactRequest({
    this.idcolegio,
    this.idxMaestro,
    this.tipoMaestro,
  });

  factory ContactRequest.fromJson(Map<String, dynamic> json) => ContactRequest(
    idcolegio: json["idcolegio"],
    idxMaestro: json["idxMaestro"],
    tipoMaestro: json["tipoMaestro"],
  );

  Map<String, dynamic> toJson() => {
    "idcolegio": idcolegio,
    "idxMaestro": idxMaestro,
    "tipoMaestro": tipoMaestro,
  };
}
