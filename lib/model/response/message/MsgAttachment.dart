// To parse this JSON data, do
//
//     final msgAttachment = msgAttachmentFromJson(jsonString);

import 'dart:convert';
List<MsgAttachment> msgAttachmentFromJson(String str) => List<MsgAttachment>.from(json.decode(str).map((x) => MsgAttachment.fromJson(x)));
String msgAttachmentToJson(List<MsgAttachment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class MsgAttachment {
  num? idxMsgFiles;
  num? idxMensaje;
  String? url;
  String? fileName;
  num? fileSize;
  num? idxMensajeOriginal;
  MsgAttachment({
    this.idxMsgFiles,
    this.idxMensaje,
    this.url,
    this.fileName,
    this.fileSize,
    this.idxMensajeOriginal,
  });
  factory MsgAttachment.fromJson(Map<String, dynamic> json) => MsgAttachment(
    idxMsgFiles: json["IdxMsgFiles"],
    idxMensaje: json["IdxMensaje"],
    url: json["url"],
    fileName: json["file_name"],
    fileSize: json["file_size"],
    idxMensajeOriginal: json["IdxMensajeOriginal"],
  );
  Map<String, dynamic> toJson() => {
    "IdxMsgFiles": idxMsgFiles,
    "IdxMensaje": idxMensaje,
    "url": url,
    "file_name": fileName,
    "file_size": fileSize,
    "IdxMensajeOriginal": idxMensajeOriginal,
  };
}
