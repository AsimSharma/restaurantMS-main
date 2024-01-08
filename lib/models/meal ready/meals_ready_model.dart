// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealsReadyModel {
  int? id;
  String? tableName;
  bool? isCompleted;
  List<Meals>? meals;
  MealsReadyModel({
    this.id,
    this.tableName,
    this.isCompleted,
    this.meals,
  });
}

class Meals {
  int? id;
  String? name;
  String? note;
  int? quantity;
  bool? isSelected;
  Meals({
    this.id,
    this.name,
    this.note,
    this.quantity,
    this.isSelected,
  });
}

List<MealsReadyModel> mealsReady = [
  MealsReadyModel(
    id: 1,
    tableName: '2A',
    isCompleted: false,
    meals: [
      Meals(
          id: 101,
          name: 'Chicken Curry',
          note: '',
          quantity: 2,
          isSelected: false),
      Meals(
          id: 102, name: 'Veg momo', note: '', quantity: 1, isSelected: false),
      Meals(
          id: 103,
          name: 'Chicken Biryani',
          note: 'Less Oily',
          quantity: 1,
          isSelected: false),
    ],
  ),
  MealsReadyModel(
    id: 2,
    tableName: '3A',
    isCompleted: false,
    meals: [
      Meals(
          id: 104,
          name: 'Chicken momo',
          note: '',
          quantity: 2,
          isSelected: false),
      Meals(
          id: 105,
          name: 'Korea Foods',
          note: 'Spicy',
          quantity: 1,
          isSelected: false),
      Meals(
          id: 106,
          name: 'Veg Chaumin',
          note: 'Less Oily',
          quantity: 1,
          isSelected: false),
    ],
  ),
  MealsReadyModel(
    id: 3,
    tableName: '1C',
    isCompleted: false,
    meals: [
      Meals(
          id: 101,
          name: 'Chicken Momo',
          note: '',
          quantity: 2,
          isSelected: false),
      Meals(
          id: 108, name: 'Veg momo', note: '', quantity: 1, isSelected: false),
      Meals(
          id: 109,
          name: 'Chicken Chaumin',
          note: 'Less Oily',
          quantity: 1,
          isSelected: false),
    ],
  ),
];
