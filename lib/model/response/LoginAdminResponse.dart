// To parse this JSON data, do
//
//     final loginAdminResponse = loginAdminResponseFromJson(jsonString);

import 'dart:convert';

LoginAdminResponse loginAdminResponseFromJson(String str) => LoginAdminResponse.fromJson(json.decode(str));

String loginAdminResponseToJson(LoginAdminResponse data) => json.encode(data.toJson());

class LoginAdminResponse {
  String? usuario;
  String? password;
  String? token;
  int? idxAdministrativo;
  int? idxUsuario;
  int? idColegio;
  String? cedula;
  String? nombre;
  String? cargo;
  String? description;
  DateTime? fechaUltLogin;
  DateTime? fechaAntLogin;
  String? celular;
  int? orden;
  int? recibeMsgPflia;
  int? activo;
  int? puedeAutorizar;
  int? recibeMsg;
  int? enviaMsg;
  int? enviaMsgPflia;
  int? idxMaestro;
  String? tipoMaestro;
  int? year;
  String? collegeName;
  int? currentPeriodo;
  String? imagenUrl;
  String? tokenapp;
  List<Permiso>? permisos;
  List<dynamic>? contactos;

  LoginAdminResponse({
    this.usuario,
    this.password,
    this.token,
    this.idxAdministrativo,
    this.idxUsuario,
    this.idColegio,
    this.cedula,
    this.nombre,
    this.cargo,
    this.description,
    this.fechaUltLogin,
    this.fechaAntLogin,
    this.celular,
    this.orden,
    this.recibeMsgPflia,
    this.activo,
    this.puedeAutorizar,
    this.recibeMsg,
    this.enviaMsg,
    this.enviaMsgPflia,
    this.idxMaestro,
    this.tipoMaestro,
    this.year,
    this.collegeName,
    this.currentPeriodo,
    this.imagenUrl,
    this.tokenapp,
    this.permisos,
    this.contactos,
  });

  factory LoginAdminResponse.fromJson(Map<String, dynamic> json) => LoginAdminResponse(
    usuario: json["Usuario"] ?? '',
    password: json["Password"] ?? '',
    token: json["Token"] ?? '',
    idxAdministrativo: json["IdxAdministrativo"],
    idxUsuario: json["IdxUsuario"],
    idColegio: json["idColegio"],
    cedula: json["Cedula"] ?? '',
    nombre: json["Nombre"] ?? '',
    cargo: json["Cargo"] ?? '',
    description: json["Description"] ?? '',
    fechaUltLogin: json["FechaUltLogin"] != null ? DateTime.parse(json["FechaUltLogin"]) : null,
    fechaAntLogin: json["FechaAntLogin"] != null ? DateTime.parse(json["FechaAntLogin"]) : null,
    celular: json["Celular"] ?? '',
    orden: json["Orden"],
    recibeMsgPflia: json["RecibeMsgPflia"],
    activo: json["Activo"],
    puedeAutorizar: json["PuedeAutorizar"],
    recibeMsg: json["RecibeMsg"],
    enviaMsg: json["EnviaMsg"],
    enviaMsgPflia: json["EnviaMsgPflia"],
    idxMaestro: json["IdxMaestro"],
    tipoMaestro: json["TipoMaestro"] ?? '',
    year: json["Year"],
    collegeName: json["CollegeName"] ?? '',
    currentPeriodo: json["CurrentPeriodo"],
    imagenUrl: json["imagenUrl"] ?? '',
    tokenapp: json["tokenapp"] ?? '',
    permisos: json["Permisos"] != null ? List<Permiso>.from(json["Permisos"].map((x) => Permiso.fromJson(x))) : [],
    contactos: json["Contactos"] != null ? List<dynamic>.from(json["Contactos"].map((x) => x)) : [],
    // usuario: json["Usuario"],
    // password: json["Password"],
    // token: json["Token"],
    // idxAdministrativo: json["IdxAdministrativo"],
    // idxUsuario: json["IdxUsuario"],
    // idColegio: json["idColegio"],
    // cedula: json["Cedula"],
    // nombre: json["Nombre"],
    // cargo: json["Cargo"],
    // description: json["Description"],
    // fechaUltLogin: json["FechaUltLogin"] == null ? null : DateTime.parse(json["FechaUltLogin"]),
    // fechaAntLogin: json["FechaAntLogin"] == null ? null : DateTime.parse(json["FechaAntLogin"]),
    // celular: json["Celular"],
    // orden: json["Orden"],
    // recibeMsgPflia: json["RecibeMsgPflia"],
    // activo: json["Activo"],
    // puedeAutorizar: json["PuedeAutorizar"],
    // recibeMsg: json["RecibeMsg"],
    // enviaMsg: json["EnviaMsg"],
    // enviaMsgPflia: json["EnviaMsgPflia"],
    // idxMaestro: json["IdxMaestro"],
    // tipoMaestro: json["TipoMaestro"],
    // year: json["Year"],
    // collegeName: json["CollegeName"],
    // currentPeriodo: json["CurrentPeriodo"],
    // imagenUrl: json["imagenUrl"],
    // tokenapp: json["tokenapp"],
    // permisos: json["Permisos"] == null ? [] : List<Permiso>.from(json["Permisos"]!.map((x) => Permiso.fromJson(x))),
    // contactos: json["Contactos"] == null ? [] : List<dynamic>.from(json["Contactos"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Usuario": usuario,
    "Password": password,
    "Token": token,
    "IdxAdministrativo": idxAdministrativo,
    "IdxUsuario": idxUsuario,
    "idColegio": idColegio,
    "Cedula": cedula,
    "Nombre": nombre,
    "Cargo": cargo,
    "Description": description,
    "FechaUltLogin": fechaUltLogin?.toIso8601String(),
    "FechaAntLogin": fechaAntLogin?.toIso8601String(),
    "Celular": celular,
    "Orden": orden,
    "RecibeMsgPflia": recibeMsgPflia,
    "Activo": activo,
    "PuedeAutorizar": puedeAutorizar,
    "RecibeMsg": recibeMsg,
    "EnviaMsg": enviaMsg,
    "EnviaMsgPflia": enviaMsgPflia,
    "IdxMaestro": idxMaestro,
    "TipoMaestro": tipoMaestro,
    "Year": year,
    "CollegeName": collegeName,
    "CurrentPeriodo": currentPeriodo,
    "imagenUrl": imagenUrl,
    "tokenapp": tokenapp,
    "Permisos": permisos == null ? [] : List<dynamic>.from(permisos!.map((x) => x.toJson())),
    "Contactos": contactos == null ? [] : List<dynamic>.from(contactos!.map((x) => x)),
  };
}

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
  // int? x001;
  // int? x002;
  // int? x003;
  // int? x004;
  // int? x005;
  // int? x006;
  // int? x007;
  // int? x008;
  // int? x009;
  // int? x010;
  // int? x011;
  // int? x012;
  // int? x013;
  // int? x014;
  // int? x015;
  // int? x016;
  // int? x017;
  // int? x018;
  // int? x019;
  // int? x020;

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
    idxusuario: json["idxusuario"],
    idcolegio: json["idcolegio"],
    idxmaestro: json["idxmaestro"],
    tipomaestro: json["tipomaestro"],
    x001: (json["X001"] is int) ? json["X001"].toDouble() : json["X001"],
    x002: (json["X002"] is int) ? json["X002"].toDouble() : json["X002"],
    x003: (json["X003"] is int) ? json["X003"].toDouble() : json["X003"],
    x004: (json["X004"] is int) ? json["X004"].toDouble() : json["X004"],
    x005: (json["X005"] is int) ? json["X005"].toDouble() : json["X005"],
    x006: (json["X006"] is int) ? json["X006"].toDouble() : json["X006"],
    x007: (json["X007"] is int) ? json["X007"].toDouble() : json["X007"],
    x008: (json["X008"] is int) ? json["X008"].toDouble() : json["X008"],
    x009: (json["X009"] is int) ? json["X009"].toDouble() : json["X009"],
    x010: (json["X010"] is int) ? json["X010"].toDouble() : json["X010"],
    x011: (json["X011"] is int) ? json["X011"].toDouble() : json["X011"],
    x012: (json["X012"] is int) ? json["X012"].toDouble() : json["X012"],
    x013: (json["X013"] is int) ? json["X013"].toDouble() : json["X013"],
    x014: (json["X014"] is int) ? json["X014"].toDouble() : json["X014"],
    x015: (json["X015"] is int) ? json["X015"].toDouble() : json["X015"],
    x016: (json["X016"] is int) ? json["X016"].toDouble() : json["X016"],
    x017: (json["X017"] is int) ? json["X017"].toDouble() : json["X017"],
    x018: (json["X018"] is int) ? json["X018"].toDouble() : json["X018"],
    x019: (json["X019"] is int) ? json["X019"].toDouble() : json["X019"],
    x020: (json["X020"] is int) ? json["X020"].toDouble() : json["X020"],
    // x001: json["X001"],
    // x002: json["X002"],
    // x003: json["X003"],
    // x004: json["X004"],
    // x005: json["X005"],
    // x006: json["X006"],
    // x007: json["X007"],
    // x008: json["X008"],
    // x009: json["X009"],
    // x010: json["X010"],
    // x011: json["X011"],
    // x012: json["X012"],
    // x013: json["X013"],
    // x014: json["X014"],
    // x015: json["X015"],
    // x016: json["X016"],
    // x017: json["X017"],
    // x018: json["X018"],
    // x019: json["X019"],
    // x020: json["X020"],
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
    "X009": x009,
    "X010": x010,
    "X011": x011,
    "X012": x012,
    "X013": x013,
    "X014": x014,
    "X015": x015,
    "X016": x016,
    "X017": x017,
    "X018": x018,
    "X019": x019,
    "X020": x020,
  };
}
