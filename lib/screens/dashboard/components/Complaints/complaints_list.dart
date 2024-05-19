
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/Articles.dart';
import '../../../../models/complaints.dart';

class ComplaintsList extends StatelessWidget {
  const ComplaintsList({
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
            "الشكاوى",
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
                  label: Text("توصيف الشكوى", style: communTextStyle24textColor,),

                ),

              ],
              rows: List.generate(
                  20,
                      (index) => ComplaintDataRow(complaint_list_item[0]) //   (index) => projectDataRow(project_list_item[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow ComplaintDataRow(Complaint complaint ) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(complaint.description!,style: communTextStyle24black,overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      ),
    ],
  );
}