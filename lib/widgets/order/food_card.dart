// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/food/food_categories.dart';
import 'package:restaurantmanagementsystem/models/order/selected_food.dart';
import 'package:restaurantmanagementsystem/models/spicy/spicey.dart';
import 'package:restaurantmanagementsystem/providers/order/selected_food_provider.dart';
import 'package:restaurantmanagementsystem/widgets/order/customize_inc_dec_button.dart';
import 'package:restaurantmanagementsystem/widgets/order/order_inc_dec_button.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class FoodCard extends StatelessWidget {
  final Food currentFood;
  final String tableName;

  FoodCard({
    Key? key,
    required this.currentFood,
    required this.tableName,
  }) : super(key: key);

  String foodQuantity = '';
  int spicyIndex = 0;
  int orderId = 0;
  int selectedIndex = -1;
  int chooseIndex = 0;
  int choiceAmt = 0;
  int addonAmt = 0;
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<SelectedFoodProvider>(context, listen: true);
    bool isCustomisable = currentFood.isCustomizable!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: isCustomisable
                  ? () {
                      order.individualTotalAmt(currentFood.id!);
                      showFoodDetails(context);
                    }
                  : null,
              child: Image.asset(currentFood.foodImage!),
            ),
            SizedBox(height: 0.01.h()),
            Icon(
              Icons.circle,
              size: 0.009.res(),
              color: currentFood.isVeg! ? kblueColor : kredColor,
            ),
            SizedBox(height: 0.010.h()),
            Text(
              currentFood.foodName!,
              style: TextStyle(
                color: kblueColor,
                fontSize: 0.0135.res(),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isCustomisable ? '' : 'रु ${currentFood.price}',
                    style: TextStyle(
                      color: kblueColor,
                      fontSize: 0.0135.res(),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 0.02.w()),
                  Text(
                    isCustomisable ? "Customisable" : "",
                    style: TextStyle(
                      color: kredColor,
                      fontSize: 0.011.res(),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 0.03.h())
                ],
              ),
            ),
            order.quantity(currentFood.id!) == 0
                ? InkWell(
                    onTap: () {
                      order.addOrder(SelectedFoodModel(
                        foodId: currentFood.id,
                        tableName: tableName,
                        foodName: currentFood.foodName,
                        isVeg: currentFood.isVeg,
                        note: '',
                        price: int.parse(currentFood.price!),
                        quantity: 1,
                      ));
                      order.updateStatus(currentFood.id!);
                      order.amount();
                      order.items();
                      order.quantity(currentFood.id!);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kblackColor.withOpacity(0.2),
                          )),
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          fontSize: 0.016.res(),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                : OrderIncDecButton(
                    foodId: currentFood.id!,
                    name: currentFood.foodName!,
                    isVeg: currentFood.isVeg!,
                    price: currentFood.price!,
                  ),
          ],
        ),
      ),
    );
  }

//Show bottomsheet Food Description
  showFoodDetails(BuildContext context) {
    choiceAmt = currentFood.choiceOptions![0].price!;
    foodQuantity = currentFood.choiceOptions![0].title!;
    final order = Provider.of<SelectedFoodProvider>(context, listen: false);

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints(
          minHeight: 200,
          maxHeight: MediaQuery.of(context).size.height * 0.97,
        ),
        backgroundColor: kwhiteColor.withOpacity(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        size: 0.04.res(),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        order.clearCustFood();
                        order.custTotalAmt(0, 0);
                      },
                    ),
                    SizedBox(height: 0.015.h()),

                    //Conatiner body
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: kwhiteColor,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(0),
                            height: 0.28.h(),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kbgColor,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/momo.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.circle,
                              size: 0.01.res(),
                              color:
                                  currentFood.isVeg! ? kblueColor : kredColor,
                            ),
                            title: Text(
                              currentFood.foodName!,
                              style: TextStyle(
                                fontSize: 0.018.res(),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              currentFood.foodDescription!,
                              style: TextStyle(
                                fontSize: 0.012.res(),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 0.02.h()),
                          const Divider(
                            color: kgreyColor,
                            thickness: 1,
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              minHeight: 300,
                            ),
                            child: Column(
                              children: [
                                //Choose one
                                currentFood.choiceOptions!.isNotEmpty
                                    ? Text(
                                        'Choose one(1/1)*',
                                        style: TextStyle(
                                          fontSize: 0.018.res(),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    : const Text(''),
                                currentFood.choiceOptions!.isNotEmpty
                                    ? Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 10,
                                        ),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              currentFood.choiceOptions!.length,
                                          itemBuilder: (context, i) {
                                            final currentOption =
                                                currentFood.choiceOptions![i];

                                            return InkWell(
                                              onTap: () {
                                                setState(
                                                  () {
                                                    choiceAmt =
                                                        currentOption.price!;
                                                    foodQuantity =
                                                        currentOption.title!;
                                                    chooseIndex = i;
                                                  },
                                                );
                                              },
                                              child: PriceWithRatioButtonOption(
                                                chooseIndex: chooseIndex,
                                                index: i,
                                                option: currentOption.title!,
                                                price: currentOption.price!,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : const Text(''),

                                //addon option
                                currentFood.addons!.isNotEmpty
                                    ? Text(
                                        'Add on',
                                        style: TextStyle(
                                          fontSize: 0.018.res(),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    : const Text(''),

                                currentFood.addons!.isNotEmpty
                                    ? Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 10,
                                        ),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: currentFood.addons!.length,
                                          itemBuilder: (context, i) {
                                            final currentOption =
                                                currentFood.addons![i];
                                            return Consumer<
                                                SelectedFoodProvider>(
                                              builder: (context, value, _) {
                                                return PriceWithRatioButtonAddon(
                                                  foodId: currentFood.id!,
                                                  option: currentOption.title!,
                                                  price: currentOption.price!,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      )
                                    : const Text(''),

                                //Item increase decrease
                                Container(
                                  height: 0.07.h(),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kblueColor,
                                  ),
                                  child: Consumer<SelectedFoodProvider>(
                                    builder: (context, value, _) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          value.custFood.isEmpty
                                              ? InkWell(
                                                  onTap: () {
                                                    value.addCustFood(
                                                      SelectedFoodModel(
                                                        foodId: currentFood.id,
                                                        tableName: tableName,
                                                        foodName: currentFood
                                                            .foodName,
                                                        isVeg:
                                                            currentFood.isVeg,
                                                        note: '',
                                                        isCustomisable:
                                                            currentFood
                                                                .isCustomizable,
                                                        foodQuantity: '',
                                                        addons: {},
                                                        spicyLevel: spicyList[
                                                                spicyIndex]
                                                            .spicyLevel,
                                                        price: int.parse(
                                                            currentFood.price!),
                                                        quantity: 1,
                                                      ),
                                                    );
                                                    order.custTotalAmt(
                                                        choiceAmt, 1);
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 2,
                                                      horizontal: 30,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: kwhiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: kblackColor
                                                              .withOpacity(0.2),
                                                        )),
                                                    child: Text(
                                                      'ADD',
                                                      style: TextStyle(
                                                        fontSize: 0.017.res(),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : CustomizeIncDecButton(
                                                  orderFood: currentFood,
                                                  choiceAmt: choiceAmt,
                                                ),
                                          Consumer<SelectedFoodProvider>(
                                            builder: (context, value, _) {
                                              return Text(
                                                'रु ${value.custTotal.toString()}',
                                                style: TextStyle(
                                                  color: kwhiteColor,
                                                  fontSize: 0.018.res(),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              );
                                            },
                                          ),
                                          InkWell(
                                            onTap: order.custQuantity(
                                                        currentFood.id!) ==
                                                    0
                                                ? () {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Please add item.');
                                                  }
                                                : () {
                                                    order.addOrder(
                                                        SelectedFoodModel(
                                                      foodId: currentFood.id,
                                                      foodName:
                                                          currentFood.foodName,
                                                      quantity:
                                                          order.custQuantity(
                                                              currentFood.id!),
                                                      foodQuantity:
                                                          foodQuantity,
                                                      isVeg: currentFood.isVeg,
                                                      spicyLevel:
                                                          spicyList[spicyIndex]
                                                              .spicyLevel,
                                                      isCustomisable:
                                                          currentFood
                                                              .isCustomizable,
                                                      note: '',
                                                      price: order.custTotal ~/
                                                          order.custQuantity(
                                                              currentFood.id!),
                                                      tableName: tableName,
                                                      addons:
                                                          order.addons.toSet(),
                                                    ));
                                                    Navigator.pop(context);
                                                    order.clearCustFood();
                                                    order.amount();
                                                    order.custTotalAmt(0, 0);
                                                    order.items();
                                                  },
                                            child: Container(
                                              height: 0.04.h(),
                                              width: 0.28.w(),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: kwhiteColor,
                                              ),
                                              child: const Text(
                                                'Order',
                                                style: TextStyle(
                                                  color: kblackColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),

                                //Spicy level
                                Text(
                                  'Spicy Level',
                                  style: TextStyle(
                                    fontSize: 0.018.res(),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.09.h(),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: spicyList.length,
                                    itemBuilder: (context, index) {
                                      bool isCurrentSelection =
                                          spicyIndex == index;
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            spicyIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          padding: const EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: isCurrentSelection
                                                  ? kyellowColor
                                                  : kwhiteColor,
                                              border: Border.all(
                                                color: kblackColor
                                                    .withOpacity(0.2),
                                              )),
                                          child: Text(
                                            spicyList[index].spicyLevel!,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}

//option
class PriceWithRatioButtonOption extends StatelessWidget {
  final int? chooseIndex;
  final int index;
  final String option;
  final int price;

  const PriceWithRatioButtonOption({
    Key? key,
    this.chooseIndex,
    required this.index,
    required this.option,
    required this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: TextStyle(
                fontSize: 0.016.res(),
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  'रु $price',
                  style: TextStyle(
                    fontSize: 0.016.res(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    chooseIndex == index
                        ? Icons.radio_button_checked_outlined
                        : Icons.radio_button_off,
                    color: chooseIndex == index
                        ? kredColor
                        : kblackColor.withOpacity(0.5),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

//Addon
class PriceWithRatioButtonAddon extends StatelessWidget {
  final String option;
  final int price;
  final int foodId;

  const PriceWithRatioButtonAddon({
    Key? key,
    required this.option,
    required this.price,
    required this.foodId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SelectedFoodProvider>(context, listen: false);
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: TextStyle(
                fontSize: 0.016.res(),
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  'रु $price',
                  style: TextStyle(
                    fontSize: 0.016.res(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    data.addAddons(option, foodId);
                    data.isAddonAdded(option, foodId)
                        ? data.addAddonAmt(price)
                        : data.lessAddonAmt(price);
                  },
                  icon: Icon(
                    data.isAddonAdded(option, foodId)
                        ? Icons.radio_button_checked_outlined
                        : Icons.radio_button_off,
                    color: data.isAddonAdded(option, foodId)
                        ? kredColor
                        : kblackColor.withOpacity(0.5),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
