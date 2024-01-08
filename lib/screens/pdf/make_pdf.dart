import 'dart:typed_data';
import 'package:flutter/material.dart' as mat;
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurantmanagementsystem/models/bill/bill_models.dart';
import 'package:restaurantmanagementsystem/providers/bill/bill_provider.dart';

Future<Uint8List> makePdf(mat.BuildContext context, String tableName) {
  final pdf = Document();
  final bill = Provider.of<BillProvider>(context, listen: false);
  BillModel billItem = bill.getBillItem(tableName);
  int serviceTax = 40;
  //grand total amount
  double grandTotal = (bill.totalAmt(tableName) +
      serviceTax +
      (bill.totalAmt(tableName) * 0.13));

  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'BRO RESTRAURANT & BAR',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'BRO RESTAURANT & BAR SINCE 2000',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            Text(
              'Bharatpur-4, Lankhu, Chitwan',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              'contact: +977 9876550000',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Name: ',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date : ${DateFormat('yyyy-MM-dd').format(DateTime.now())}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Dine in: 5",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cashier: 1",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Bill No: 110",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Items",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Quantity",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Price",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Amount",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 100),
              child: ListView.builder(
                itemCount: billItem.items!.length,
                itemBuilder: (context, index) {
                  BillItem currentItem = billItem.items![index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${currentItem.name}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${currentItem.quantity}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${currentItem.amount}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${(currentItem.quantity!) * (currentItem.amount!)}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Total",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Service Tax -> $serviceTax",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "VAT 13%",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${bill.totalAmt(tableName)}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "$serviceTax",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "${bill.totalAmt(tableName) * 0.13}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Grand Total",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 30),
                Text(
                  "$grandTotal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 15),
            Center(
              child: Text('!!!  THANK YOU  !!!  VISIT AGAIN  !!!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}
