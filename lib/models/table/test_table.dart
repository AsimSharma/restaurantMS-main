// To parse this JSON data, do
//
//     final tableModeld = tableModeldFromJson(jsonString);

import 'dart:convert';

List<TableModeld> tableModeldFromJson(String str) => List<TableModeld>.from(
    json.decode(str).map((x) => TableModeld.fromJson(x)));

String tableModeldToJson(List<TableModeld> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableModeld {
  TableModeld({
    this.tableType,
    this.tables,
    this.id,
  });

  String? tableType;
  List<Table>? tables;
  String? id;

  factory TableModeld.fromJson(Map<String, dynamic> json) => TableModeld(
        tableType: json["tableType"],
        tables: List<Table>.from(json["tables"].map((x) => Table.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "tableType": tableType,
        "tables": List<dynamic>.from(tables!.map((x) => x.toJson())),
        "id": id,
      };
}

class Table {
  Table({
    this.id,
    this.name,
    this.totalCapacity,
    this.totalGuest,
    this.isReserved,
  });

  String? id;
  String? name;
  int? totalCapacity;
  int? totalGuest;
  bool? isReserved;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        id: json["id"],
        name: json["name"],
        totalCapacity: json["totalCapacity"],
        totalGuest: json["totalGuest"],
        isReserved: json["isReserved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "totalCapacity": totalCapacity,
        "totalGuest": totalGuest,
        "isReserved": isReserved,
      };
}
