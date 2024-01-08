import 'package:flutter/material.dart';
import 'package:printing/printing.dart' as pdf;
import 'package:restaurantmanagementsystem/models/bill/bill_models.dart';
import 'package:restaurantmanagementsystem/screens/pdf/make_pdf.dart';

class PdfPreview extends StatelessWidget {
  final String tableName;
  final BillModel billItem;
  const PdfPreview({
    Key? key,
    required this.tableName,
    required this.billItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: kbgColor,
      //   centerTitle: true,
      //   title: const Text(
      //     'Bill',
      //     style: TextStyle(
      //       color: kblackColor,
      //       fontSize: 20,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      //   iconTheme: const IconThemeData.fallback(),
      // ),
      body: Center(
        child: pdf.PdfPreview(
          build: (format) => makePdf(context, tableName),
        ),
      ),
    );
  }
}
