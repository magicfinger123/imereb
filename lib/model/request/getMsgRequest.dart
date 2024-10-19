
import 'dart:convert';

GetMessageListRequest getMessageListRequestFromJson(String str) => GetMessageListRequest.fromJson(json.decode(str));

String getMessageListRequestToJson(GetMessageListRequest data) => json.encode(data.toJson());

class GetMessageListRequest {
  String idColegio;
  String cedula;

  GetMessageListRequest({
    required this.idColegio,
    required this.cedula,
  });

  factory GetMessageListRequest.fromJson(Map<String, dynamic> json) => GetMessageListRequest(
    idColegio: json["idColegio"],
    cedula: json["cedula"],
  );

  Map<String, dynamic> toJson() => {
    "idColegio": idColegio,
    "cedula": cedula,
  };
}
