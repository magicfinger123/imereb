import 'dart:convert';
List<AgentDetailItem> agentDetailItemFromJson(String str) => List<AgentDetailItem>.from(json.decode(str).map((x) => AgentDetailItem.fromJson(x)));
String agentDetailItemToJson(List<AgentDetailItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgentDetailItem {
  num? diagrupo;
  num? idxAgenda;
  String? instrEval;
  String? sugeEstu;
  String? tipoactividad;
  String? dia;
  num? diaN;
  num? fecha;
  String? idprofesor;
  String? nombre;
  String? grupo;
  String? codmat;
  String? nommat;
  String? actividad;
  String? contenido;
  String? tipo;
  String? actualizado;

  AgentDetailItem({
    this.diagrupo,
    this.idxAgenda,
    this.instrEval,
    this.sugeEstu,
    this.tipoactividad,
    this.dia,
    this.diaN,
    this.fecha,
    this.idprofesor,
    this.nombre,
    this.grupo,
    this.codmat,
    this.nommat,
    this.actividad,
    this.contenido,
    this.tipo,
    this.actualizado,
  });

  factory AgentDetailItem.fromJson(Map<String, dynamic> json) => AgentDetailItem(
    diagrupo: json["diagrupo"],
    idxAgenda: json["idxAgenda"],
    instrEval: json["instr_eval"],
    sugeEstu: json["suge_estu"],
    tipoactividad: json["tipoactividad"],
    dia: json["dia"],
    diaN: json["dia_n"],
    fecha: json["fecha"],
    idprofesor: json["idprofesor"],
    nombre: json["nombre"],
    grupo: json["grupo"],
    codmat: json["codmat"],
    nommat: json["nommat"],
    actividad: json["actividad"],
    contenido: json["contenido"],
    tipo: json["tipo"],
    actualizado: json["actualizado"],
  );

  Map<String, dynamic> toJson() => {
    "diagrupo": diagrupo,
    "idxAgenda": idxAgenda,
    "instr_eval": instrEval,
    "suge_estu": sugeEstu,
    "tipoactividad": tipoactividad,
    "dia": dia,
    "dia_n": diaN,
    "fecha": fecha,
    "idprofesor": idprofesor,
    "nombre": nombre,
    "grupo": grupo,
    "codmat": codmat,
    "nommat": nommat,
    "actividad": actividad,
    "contenido": contenido,
    "tipo": tipo,
    "actualizado": actualizado,
  };
}
