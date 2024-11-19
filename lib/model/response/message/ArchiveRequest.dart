import 'dart:convert';
ArchiveRequest archiveRequestFromJson(String str) => ArchiveRequest.fromJson(json.decode(str));
String archiveRequestToJson(ArchiveRequest data) => json.encode(data.toJson());

class ArchiveRequest {
  int idColegio;
  int idxMaestro;
  String tipoMaestro;
  String file;
  String fileName;
  ArchiveRequest({
    required this.idColegio,
    required this.idxMaestro,
    required this.tipoMaestro,
    required this.file,
    required this.fileName,
  });
  factory ArchiveRequest.fromJson(Map<String, dynamic> json) => ArchiveRequest(
    idColegio: json["idColegio"],
    idxMaestro: json["idxMaestro"],
    tipoMaestro: json["tipoMaestro"],
    file: json["file"],
    fileName: json["file_name"],
  );
  Map<String, dynamic> toJson() => {
    "idColegio": idColegio,
    "idxMaestro": idxMaestro,
    "tipoMaestro": tipoMaestro,
    "file": file,
    "file_name": fileName,
  };
}
