// To parse this JSON data, do
//
//     final loginIndividualResponse = loginIndividualResponseFromJson(jsonString);

import 'dart:convert';

import 'family.dart';

LoginIndividualResponse loginIndividualResponseFromJson(String str) =>
    LoginIndividualResponse.fromJson(json.decode(str));

String loginIndividualResponseToJson(LoginIndividualResponse data) =>
    json.encode(data.toJson());

class LoginIndividualResponse {
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
  List<Permiso>? permisos;
  int? loginXFamilia;
  String? imagenUrl;
  String? tokenapp;

  LoginIndividualResponse({
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

  factory LoginIndividualResponse.fromJson(Map<String, dynamic> json) =>
      LoginIndividualResponse(
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
        familyMembers: json["FamilyMembers"] == null
            ? []
            : List<FamilyMember>.from(json["FamilyMembers"]!
            .map((x) => FamilyMember.fromJson(x))),
        familyOptions: json["FamilyOptions"] == null
            ? []
            : List<String>.from(json["FamilyOptions"]!.map((x) => x)),
        contactos: json["Contactos"] == null
            ? []
            : List<Contacto>.from(json["Contactos"]!.map((x) => Contacto.fromJson(x))),
        permisos: json["Permisos"] == null
            ? []
            : List<Permiso>.from(json["Permisos"]!.map((x) => Permiso.fromJson(x))),
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
    "FamilyMembers": familyMembers == null
        ? []
        : List<dynamic>.from(familyMembers!.map((x) => x.toJson())),
    "FamilyOptions": familyOptions == null
        ? []
        : List<dynamic>.from(familyOptions!.map((x) => x)),
    "Contactos": contactos == null
        ? []
        : List<dynamic>.from(contactos!.map((x) => x.toJson())),
    "Permisos": permisos == null
        ? []
        : List<dynamic>.from(permisos!.map((x) => x.toJson())),
    "LoginXFamilia": loginXFamilia,
    "imagenUrl": imagenUrl,
    "tokenapp": tokenapp,
  };
}

class Contacto {
  String? codigoContacto;
  String? nombreContacto;
  String? grupoContacto;
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
    grupoContacto: json["GrupoContacto"],
    idGrupo: json["IdGrupo"],
    cargo: json["Cargo"],
  );

  Map<String, dynamic> toJson() => {
    "CodigoContacto": codigoContacto,
    "NombreContacto": nombreContacto,
    "GrupoContacto": grupoContacto,
    "IdGrupo": idGrupo,
    "Cargo": cargo,
  };
}

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

class Permiso {
  int? idxusuario;
  int? idcolegio;
  int? idxmaestro;
  String? tipomaestro;
  double? x001;
  double? x002;
  double? x003;
  double? x004;
  double? x005;
  double? x006;
  double? x007;
  double? x008;
  double? x009;
  double? x010;
  double? x011;
  double? x012;
  double? x013;
  double? x014;
  double? x015;
  double? x016;
  double? x017;
  double? x018;
  double? x019;
  double? x020;

  Permiso({
    this.idxusuario,
    this.idcolegio,
    this.idxmaestro,
    this.tipomaestro,
    this.x001,
    this.x002,
    this.x003,
    this.x004,
    this.x005,
    this.x006,
    this.x007,
    this.x008,
    this.x009,
    this.x010,
    this.x011,
    this.x012,
    this.x013,
    this.x014,
    this.x015,
    this.x016,
    this.x017,
    this.x018,
    this.x019,
    this.x020,
  });

  factory Permiso.fromJson(Map<String, dynamic> json) => Permiso(
    idxusuario: json["Idxusuario"],
    idcolegio: json["Idcolegio"],
    idxmaestro: json["Idxmaestro"],
    tipomaestro: json["Tipomaestro"],
    x001: (json["x001"] as num?)?.toDouble(),
    x002: (json["x002"] as num?)?.toDouble(),
    x003: (json["x003"] as num?)?.toDouble(),
    x004: (json["x004"] as num?)?.toDouble(),
    x005: (json["x005"] as num?)?.toDouble(),
    x006: (json["x006"] as num?)?.toDouble(),
    x007: (json["x007"] as num?)?.toDouble(),
    x008: (json["x008"] as num?)?.toDouble(),
    x009: (json["x009"] as num?)?.toDouble(),
    x010: (json["x010"] as num?)?.toDouble(),
    x011: (json["x011"] as num?)?.toDouble(),
    x012: (json["x012"] as num?)?.toDouble(),
    x013: (json["x013"] as num?)?.toDouble(),
    x014: (json["x014"] as num?)?.toDouble(),
    x015: (json["x015"] as num?)?.toDouble(),
    x016: (json["x016"] as num?)?.toDouble(),
    x017: (json["x017"] as num?)?.toDouble(),
    x018: (json["x018"] as num?)?.toDouble(),
    x019: (json["x019"] as num?)?.toDouble(),
    x020: (json["x020"] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Idxusuario": idxusuario,
    "Idcolegio": idcolegio,
    "Idxmaestro": idxmaestro,
    "Tipomaestro": tipomaestro,
    "x001": x001,
    "x002": x002,
    "x003": x003,
    "x004": x004,
    "x005": x005,
    "x006": x006,
    "x007": x007,
    "x008": x008,
    "x009": x009,
    "x010": x010,
    "x011": x011,
    "x012": x012,
    "x013": x013,
    "x014": x014,
    "x015": x015,
    "x016": x016,
    "x017": x017,
    "x018": x018,
    "x019": x019,
    "x020": x020,
  };
}
