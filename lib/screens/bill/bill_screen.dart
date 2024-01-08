import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/bill/bill_models.dart';
import 'package:restaurantmanagementsystem/providers/bill/bill_provider.dart';
import 'package:restaurantmanagementsystem/screens/pdf/pdf_preview.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({Key? key}) : super(key: key);
  final int currentBill = 0;
  final tableName = '1A';

  @override
  Widget build(BuildContext context) {
    final bill = Provider.of<BillProvider>(context);
    BillModel billItem = bill.getBillItem(tableName);

    return Scaffold(
      backgroundColor: kbgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kbgColor,
        iconTheme: const IconThemeData.fallback(),
        title: Text(
          'Details',
          style: TextStyle(
            fontSize: 0.02.res(),
            color: kblackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PdfPreview(
                        tableName: tableName,
                        billItem: billItem,
                      )));
            },
            icon: const Icon(Icons.print),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                          'Table $tableName',
                          style: TextStyle(
                            fontSize: 0.013.res(),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const VerticalDivider(
                          color: kblackColor,
                        ),
                        Text(
                          '${bill.totalQuantity(tableName)} Items',
                          style: TextStyle(
                            fontSize: 0.011.res(),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Order 130+134',
                    style: TextStyle(
                      fontSize: 0.012.res(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.013.h()),
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
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: billItem.items!.length,
                    itemBuilder: (context, index) {
                      final currentBillItem = billItem.items![index];
                      bool hasNote = currentBillItem.note != '';
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentBillItem.name!,
                                    style: TextStyle(
                                      fontSize: 0.0123.res(),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  hasNote
                                      ? Container(
                                          padding: const EdgeInsets.all(8),
                                          width: 0.4.w(),
                                          decoration: BoxDecoration(
                                            color: kgreyColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),

                                          //Note
                                          child: Text(
                                            currentBillItem.note!,
                                            style: TextStyle(
                                              color:
                                                  kblackColor.withOpacity(0.5),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            //Quantity
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${currentBillItem.quantity}',
                                style: TextStyle(
                                  fontSize: 0.013.res(),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${currentBillItem.quantity! * currentBillItem.amount!}',
                                style: TextStyle(
                                  fontSize: 0.013.res(),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: kblackColor.withOpacity(0.2),
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 0.014.res(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Service Tax",
                            style: TextStyle(
                              fontSize: 0.014.res(),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "VAT 13%",
                            style: TextStyle(
                              fontSize: 0.014.res(),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Grand Total",
                            style: TextStyle(
                              fontSize: 0.017.res(),
                              color: kblueColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 0.1.w()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "रु ${bill.totalAmt(tableName)}",
                              style: TextStyle(
                                fontSize: 0.014.res(),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "रु ${bill.serviceTax}",
                              style: TextStyle(
                                fontSize: 0.014.res(),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "रु ${(bill.totalAmt(tableName) * bill.vat).toStringAsFixed(1)}",
                              style: TextStyle(
                                fontSize: 0.014.res(),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "रु ${(bill.totalAmt(tableName) + bill.serviceTax + bill.totalAmt(tableName) * bill.vat).toInt()}",
                              style: TextStyle(
                                fontSize: 0.017.res(),
                                color: kblueColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
