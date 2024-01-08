class TableModel {
  final String tableType;
  final List<Table> tables;

  TableModel({
    required this.tableType,
    required this.tables,
  });

  String get getTableType => tableType;
  List<Table> get getTables => tables;

  set setTables(int id) {}
}

class Table {
  final int id;
  final String name;
  final int totalCapacity;
  int totalGuest;
  bool isReserved;

  Table({
    required this.id,
    required this.name,
    required this.totalCapacity,
    required this.totalGuest,
    required this.isReserved,
  });
}

List<TableModel> alltables1 = [
  TableModel(
    tableType: 'Ground Floor',
    tables: [
      Table(
        id: 1,
        name: '1A',
        totalCapacity: 5,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 2,
        name: '2A',
        totalCapacity: 4,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 3,
        name: '3A',
        totalCapacity: 6,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 4,
        name: '1B',
        totalCapacity: 1,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 5,
        name: '2B',
        totalCapacity: 5,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 6,
        name: '3B',
        totalCapacity: 7,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 7,
        name: '4B',
        totalCapacity: 3,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 8,
        name: '5B',
        totalCapacity: 2,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 9,
        name: '6B',
        totalCapacity: 4,
        totalGuest: 0,
        isReserved: false,
      ),
    ],
  ),
  TableModel(
    tableType: 'Cottage',
    tables: [
      Table(
        id: 10,
        name: '1C',
        totalCapacity: 5,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 11,
        name: '2C',
        totalCapacity: 3,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 12,
        name: '3C',
        totalCapacity: 4,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 13,
        name: '4C',
        totalCapacity: 2,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 14,
        name: '5C',
        totalCapacity: 2,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 15,
        name: '6C',
        totalCapacity: 4,
        totalGuest: 0,
        isReserved: false,
      ),
    ],
  ),
  TableModel(
    tableType: 'HallRoom',
    tables: [
      Table(
        id: 16,
        name: '1H',
        totalCapacity: 8,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 17,
        name: '2H',
        totalCapacity: 6,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 18,
        name: '3H',
        totalCapacity: 10,
        totalGuest: 0,
        isReserved: false,
      ),
      Table(
        id: 19,
        name: '4H',
        totalCapacity: 9,
        totalGuest: 0,
        isReserved: false,
      ),
    ],
  ),
];
