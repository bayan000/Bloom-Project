import 'package:admin/models/project.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../models/transaction.dart';


class TransactionsList extends StatelessWidget {
  const TransactionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "قائمة المعاملات",
            style: TextStyle(color: textColor,
              fontFamily: 'font1',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("المعاملة", style: communTextStyle24textColor,),

                ),

                DataColumn(
                  label: Text("التكلفة", style: communTextStyle24textColor,),
                ),
                DataColumn(
                  label: Text("الحسم", style: communTextStyle24textColor,),
                ),
              ],
              rows: List.generate(
                  20,
                      (index) => transactionDataRow(transaction_list_item[0]) //   (index) => projectDataRow(project_list_item[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow transactionDataRow(transaction t) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(t.name!,style: communTextStyle24black,),
            ),
          ],
        ),
      ),
      DataCell(Text(t.price!.toString(),style: communTextStyle24black,)),
      DataCell(Text(t.discount!,style: communTextStyle24black,)),
    ],
  );
}