import 'package:admin/models/report.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';


class ReportsList extends StatelessWidget {
  const ReportsList({
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
            "التقارير الخاصة بالمشاريع",
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
                  label: Text("عنوان التقرير", style: communTextStyle24textColor,),

                ),
                DataColumn(
                  label: Text("اسم المشروع", style: communTextStyle24textColor,),
                ),

              ],
              rows: List.generate(
                  20,
                      (index) => reportDataRow(report_list_item[0]) //   (index) => projectDataRow(project_list_item[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow reportDataRow(report r) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(r.title!,style: communTextStyle24black,),
            ),
          ],
        ),
      ),
      DataCell(Text(r.project_id!.toString(),style: communTextStyle24black,)),//I have to change this to get the project name right
    ],
  );
}