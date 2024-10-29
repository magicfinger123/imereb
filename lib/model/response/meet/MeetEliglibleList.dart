
import 'dart:convert';

List<MeetEliglibleList> meetEliglibleListFromJson(String str) => List<MeetEliglibleList>.from(json.decode(str).map((x) => MeetEliglibleList.fromJson(x)));

String meetEliglibleListToJson(List<MeetEliglibleList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeetEliglibleList {
  String? nombre;
  num? orden2;
  String? tipoMaestro;
  num? idxMaestro;
  String? cargo2;
  String? imagen;

  MeetEliglibleList({
    this.nombre,
    this.orden2,
    this.tipoMaestro,
    this.idxMaestro,
    this.cargo2,
    this.imagen,
  });

  factory MeetEliglibleList.fromJson(Map<String, dynamic> json) => MeetEliglibleList(
    nombre: json["nombre"],
    orden2: json["orden2"],
    tipoMaestro: json["TipoMaestro"],
    idxMaestro: json["IdxMaestro"],
    cargo2: json["cargo2"],
    imagen: json["imagen"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "orden2": orden2,
    "TipoMaestro": tipoMaestro,
    "IdxMaestro": idxMaestro,
    "cargo2": cargo2,
    "imagen": imagen,
  };
 static List<GroupMeetEliglibleList>  groupByCargo(List<MeetEliglibleList> items) {
    Map<String, List<MeetEliglibleList>> groupedItems = {};

    for (var item in items) {
      String? cargo = item.cargo2 ?? ""; // Handle null values for cargo2
      if (!groupedItems.containsKey(cargo)) {
        groupedItems[cargo] = [];
      }
      groupedItems[cargo]!.add(item);
    }
    List<GroupMeetEliglibleList> groupList = [];
    print("groupItems: $groupList");
    groupedItems.forEach((name, list) {
      groupList.add(GroupMeetEliglibleList(name: name, list: list));
    });
    return groupList;
  }
}

class GroupMeetEliglibleList{
  String name;
  List<MeetEliglibleList> list;
  GroupMeetEliglibleList({required this.name, required this.list});
}