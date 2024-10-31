import 'dart:convert';
List<CuponCategory> cuponCategoryFromJson(String str) => List<CuponCategory>.from(json.decode(str).map((x) => CuponCategory.fromJson(x)));

String cuponCategoryToJson(List<CuponCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CuponCategory {
  int? idTipoCupon;
  String? descripcion;
  String? refImagen;

  CuponCategory({
    this.idTipoCupon,
    this.descripcion,
    this.refImagen,
  });

  factory CuponCategory.fromJson(Map<String, dynamic> json) => CuponCategory(
    idTipoCupon: json["id_tipo_Cupon"],
    descripcion: json["descripcion"],
    refImagen: json["ref_imagen"],
  );

  Map<String, dynamic> toJson() => {
    "id_tipo_Cupon": idTipoCupon,
    "descripcion": descripcion,
    "ref_imagen": refImagen,
  };
}
