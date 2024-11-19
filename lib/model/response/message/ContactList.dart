
import 'dart:convert';
List<Contact> contactFromJson(String str) => List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));
String contactToJson(List<Contact> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Contact {
  String? codigoContacto;
  String? nombrecontacto;
  String? grupocontacto;
  int? idgrupo;
  String? cargo;

  Contact({
    this.codigoContacto,
    this.nombrecontacto,
    this.grupocontacto,
    this.idgrupo,
    this.cargo,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    codigoContacto: json["codigoContacto"],
    nombrecontacto: json["nombrecontacto"],
    grupocontacto: json["grupocontacto"],
    idgrupo: json["idgrupo"],
    cargo: json["cargo"],
  );

  Map<String, dynamic> toJson() => {
    "codigoContacto": codigoContacto,
    "nombrecontacto": nombrecontacto,
    "grupocontacto": grupocontacto,
    "idgrupo": idgrupo,
    "cargo": cargo,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Contact && runtimeType == other.runtimeType && codigoContacto == other.codigoContacto;

  // Override hashCode to hash based on codigoContacto
  @override
  int get hashCode => codigoContacto.hashCode;


  static List<GroupCroupContact>  groupContact(List<Contact> items) {
    Map<String, List<Contact>> groupedItems = {};

    for (var item in items) {
      String? contactGroup = item.grupocontacto ?? ""; // Handle null values for cargo2
      if (!groupedItems.containsKey(contactGroup)) {
        groupedItems[contactGroup] = [];
      }
      groupedItems[contactGroup]!.add(item);
    }
    List<GroupCroupContact> groupList = [];
    print("groupItems: $groupList");
    groupedItems.forEach((name, list) {
      groupList.add(GroupCroupContact(name: name, list: list));
    });
    return groupList;
  }

  static Map<String, String> appendAllNombrecontactoAndCodigoContacto(List<Contact> items) {
    String allNames = '';
    String allIds = '';

    for (var item in items) {
      if (item.nombrecontacto != null) {
        allNames += '${item.nombrecontacto},'; // Append and add a space
      }
      if (item.codigoContacto != null) {
        allIds += '${item.codigoContacto},'; // Append and add a space
      }
    }
    // Remove the last comma if the string is not empty
    if (allNames.isNotEmpty) {
      allNames = allNames.substring(0, allNames.length - 1);
    }
    if (allIds.isNotEmpty) {
      allIds = allIds.substring(0, allIds.length - 1);
    }
    return {
      'name': allNames.trim(),
      'id': allIds.trim(),
    };
  }
}

class GroupCroupContact{
  String name;
  List<Contact> list;
  GroupCroupContact({required this.name, required this.list});
}

