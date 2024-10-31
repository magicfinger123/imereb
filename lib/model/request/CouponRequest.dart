import 'dart:convert';
CuponRequest cuponRequestFromJson(String str) => CuponRequest.fromJson(json.decode(str));
String cuponRequestToJson(CuponRequest data) => json.encode(data.toJson());
class CuponRequest {
  int? idCupon;
  int? idTipoCupon;
  int? fechaInicio;
  int? fechaFin;
  int? opcion;
  CuponRequest({
    this.idCupon,
    this.idTipoCupon,
    this.fechaInicio,
    this.fechaFin,
    this.opcion,
  });
  factory CuponRequest.fromJson(Map<String, dynamic> json) => CuponRequest(
    idCupon: json["idCupon"],
    idTipoCupon: json["idTipoCupon"],
    fechaInicio: json["fechaInicio"],
    fechaFin: json["fechaFin"],
    opcion: json["opcion"],
  );
  Map<String, dynamic> toJson() => {
    "id_cupon": idCupon,
    "id_tipo_cupon": idTipoCupon,
    "fecha_inicio": fechaInicio,
    "fecha_fin": fechaFin,
    "opcion": opcion,
  };
}
