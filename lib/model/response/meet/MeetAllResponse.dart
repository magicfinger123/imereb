import 'dart:convert';
List<MeetAllResponse> meetAllResponseFromJson(String str) => List<MeetAllResponse>.from(json.decode(str).map((x) => MeetAllResponse.fromJson(x)));
String meetAllResponseToJson(List<MeetAllResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeetAllResponse {
  num? idxCita;
  num? idColegio;
  num? idxEstudiante;
  num? idxMaestro;
  String? tipoMaestro;
  DateTime? fecha;
  int? hora;
  int? minutos;
  bool? aprobada;
  num? idxMaestroaprueba;
  String? tipomaestroaprueba;
  bool? rechazada;
  num? idxMaestrorechaza;
  dynamic tipomaestrorechaza;
  bool? cancelada;
  num? idxMaestrocancela;
  String? tipomaestrocancela;
  String? obscancelacion;
  dynamic obsrechazada;
  String? observacion;
  String? tipoMaestroLado;
  bool? recordada;
  bool? zoom;
  String? zoomurl;
  num? anomereb;
  num? idxCitaAnterior;
  num? idxMaestroRef;
  String? tipoMaestroRef;
  String? minutaFinal;
  bool? minutaEnviada;
  String? estudiante;
  String? nombre;
  String? grupo;
  num? mes;
  num? ano;
  num? dia;
  String? estado;
  String? color;
  String? acudiente;
  num? espera;
  String? citador;
  String? cargo;
  String? img;
  num? confirmadas;
  num? tienedoc;
  String? estado2;

  MeetAllResponse({
    this.idxCita,
    this.idColegio,
    this.idxEstudiante,
    this.idxMaestro,
    this.tipoMaestro,
    this.fecha,
    this.hora,
    this.minutos,
    this.aprobada,
    this.idxMaestroaprueba,
    this.tipomaestroaprueba,
    this.rechazada,
    this.idxMaestrorechaza,
    this.tipomaestrorechaza,
    this.cancelada,
    this.idxMaestrocancela,
    this.tipomaestrocancela,
    this.obscancelacion,
    this.obsrechazada,
    this.observacion,
    this.tipoMaestroLado,
    this.recordada,
    this.zoom,
    this.zoomurl,
    this.anomereb,
    this.idxCitaAnterior,
    this.idxMaestroRef,
    this.tipoMaestroRef,
    this.minutaFinal,
    this.minutaEnviada,
    this.estudiante,
    this.nombre,
    this.grupo,
    this.mes,
    this.ano,
    this.dia,
    this.estado,
    this.color,
    this.acudiente,
    this.espera,
    this.citador,
    this.cargo,
    this.img,
    this.confirmadas,
    this.tienedoc,
    this.estado2,
  });

  factory MeetAllResponse.fromJson(Map<String, dynamic> json) => MeetAllResponse(
    idxCita: json["IdxCita"],
    idColegio: json["IdColegio"],
    idxEstudiante: json["IdxEstudiante"],
    idxMaestro: json["IdxMaestro"],
    tipoMaestro: json["TipoMaestro"],
    fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
    hora: json["hora"],
    minutos: json["minutos"],
    aprobada: json["aprobada"],
    idxMaestroaprueba: json["idxMaestroaprueba"],
    tipomaestroaprueba: json["tipomaestroaprueba"],
    rechazada: json["rechazada"],
    idxMaestrorechaza: json["idxMaestrorechaza"],
    tipomaestrorechaza: json["tipomaestrorechaza"],
    cancelada: json["cancelada"],
    idxMaestrocancela: json["idxMaestrocancela"],
    tipomaestrocancela: json["tipomaestrocancela"],
    obscancelacion: json["obscancelacion"],
    obsrechazada: json["obsrechazada"],
    observacion: json["observacion"],
    tipoMaestroLado: json["TipoMaestroLado"],
    recordada: json["recordada"],
    zoom: json["zoom"],
    zoomurl: json["zoomurl"],
    anomereb: json["anomereb"],
    idxCitaAnterior: json["idxCitaAnterior"],
    idxMaestroRef: json["idxMaestroRef"],
    tipoMaestroRef: json["tipoMaestroRef"],
    minutaFinal: json["MinutaFinal"],
    minutaEnviada: json["MinutaEnviada"],
    estudiante: json["estudiante"],
    nombre: json["nombre"],
    grupo: json["Grupo"],
    mes: json["mes"],
    ano: json["ano"],
    dia: json["dia"],
    estado: json["estado"],
    color: json["color"],
    acudiente: json["acudiente"],
    espera: json["espera"],
    citador: json["citador"],
    cargo: json["cargo"],
    img: json["img"],
    confirmadas: json["confirmadas"],
    tienedoc: json["tienedoc"],
    estado2: json["estado2"],
  );

  Map<String, dynamic> toJson() => {
    "IdxCita": idxCita,
    "IdColegio": idColegio,
    "IdxEstudiante": idxEstudiante,
    "IdxMaestro": idxMaestro,
    "TipoMaestro": tipoMaestro,
    "fecha": fecha?.toIso8601String(),
    "hora": hora,
    "minutos": minutos,
    "aprobada": aprobada,
    "idxMaestroaprueba": idxMaestroaprueba,
    "tipomaestroaprueba": tipomaestroaprueba,
    "rechazada": rechazada,
    "idxMaestrorechaza": idxMaestrorechaza,
    "tipomaestrorechaza": tipomaestrorechaza,
    "cancelada": cancelada,
    "idxMaestrocancela": idxMaestrocancela,
    "tipomaestrocancela": tipomaestrocancela,
    "obscancelacion": obscancelacion,
    "obsrechazada": obsrechazada,
    "observacion": observacion,
    "TipoMaestroLado": tipoMaestroLado,
    "recordada": recordada,
    "zoom": zoom,
    "zoomurl": zoomurl,
    "anomereb": anomereb,
    "idxCitaAnterior": idxCitaAnterior,
    "idxMaestroRef": idxMaestroRef,
    "tipoMaestroRef": tipoMaestroRef,
    "MinutaFinal": minutaFinal,
    "MinutaEnviada": minutaEnviada,
    "estudiante": estudiante,
    "nombre": nombre,
    "Grupo": grupo,
    "mes": mes,
    "ano": ano,
    "dia": dia,
    "estado": estado,
    "color": color,
    "acudiente": acudiente,
    "espera": espera,
    "citador": citador,
    "cargo": cargo,
    "img": img,
    "confirmadas": confirmadas,
    "tienedoc": tienedoc,
    "estado2": estado2,
  };
}
