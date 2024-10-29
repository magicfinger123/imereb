import 'dart:convert';
List<Notas> notasFromJson(String str) => List<Notas>.from(json.decode(str).map((x) => Notas.fromJson(x)));

String notasToJson(List<Notas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notas {
  int? ordenmat;
  String? codmat;
  String? materia;
  Notas({
    this.ordenmat,
    this.codmat,
    this.materia,
  });
  factory Notas.fromJson(Map<String, dynamic> json) => Notas(
    ordenmat: json["ordenmat"],
    codmat: json["codmat"],
    materia: json["materia"],
  );
  Map<String, dynamic> toJson() => {
    "ordenmat": ordenmat,
    "codmat": codmat,
    "materia": materia,
  };
}
