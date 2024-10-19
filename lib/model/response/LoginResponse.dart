// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'family.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? usuario;
  String? password;
  String? token;
  String? cedula;
  String? nombre;
  String? tipoMaestro;
  int? ano;
  int? periodo;
  int? idColegio;
  String? colegio;
  int? bloqueado;
  String? aviso;
  int? periodoPre;
  int? nivel;
  int? grupoUsuario;
  int? cambiarpass;
  int? idioma;
  int? idxMaestro;
  String? codFamilia;
  int? produccion;
  List<FamilyMember>? familyMembers;
  List<String>? familyOptions;
  List<Contacto>? contactos;
  dynamic permisos;
  int? loginXFamilia;
  String? imagenUrl;
  String? tokenapp;

  LoginResponse({
    this.usuario,
    this.password,
    this.token,
    this.cedula,
    this.nombre,
    this.tipoMaestro,
    this.ano,
    this.periodo,
    this.idColegio,
    this.colegio,
    this.bloqueado,
    this.aviso,
    this.periodoPre,
    this.nivel,
    this.grupoUsuario,
    this.cambiarpass,
    this.idioma,
    this.idxMaestro,
    this.codFamilia,
    this.produccion,
    this.familyMembers,
    this.familyOptions,
    this.contactos,
    this.permisos,
    this.loginXFamilia,
    this.imagenUrl,
    this.tokenapp,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    usuario: json["Usuario"],
    password: json["Password"],
    token: json["Token"],
    cedula: json["Cedula"],
    nombre: json["Nombre"],
    tipoMaestro: json["TipoMaestro"],
    ano: json["Ano"],
    periodo: json["Periodo"],
    idColegio: json["idColegio"],
    colegio: json["Colegio"],
    bloqueado: json["Bloqueado"],
    aviso: json["Aviso"],
    periodoPre: json["Periodo_pre"],
    nivel: json["Nivel"],
    grupoUsuario: json["GrupoUsuario"],
    cambiarpass: json["Cambiarpass"],
    idioma: json["Idioma"],
    idxMaestro: json["IdxMaestro"],
    codFamilia: json["CodFamilia"],
    produccion: json["Produccion"],
    familyMembers: json["FamilyMembers"] == null ? [] : List<FamilyMember>.from(json["FamilyMembers"]!.map((x) => FamilyMember.fromJson(x))),
    familyOptions: json["FamilyOptions"] == null ? [] : List<String>.from(json["FamilyOptions"]!.map((x) => x)),
    contactos: json["Contactos"] == null ? [] : List<Contacto>.from(json["Contactos"]!.map((x) => Contacto.fromJson(x))),
    permisos: json["Permisos"],
    loginXFamilia: json["LoginXFamilia"],
    imagenUrl: json["imagenUrl"],
    tokenapp: json["tokenapp"],
  );

  Map<String, dynamic> toJson() => {
    "Usuario": usuario,
    "Password": password,
    "Token": token,
    "Cedula": cedula,
    "Nombre": nombre,
    "TipoMaestro": tipoMaestro,
    "Ano": ano,
    "Periodo": periodo,
    "idColegio": idColegio,
    "Colegio": colegio,
    "Bloqueado": bloqueado,
    "Aviso": aviso,
    "Periodo_pre": periodoPre,
    "Nivel": nivel,
    "GrupoUsuario": grupoUsuario,
    "Cambiarpass": cambiarpass,
    "Idioma": idioma,
    "IdxMaestro": idxMaestro,
    "CodFamilia": codFamilia,
    "Produccion": produccion,
    "FamilyMembers": familyMembers == null ? [] : List<dynamic>.from(familyMembers!.map((x) => x.toJson())),
    "FamilyOptions": familyOptions == null ? [] : List<dynamic>.from(familyOptions!.map((x) => x)),
    "Contactos": contactos == null ? [] : List<dynamic>.from(contactos!.map((x) => x.toJson())),
    "Permisos": permisos,
    "LoginXFamilia": loginXFamilia,
    "imagenUrl": imagenUrl,
    "tokenapp": tokenapp,
  };
}

class Contacto {
  String? codigoContacto;
  String? nombreContacto;
  GrupoContacto? grupoContacto;
  int? idGrupo;
  String? cargo;

  Contacto({
    this.codigoContacto,
    this.nombreContacto,
    this.grupoContacto,
    this.idGrupo,
    this.cargo,
  });

  factory Contacto.fromJson(Map<String, dynamic> json) => Contacto(
    codigoContacto: json["CodigoContacto"],
    nombreContacto: json["NombreContacto"],
    grupoContacto: grupoContactoValues.map[json["GrupoContacto"]]!,
    idGrupo: json["IdGrupo"],
    cargo: json["Cargo"],
  );

  Map<String, dynamic> toJson() => {
    "CodigoContacto": codigoContacto,
    "NombreContacto": nombreContacto,
    "GrupoContacto": grupoContactoValues.reverse[grupoContacto],
    "IdGrupo": idGrupo,
    "Cargo": cargo,
  };
}

enum GrupoContacto {
  DIRECTIVOS,
  OTROS_MIEMBROS,
  SEC_ACADMICA
}

final grupoContactoValues = EnumValues({
  "Directivos": GrupoContacto.DIRECTIVOS,
  "Otros Miembros": GrupoContacto.OTROS_MIEMBROS,
  "Sec. Académica": GrupoContacto.SEC_ACADMICA
});

// class FamilyMember {
//   String? nombreCompleto;
//   String? nombre1;
//   String? nombre2;
//   String? apellido1;
//   String? apellido2;
//   String? cedula;
//   int? anocursa;
//   int? idxEstudiante;
//
//   FamilyMember({
//     this.nombreCompleto,
//     this.nombre1,
//     this.nombre2,
//     this.apellido1,
//     this.apellido2,
//     this.cedula,
//     this.anocursa,
//     this.idxEstudiante,
//   });
//
//   factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
//     nombreCompleto: json["NombreCompleto"],
//     nombre1: json["Nombre1"],
//     nombre2: json["Nombre2"],
//     apellido1: json["Apellido1"],
//     apellido2: json["Apellido2"],
//     cedula: json["Cedula"],
//     anocursa: json["anocursa"],
//     idxEstudiante: json["IdxEstudiante"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "NombreCompleto": nombreCompleto,
//     "Nombre1": nombre1,
//     "Nombre2": nombre2,
//     "Apellido1": apellido1,
//     "Apellido2": apellido2,
//     "Cedula": cedula,
//     "anocursa": anocursa,
//     "IdxEstudiante": idxEstudiante,
//   };
// }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
