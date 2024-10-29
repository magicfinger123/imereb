// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

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
  num? idxUsuario;
  num? idxMaestro;
  String? codFamilia;
  int? produccion;
  int? idxAdministrativo;
  List<FamilyMember>? familyMembers;
  List<Permiso>? permisos;
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
    this.idxUsuario,
    this.idxMaestro,
    this.codFamilia,
    this.produccion,
    this.idxAdministrativo,
    this.familyMembers,
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
    colegio: json["Colegio"] ?? json["CollegeName"],
    bloqueado: json["Bloqueado"],
    aviso: json["Aviso"],
    periodoPre: json["Periodo_pre"],
    nivel: json["Nivel"],
    grupoUsuario: json["GrupoUsuario"],
    cambiarpass: json["Cambiarpass"],
    idioma: json["Idioma"],
    idxUsuario: json["IdxUsuario"],
    idxMaestro: json["IdxMaestro"],
    codFamilia: json["CodFamilia"],
    produccion: json["Produccion"],
    idxAdministrativo: json["IdxAdministrativo"],
    familyMembers: json["FamilyMembers"] == null ? [] : List<FamilyMember>.from(json["FamilyMembers"]!.map((x) => FamilyMember.fromJson(x))),
    permisos: json["Permisos"] == null ? [] : List<Permiso>.from(json["Permisos"]!.map((x) => Permiso.fromJson(x))),
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
    "IdxUsuario": idxUsuario,
    "IdxMaestro": idxMaestro,
    "CodFamilia": codFamilia,
    "Produccion": produccion,
    "IdxAdministrativo": idxAdministrativo,
    "FamilyMembers": familyMembers == null ? [] : List<dynamic>.from(familyMembers!.map((x) => x.toJson())),
    "Permisos": permisos == null ? [] : List<dynamic>.from(permisos!.map((x) => x.toJson())),
    "LoginXFamilia": loginXFamilia,
    "imagenUrl": imagenUrl,
    "tokenapp": tokenapp,
  };
}

class FamilyMember {
  String? nombreCompleto;
  String? nombre1;
  String? nombre2;
  String? apellido1;
  String? apellido2;
  String? cedula;
  int? anocursa;
  int? idxEstudiante;

  FamilyMember({
    this.nombreCompleto,
    this.nombre1,
    this.nombre2,
    this.apellido1,
    this.apellido2,
    this.cedula,
    this.anocursa,
    this.idxEstudiante,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
    nombreCompleto: json["NombreCompleto"],
    nombre1: json["Nombre1"],
    nombre2: json["Nombre2"],
    apellido1: json["Apellido1"],
    apellido2: json["Apellido2"],
    cedula: json["Cedula"],
    anocursa: json["anocursa"],
    idxEstudiante: json["IdxEstudiante"],
  );

  Map<String, dynamic> toJson() => {
    "NombreCompleto": nombreCompleto,
    "Nombre1": nombre1,
    "Nombre2": nombre2,
    "Apellido1": apellido1,
    "Apellido2": apellido2,
    "Cedula": cedula,
    "anocursa": anocursa,
    "IdxEstudiante": idxEstudiante,
  };
}

class Permiso {
  int? idxusuario;
  int? idcolegio;
  int? idxmaestro;
  String? tipomaestro;
  int? x001;
  int? x002;
  int? x003;
  int? x004;
  int? x005;
  int? x006;
  int? x007;
  int? x008;

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
  });
  factory Permiso.fromJson(Map<String, dynamic> json) => Permiso(
    idxusuario: json["idxusuario"],
    idcolegio: json["idcolegio"],
    idxmaestro: json["idxmaestro"],
    tipomaestro: json["tipomaestro"],
    x001: json["X001"],
    x002: json["X002"],
    x003: json["X003"],
    x004: json["X004"],
    x005: json["X005"],
    x006: json["X006"],
    x007: json["X007"],
    x008: json["X008"],
  );
  Map<String, dynamic> toJson() => {
    "idxusuario": idxusuario,
    "idcolegio": idcolegio,
    "idxmaestro": idxmaestro,
    "tipomaestro": tipomaestro,
    "X001": x001,
    "X002": x002,
    "X003": x003,
    "X004": x004,
    "X005": x005,
    "X006": x006,
    "X007": x007,
    "X008": x008,
  };
}
