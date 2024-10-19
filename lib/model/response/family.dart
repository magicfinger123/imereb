class FamilyMember {
  String? nombreCompleto;
  String? nombre1;
  String? nombre2;
  String? apellido1;
  String? apellido2;
  String? cedula;
  int? anocursa;
  int? idxEstudiante;

  FamilyMember({
    this.nombreCompleto,
    this.nombre1,
    this.nombre2,
    this.apellido1,
    this.apellido2,
    this.cedula,
    this.anocursa,
    this.idxEstudiante,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
    nombreCompleto: json["NombreCompleto"],
    nombre1: json["Nombre1"],
    nombre2: json["Nombre2"],
    apellido1: json["Apellido1"],
    apellido2: json["Apellido2"],
    cedula: json["Cedula"],
    anocursa: json["anocursa"],
    idxEstudiante: json["IdxEstudiante"],
  );

  Map<String, dynamic> toJson() => {
    "NombreCompleto": nombreCompleto,
    "Nombre1": nombre1,
    "Nombre2": nombre2,
    "Apellido1": apellido1,
    "Apellido2": apellido2,
    "Cedula": cedula,
    "anocursa": anocursa,
    "IdxEstudiante": idxEstudiante,
  };
}