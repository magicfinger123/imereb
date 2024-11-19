// To parse this JSON data, do
//
//     final sentMsgArchiveRequest = sentMsgArchiveRequestFromJson(jsonString);

import 'dart:convert';

SentMsgArchiveRequest sentMsgArchiveRequestFromJson(String str) => SentMsgArchiveRequest.fromJson(json.decode(str));

String sentMsgArchiveRequestToJson(SentMsgArchiveRequest data) => json.encode(data.toJson());

class SentMsgArchiveRequest {
  String idxMensaje;
  String url;
  String fileName;
  String fileSize;

  SentMsgArchiveRequest({
    required this.idxMensaje,
    required this.url,
    required this.fileName,
    required this.fileSize,
  });

  factory SentMsgArchiveRequest.fromJson(Map<String, dynamic> json) => SentMsgArchiveRequest(
    idxMensaje: json["idxMensaje"],
    url: json["url"],
    fileName: json["file_name"],
    fileSize: json["file_size"],
  );

  Map<String, dynamic> toJson() => {
    "idxMensaje": idxMensaje,
    "url": url,
    "file_name": fileName,
    "file_size": fileSize,
  };
}
