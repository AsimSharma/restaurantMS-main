import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/models/food/food_categories.dart';
import 'package:restaurantmanagementsystem/providers/order/selected_food_provider.dart';
import 'package:restaurantmanagementsystem/widgets/order/food_card.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

// ignore: must_be_immutable
class FoodCategoriesAll extends StatefulWidget {
  FoodCategoriesAll({Key? key, this.selectedIndex, this.isVeg, this.tableName})
      : super(key: key);

  int? selectedIndex;
  bool? isVeg;
  String? tableName;
  @override
  State<FoodCategoriesAll> createState() => _FoodCategoriesAllState();
}

class _FoodCategoriesAllState extends State<FoodCategoriesAll> {
  @override
  Widget build(BuildContext context) {
    final allFood = Provider.of<SelectedFoodProvider>(context).allFoods;
    return widget.selectedIndex == 0
        ? SizedBox(
            height: 0.6.h(),
            child: ListView.builder(
              itemCount: allFood.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allFood[index].name!,
                      style: TextStyle(
                        fontSize: 0.018.res(),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 0.015.h()),
                    SizedBox(
                      height: 0.34.h(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: allFood[index].food!.length,
                        itemBuilder: (context, i) {
                          final currentFood = allFood[index].food![i];
                          return widget.isVeg == false
                              ? FoodCard(
                                  currentFood: currentFood,
                                  tableName: widget.tableName!,
                                )
                              : widget.isVeg == true &&
                                      currentFood.isVeg == true
                                  ? FoodCard(
                                      currentFood: currentFood,
                                      tableName: widget.tableName!,
                                    )
                                  : Container();
                        },
                      ),
                    ),
                    SizedBox(height: 0.015.h()),
                  ],
                );
              },
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                allFood[widget.selectedIndex! - 1].name!,
                style: TextStyle(
                  fontSize: 0.018.res(),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 250,
                ),
                height: 0.35.h(),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: allFood[widget.selectedIndex! - 1].food!.length,
                  itemBuilder: (context, i) {
                    Food currentFood =
                        allFood[widget.selectedIndex! - 1].food![i];
                    return widget.isVeg == false && currentFood.isVeg == false
                        ? FoodCard(
                            currentFood: currentFood,
                            tableName: widget.tableName!,
                          )
                        : widget.isVeg == true &&
                                allFood[widget.selectedIndex! - 1]
                                        .food![i]
                                        .isVeg ==
                                    true
                            ? FoodCard(
                                currentFood: currentFood,
                                tableName: widget.tableName!,
                              )
                            : Container();
                  },
                ),
              ),
            ],
          );
  }
}
