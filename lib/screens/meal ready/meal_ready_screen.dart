import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/providers/meal%20taken/meals_taken_provider.dart';
import 'package:restaurantmanagementsystem/screens/navigation.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class MealReadyScreen extends StatelessWidget {
  const MealReadyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<MealsTakenProvider>(context);
    return Scaffold(
      backgroundColor: kbgColor,
      appBar: AppBar(
        backgroundColor: kbgColor,
        iconTheme: const IconThemeData.fallback(),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Details',
          style: TextStyle(
            color: kblackColor,
            fontSize: 0.018.res(),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: kblackColor.withOpacity(0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          'Table 2A',
                          style: TextStyle(
                            fontSize: 0.013.res(),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const VerticalDivider(
                          color: kblackColor,
                        ),
                        Text(
                          '6 Items',
                          style: TextStyle(
                            fontSize: 0.01.res(),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Order 130',
                    style: TextStyle(
                      fontSize: 0.01.res(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              constraints: const BoxConstraints(
                minHeight: 50,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: kblackColor.withOpacity(0.5),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: meals.getOrderedItem[0].meals!.length,
                itemBuilder: (context, index) {
                  bool hasNote =
                      meals.getOrderedItem[0].meals![index].note! != '';
                  bool isSelected =
                      meals.getOrderedItem[0].meals![index].isSelected! == true;
                  return ListTile(
                    onTap: () {
                      meals.selectItem(
                          meals.getOrderedItem[0].meals![index].id!);
                      meals.totalSelectedItem(0);
                    },
                    leading: Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color:
                          isSelected ? kredColor : kblackColor.withOpacity(0.5),
                    ),
                    title: Text(
                      meals.getOrderedItem[0].meals![index].name!,
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: hasNote
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              color: kgreyColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              meals.getOrderedItem[0].meals![index].note!,
                              style: TextStyle(
                                color: kblackColor.withOpacity(0.5),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    trailing: Text(
                      meals.getOrderedItem[0].meals![index].quantity!
                          .toString(),
                      style: TextStyle(
                        fontSize: 0.013.res(),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 0.1.h(),
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: kblackColor.withOpacity(0.5),
            ),
          ),
          color: kgreyColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    meals.selectAllItem(0);
                    meals.totalSelectedItem(0);
                  },
                  icon: Icon(
                    meals.isAllSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: meals.isAllSelected
                        ? kredColor
                        : kblackColor.withOpacity(0.5),
                  ),
                ),
                Text(
                  'All',
                  style: TextStyle(
                    color: kblackColor.withOpacity(0.5),
                    fontSize: 0.012.res(),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Selected Items   ',
                  style: TextStyle(
                    color: kblackColor.withOpacity(0.5),
                    fontSize: 0.012.res(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${meals.totalSelected}   ',
                  style: TextStyle(
                    color: kblackColor,
                    fontSize: 0.015.res(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const NavigationScreen()));
                    if (meals.totalSelected ==
                        meals.getOrderedItem[0].meals!.length) {}
                  },
                  child: Container(
                    height: 0.06.h(),
                    width: 0.28.w(),
                    margin: const EdgeInsets.all(9),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kblueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Taken',
                      style: TextStyle(
                        color: kwhiteColor,
                        fontSize: 0.014.res(),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
