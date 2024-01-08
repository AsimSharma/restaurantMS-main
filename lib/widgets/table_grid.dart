import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/table/tab_bar.dart';
import 'package:restaurantmanagementsystem/providers/table/table_provider.dart';
import 'package:restaurantmanagementsystem/widgets/custom_button.dart';
import 'package:restaurantmanagementsystem/widgets/menu_option.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class TableGrid extends StatefulWidget {
  final int selectedIndex;
  const TableGrid({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<TableGrid> createState() => _TableGridState();
}

class _TableGridState extends State<TableGrid> {
  @override
  Widget build(BuildContext context) {
    final tableProvider = Provider.of<TableProvider>(context);
    final allTables = tableProvider.allTable;
    return Expanded(
      child: widget.selectedIndex == 0
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: allTables.length,
              itemBuilder: (c, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Name
                    SizedBox(height: 0.035.h()),
                    Text(
                      tabData[index + 1].name!,
                      style: TextStyle(
                        fontSize: 0.015.res(),
                        fontWeight: FontWeight.w700,
                        color: kblackColor,
                      ),
                    ),

                    //Table Grid
                    SizedBox(height: 0.013.h()),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 90),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allTables[index].tables.length,
                        itemBuilder: (context, ind) {
                          bool isReserved =
                              allTables[index].tables[ind].isReserved;
                          return InkWell(
                            onTap: () {
                              showBottomSheets(
                                context,
                                ind,
                                index,
                                allTables[index].tables[ind].id,
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: isReserved ? kpinkColor : kwhiteColor,
                              child: Container(
                                height: 0.05.h(),
                                width: 0.01.w(),
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          allTables[index].tables[ind].name,
                                          style: TextStyle(
                                            color: kblueColor,
                                            fontSize: 0.023.res(),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: isReserved
                                              ? kgreyColor.withOpacity(0.8)
                                              : kblueColor,
                                          size: 0.012.res(),
                                        ),
                                        Text(
                                          '${allTables[index].tables[ind].totalCapacity} Person',
                                          style: TextStyle(
                                            fontSize: 0.012.res(),
                                            color: isReserved
                                                ? kgreyColor.withOpacity(0.8)
                                                : kblueColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.035.h()),
                //Name
                Text(
                  allTables[widget.selectedIndex - 1].tableType,
                  style: TextStyle(
                    fontSize: 0.023.h(),
                    fontWeight: FontWeight.w700,
                    color: kblackColor,
                  ),
                ),

                //Table Grid
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 100),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        allTables[widget.selectedIndex - 1].tables.length,
                    itemBuilder: (context, ind) {
                      int totalCapacity = allTables[widget.selectedIndex - 1]
                          .tables[ind]
                          .totalCapacity;
                      bool isReserved = allTables[widget.selectedIndex - 1]
                          .tables[ind]
                          .isReserved;
                      return InkWell(
                        onTap: !isReserved
                            ? () {
                                showBottomSheets(
                                  context,
                                  ind,
                                  widget.selectedIndex - 1,
                                  allTables[widget.selectedIndex - 1]
                                      .tables[ind]
                                      .id,
                                );
                              }
                            : null,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: isReserved ? kpinkColor : kwhiteColor,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      allTables[widget.selectedIndex - 1]
                                          .tables[ind]
                                          .name,
                                      style: TextStyle(
                                        color: kblueColor,
                                        fontSize: 0.023.res(),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: isReserved
                                          ? kgreyColor.withOpacity(0.8)
                                          : kblueColor,
                                      size: 0.012.res(),
                                    ),
                                    Text(
                                      '$totalCapacity Person',
                                      style: TextStyle(
                                        fontSize: 0.012.res(),
                                        color: isReserved
                                            ? kgreyColor.withOpacity(0.8)
                                            : kblueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Future<dynamic> showBottomSheets(
    BuildContext context,
    int ind,
    int index,
    int id,
  ) {
    final tableProvider = Provider.of<TableProvider>(context, listen: false);
    final allTables = tableProvider.allTable;
    int totalPerson = tableProvider.getTotalGuest(id);
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              constraints: BoxConstraints(
                minHeight: 0.2.h(),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(0.02.res()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Cancel Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.cancel, color: kredColor),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),

                    //Info
                    Row(
                      children: [
                        Text(
                          'Guest info',
                          style: TextStyle(
                            fontSize: 0.02.res(),
                          ),
                        ),
                        Text(
                          ' ${allTables[index].tables[ind].name}',
                          style: TextStyle(
                            fontSize: 0.026.res(),
                            color: kblueColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.05.h()),

                    //Total guest
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No of Guest',
                          style: TextStyle(
                            fontSize: 0.02.res(),
                          ),
                        ),
                        Text(
                          '${tableProvider.getTotalGuest(id)}',
                          style: TextStyle(
                            fontSize: 0.02.res(),
                            fontWeight: FontWeight.w500,
                            color: kblueColor,
                          ),
                        ),

                        //Add and remove button
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(
                                maxHeight: 30,
                                maxWidth: 60,
                              ),
                              decoration: BoxDecoration(
                                color: kgreyColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                border: Border.all(
                                  color: kblackColor.withOpacity(0.3),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (totalPerson != 0) {
                                      totalPerson--;
                                      tableProvider.updateGuest(
                                        id,
                                        totalPerson,
                                      );
                                    }
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                maxHeight: 30,
                                maxWidth: 60,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: kgreyColor,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    color: kblackColor.withOpacity(0.3),
                                  )),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (totalPerson <
                                        allTables[index]
                                            .tables[ind]
                                            .totalCapacity) {
                                      totalPerson++;
                                      tableProvider.updateGuest(
                                          id, totalPerson);
                                    } else {}
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    //Button
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            name: tableProvider.isReserved(id)
                                ? 'Unreserve'
                                : "Reserve",
                            color: !tableProvider.isReserved(id)
                                ? kpinkColor
                                : korangeColor,
                            onTap: tableProvider.isReserved(id)
                                ? () {
                                    tableProvider.unReserve(id);
                                    Navigator.pop(context);
                                  }
                                : () {
                                    setState(() {
                                      tableProvider.reserve(id);
                                      Navigator.pop(context);
                                    });
                                  },
                          ),
                        ),
                        SizedBox(width: 0.03.w()),
                        Expanded(
                          child: CustomButton(
                            name: 'Start',
                            onTap: totalPerson == 0
                                ? () {
                                    Fluttertoast.showToast(
                                      msg: 'Total guests cannot be 0.',
                                      toastLength: Toast.LENGTH_SHORT,
                                    );
                                  }
                                : () {
                                    Navigator.pop(context);

                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext con) {
                                        return CustomDialog(
                                          index: index,
                                          ind: ind,
                                          totalGuest: totalPerson,
                                        );
                                      },
                                    );
                                    Provider.of<TableProvider>(
                                      context,
                                      listen: false,
                                    ).reserve(id);
                                  },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CustomDialog extends StatelessWidget {
  final int index, ind, totalGuest;
  const CustomDialog({
    Key? key,
    required this.index,
    required this.ind,
    required this.totalGuest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: const EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 200,
          maxHeight: 0.55.h(),
        ),
        decoration: BoxDecoration(
          color: kwhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Related Order',
                    style: TextStyle(
                      fontSize: 0.018.res(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: kredColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuOption(
                  name: 'Meals',
                  image: 'assets/meals_icon.png',
                  totalGuest: totalGuest,
                  index: index,
                  ind: ind,
                ),
                MenuOption(
                  name: 'Beverages',
                  image: 'assets/beverages_icon.png',
                  totalGuest: totalGuest,
                  index: index,
                  ind: ind,
                ),
              ],
            ),
            MenuOption(
              name: 'Dessert',
              image: 'assets/dessert_icon.png',
              totalGuest: totalGuest,
              index: index,
              ind: ind,
            ),
          ],
        ),
      ),
    );
  }
}
