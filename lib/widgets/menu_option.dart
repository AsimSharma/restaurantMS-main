import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/providers/table/table_provider.dart';
import 'package:restaurantmanagementsystem/screens/order/select_order_sreen.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class MenuOption extends StatelessWidget {
  final String name;
  final String image;
  final int totalGuest;
  final int index, ind;
  const MenuOption({
    Key? key,
    required this.name,
    required this.image,
    required this.totalGuest,
    required this.index,
    required this.ind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allTables =
        Provider.of<TableProvider>(context, listen: false).allTable;
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => SelectOrderScreen(
                      tableName: allTables[index].tables[ind].name,
                      noOfGuest: totalGuest,
                      orderNo: 110,
                      isAdding: false,
                    )));
      },
      child: Container(
        height: 0.17.h(),
        width: 0.22.h(),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kblackColor.withOpacity(0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 0.03.h(),
              width: 0.03.h(),
            ),
            SizedBox(height: 0.01.h()),
            Text(
              name,
              style: TextStyle(
                fontSize: 0.018.res(),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
