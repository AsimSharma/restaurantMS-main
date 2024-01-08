class BillModel {
  int? id;
  String? tableName;
  List<BillItem>? items;
  BillModel({
    this.id,
    this.tableName,
    this.items,
  });
}

class BillItem {
  int? id;
  String? name;
  String? note;
  int? quantity;
  int? amount;
  BillItem({
    this.id,
    this.name,
    this.note,
    this.quantity,
    this.amount,
  });
}
