import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/food/food_categories.dart';
import 'package:restaurantmanagementsystem/widgets/custom_box.dart';
import 'package:restaurantmanagementsystem/widgets/order/food_categories.dart';
import 'package:restaurantmanagementsystem/widgets/shared/search_box.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class SelectOrderScreenWidget extends StatefulWidget {
  final String tableName;
  const SelectOrderScreenWidget({Key? key, required this.tableName})
      : super(key: key);

  @override
  State<SelectOrderScreenWidget> createState() =>
      _SelectOrderScreenWidgetState();
}

class _SelectOrderScreenWidgetState extends State<SelectOrderScreenWidget> {
  int _currentIndex = 0;
  bool _isVeg = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search Box
            Row(
              children: [
                SearchBox(
                  label: 'Search by Cusine Name',
                  width: 0.6.w(),
                ),
                SizedBox(width: 0.015.h()),
                Expanded(
                  child: Row(children: [
                    Text(
                      "Veg only",
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isVeg = !_isVeg;
                        });
                      },
                      icon: Icon(
                        Icons.radio_button_checked_outlined,
                        color: _isVeg ? kblueColor : kredColor,
                      ),
                    )
                  ]),
                ),
              ],
            ),

            //Categories
            SizedBox(
              height: 0.07.h(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: CustomBox(
                        name: categories[index],
                        isSelected: _currentIndex == index,
                      ),
                    ),
                  );
                },
              ),
            ),

            //Screens
            FoodCategoriesAll(
              selectedIndex: _currentIndex,
              isVeg: _isVeg,
              tableName: widget.tableName,
            ),
          ],
        ),
      ),
    );
  }
}
