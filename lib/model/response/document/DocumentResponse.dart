import 'dart:convert';

List<DocumentItem> documentItemFromJson(String str) => List<DocumentItem>.from(json.decode(str).map((x) => DocumentItem.fromJson(x)));

String documentItemToJson(List<DocumentItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentItem {
  num? idxcontrato;
  num? idcolegio;
  num? ano;
  String? codest;
  num? tipo;
  String? documentoHtml;
  String? descripcion;
  String? urldir;
  bool? sololectura;

  DocumentItem({
    this.idxcontrato,
    this.idcolegio,
    this.ano,
    this.codest,
    this.tipo,
    this.documentoHtml,
    this.descripcion,
    this.urldir,
    this.sololectura,
  });

  factory DocumentItem.fromJson(Map<String, dynamic> json) => DocumentItem(
    idxcontrato: json["idxcontrato"],
    idcolegio: json["idcolegio"],
    ano: json["ano"],
    codest: json["codest"],
    tipo: json["tipo"],
    documentoHtml: json["documentoHtml"],
    descripcion: json["Descripcion"],
    urldir: json["urldir"],
    sololectura: json["sololectura"],
  );

  Map<String, dynamic> toJson() => {
    "idxcontrato": idxcontrato,
    "idcolegio": idcolegio,
    "ano": ano,
    "codest": codest,
    "tipo": tipo,
    "documentoHtml": documentoHtml,
    "Descripcion": descripcion,
    "urldir": urldir,
    "sololectura": sololectura,
  };
}
