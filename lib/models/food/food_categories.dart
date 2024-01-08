// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodCategories {
  int? id;
  String? name;
  List<Food>? food;

  FoodCategories({this.id, this.name, this.food});
}

class Food {
  int? id;
  String? foodName;
  String? foodDescription;
  String? price;
  bool? isVeg;
  bool? isAdded;
  String? foodImage;
  bool? isCustomizable;
  List<ChoiceOption>? choiceOptions;
  List<Addon>? addons;

  Food({
    this.id,
    this.foodName,
    this.foodDescription,
    this.price,
    this.isVeg,
    this.isAdded,
    this.foodImage,
    this.isCustomizable,
    this.choiceOptions,
    this.addons,
  });
}

class ChoiceOption {
  String? title;
  int? price;
  ChoiceOption({
    this.title,
    this.price,
  });
}

class Addon {
  String? title;
  int? price;
  bool? isAdded;
  Addon({
    this.title,
    this.price,
    this.isAdded,
  });
}

List<String> categories = [
  'All Categories',
  'Momo',
  'Biryani',
  'Korean Foods',
  'Chaumin'
];

List<FoodCategories> allFoodList = [
  FoodCategories(
    id: 1,
    name: "Momo",
    food: [
      Food(
        id: 1,
        foodName: "Chicken Jhol Momo",
        foodDescription:
            'Chicken Jhol Momo Set the new password for your account.',
        price: "200",
        isVeg: false,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: true,
        choiceOptions: [
          ChoiceOption(
            title: "Full",
            price: 200,
          ),
          ChoiceOption(
            title: 'Half',
            price: 120,
          ),
        ],
        addons: [],
      ),
      Food(
        id: 2,
        foodName: "Veg Jhol Momo",
        foodDescription: 'Veg Jhol Momo Set the new password for your account.',
        price: "150",
        isVeg: true,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: true,
        choiceOptions: [
          ChoiceOption(
            title: "Full",
            price: 150,
          ),
          ChoiceOption(
            title: 'Half',
            price: 90,
          )
        ],
        addons: [],
      ),
      Food(
        id: 3,
        foodName: " Steam Momo",
        foodDescription: 'Steam Momo Set the new password for your account.',
        price: "140",
        isVeg: false,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: false,
        choiceOptions: [
          ChoiceOption(
            title: "Full",
            price: 140,
          ),
          ChoiceOption(
            title: 'Half',
            price: 80,
          )
        ],
        addons: [],
      )
    ],
  ),
  FoodCategories(
    id: 2,
    name: "Biryani",
    food: [
      Food(
        id: 4,
        foodName: "Chicken Biryani",
        foodDescription:
            'chicken Biryani Set the new password for your account.',
        price: "450",
        isVeg: false,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: false,
      ),
      Food(
        id: 5,
        foodName: "Veg Biryani",
        foodDescription: 'Veg Biryani Set the new password for your account.',
        price: "300",
        isVeg: true,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: false,
      ),
      Food(
        id: 6,
        foodName: " Mixed Biryani",
        foodDescription: "Mixed Biryani Set the new password for your account.",
        price: "500",
        isVeg: false,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: false,
      )
    ],
  ),
  FoodCategories(
    id: 2,
    name: "Korean Foods",
    food: [
      Food(
        id: 7,
        foodName: "Korean Foods 1",
        foodDescription: "Korean Foods Set the new password for your account.",
        price: "500",
        isVeg: false,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: false,
      ),
      Food(
        id: 8,
        foodName: "Korean foods 2",
        foodDescription: "Kroe 2 Set the new password for your account.",
        price: "400",
        isVeg: false,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: false,
      ),
    ],
  ),
  FoodCategories(
    id: 2,
    name: "Chaumin",
    food: [
      Food(
        id: 9,
        foodName: "Chicken Chaumin",
        foodDescription:
            "Chicken chaumin Set the new password for your account.",
        price: "200",
        isVeg: false,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: true,
        choiceOptions: [
          ChoiceOption(
            title: "Full",
            price: 200,
          ),
          ChoiceOption(
            title: 'Half',
            price: 120,
          )
        ],
        addons: [
          Addon(
            title: "Egg",
            price: 50,
            isAdded: false,
          ),
        ],
      ),
      Food(
        id: 10,
        foodName: "Veg Chaumin",
        foodDescription: "Veg Chaumin Set the new password for your account.",
        price: "170",
        isVeg: true,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: false,
      ),
      Food(
        id: 11,
        foodName: " Mixed Chaumin",
        foodDescription: "Mixed chaumin Set the new password for your account.",
        price: "190",
        isVeg: false,
        isAdded: false,
        foodImage: "assets/momo.png",
        isCustomizable: true,
        choiceOptions: [
          ChoiceOption(
            title: "Full",
            price: 190,
          ),
          ChoiceOption(
            title: 'Half',
            price: 110,
          )
        ],
        addons: [
          Addon(
            title: "Egg",
            price: 50,
            isAdded: false,
          ),
          Addon(
            title: 'Mushroom',
            price: 60,
            isAdded: false,
          )
        ],
      ),
    ],
  ),
];
