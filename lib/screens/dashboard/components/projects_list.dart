import 'package:admin/models/project.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({
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
            "قائمة المشاريع",
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
                  label: Text("اسم المشروع", style: communTextStyle24textColor,),

                ),
                DataColumn(
                  label: Text("الموقع", style: communTextStyle24textColor,),
                ),
                DataColumn(
                  label: Text("التكلفة", style: communTextStyle24textColor,),
                ),
              ],
              rows: List.generate(
                20,//project_list_item.length,
                      (index) => projectDataRow(project_list_item[0]) //   (index) => projectDataRow(project_list_item[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow projectDataRow(project fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.description!,style: communTextStyle24black,),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.location!,style: communTextStyle24black,)),
      DataCell(Text(fileInfo.amount!,style: communTextStyle24black,)),
    ],
  );
}