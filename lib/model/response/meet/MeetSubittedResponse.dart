

import 'dart:convert';

CitasResponse citasResponseFromJson(String str) => CitasResponse.fromJson(json.decode(str));

String citasResponseToJson(CitasResponse data) => json.encode(data.toJson());

class CitasResponse {
  String? idxcita;
  String? flag;
  String? msg;

  CitasResponse({
    this.idxcita,
    this.flag,
    this.msg,
  });

  factory CitasResponse.fromJson(Map<String, dynamic> json) => CitasResponse(
    idxcita: json["idxcita"],
    flag: json["flag"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "idxcita": idxcita,
    "flag": flag,
    "msg": msg,
  };
}
