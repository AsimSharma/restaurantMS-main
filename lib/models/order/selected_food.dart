class SelectedFoodModel {
  int? foodId;
  String? tableName;
  String? foodName;
  int quantity;
  int? price;
  String? note;
  String? foodQuantity;
  String? spicyLevel;
  Set<String>? addons;
  bool? isCustomisable;
  bool? isVeg;

  SelectedFoodModel({
    this.foodId,
    this.tableName,
    this.foodName,
    required this.quantity,
    this.price,
    this.note,
    this.foodQuantity,
    this.spicyLevel,
    this.addons,
    this.isVeg,
    this.isCustomisable,
  });
}
