import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/order/selected_food.dart';
import 'package:restaurantmanagementsystem/providers/order/selected_food_provider.dart';
import 'package:restaurantmanagementsystem/widgets/order/order_inc_dec_button.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class OrderInfo extends StatefulWidget {
  final SelectedFoodModel food;
  final int index;

  const OrderInfo({
    super.key,
    required this.food,
    required this.index,
  });

  @override
  State<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  late TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<SelectedFoodProvider>(context);
    _textController =
        TextEditingController(text: order.getSelectedFood[widget.index].note);
    bool hasNote = order.getSelectedFood[widget.index].note!.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 0.008.res(),
                    color: widget.food.isVeg! ? kblueColor : kredColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.food.foodName!,
                    style: TextStyle(
                      fontSize: 0.015.res(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              OrderIncDecButton(
                foodId: widget.food.foodId!,
                name: widget.food.foodName!,
                isVeg: widget.food.isVeg!,
                price: widget.food.price!.toString(),
              )
            ],
          ),

          //note
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hasNote
                  ? SizedBox(
                      width: 0.65.w(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _textController,
                          onSubmitted: (value) {
                            order.setNote(value, widget.food.foodId!);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kgreyColor,
                            suffixIcon: IconButton(
                              onPressed: () {
                                order.setNote('', widget.food.foodId!);
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: kblackColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kblackColor.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        order.addNote(
                            _textController.text, widget.food.foodId!);
                        order.setNote(' ', widget.food.foodId!);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add_circle_outline,
                            color: kblueColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Add a note",
                            style: TextStyle(
                              color: kblueColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
              Text(
                'रु ${widget.food.price! * widget.food.quantity}',
                style: TextStyle(
                  fontSize: 0.013.res(),
                  fontWeight: FontWeight.w800,
                  color: kblackColor.withOpacity(0.5),
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
            color: kblackColor.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
