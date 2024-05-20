
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../models/communication_request.dart';


class communicationRequestsList extends StatelessWidget {
  const communicationRequestsList({
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
            "طلبات التواصل",
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

                  label: Text("اسم المستثمر", style: communTextStyle24textColor,),

                ),
                DataColumn(
                  label: Text("اسم المشروع", style: communTextStyle24textColor,),
                ),
              ],
              rows: List.generate(
                  20,//project_list_item.length,
                      (index) => communicationRequestDataRow(communicationRequest_list_item[0]) //   (index) => projectDataRow(project_list_item[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow communicationRequestDataRow(communicationRequest cr) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(cr.investor_id!.toString(),style: communTextStyle24black,),//I'll convert this to get the investor's name
            ),
          ],
        ),
      ),
      DataCell(Text(cr.project_id!.toString(),style: communTextStyle24black,)),//I'll convert this to get the project's name
    ],
  );
}