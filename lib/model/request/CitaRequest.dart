import 'dart:convert';
RequestAppointment requestAppointmentFromJson(String str) => RequestAppointment.fromJson(json.decode(str));
String requestAppointmentToJson(RequestAppointment data) => json.encode(data.toJson());
class RequestAppointment {
  int idxCita;
  int idxMaestro;
  String fecha;
  int hora;
  int minutos;
  int idColegio;
  int idxEstudiante;
  String observacion;
  String tipo;
  String lado;
  bool zoom;
  String zoomurl;
  RequestAppointment({
    required this.idxCita,
    required this.idxMaestro,
    required this.fecha,
    required this.hora,
    required this.minutos,
    required this.idColegio,
    required this.idxEstudiante,
    required this.observacion,
    required this.tipo,
    required this.lado,
    required this.zoom,
    required this.zoomurl,
  });
  factory RequestAppointment.fromJson(Map<String, dynamic> json) => RequestAppointment(
    idxCita: json["idxCita"],
    idxMaestro: json["idxMaestro"],
    fecha: json["fecha"],
    hora: json["hora"],
    minutos: json["minutos"],
    idColegio: json["idColegio"],
    idxEstudiante: json["idxEstudiante"],
    observacion: json["observacion"],
    tipo: json["tipo"],
    lado: json["lado"],
    zoom: json["zoom"],
    zoomurl: json["zoomurl"],
  );
  Map<String, dynamic> toJson() => {
    "idxCita": idxCita,
    "idxMaestro": idxMaestro,
    "fecha": fecha,
    "hora": hora,
    "minutos": minutos,
    "idColegio": idColegio,
    "idxEstudiante": idxEstudiante,
    "observacion": observacion,
    "tipo": tipo,
    "lado": lado,
    "zoom": zoom,
    "zoomurl": zoomurl,
  };
}
