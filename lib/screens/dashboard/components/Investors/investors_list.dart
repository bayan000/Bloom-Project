import 'package:admin/models/investor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';


class InvestorsList extends StatelessWidget {
  const InvestorsList({
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
            "قائمة المستثمرين",
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
                  label: Text("الموقع", style: communTextStyle24textColor,),
                ),
                DataColumn(
                  label: Text("الإيميل", style: communTextStyle24textColor,),
                ),
              ],
              rows: List.generate(
                  20,
                      (index) => investorDataRow(user1_list_item[0]) //   (index) => projectDataRow(project_list_item[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow investorDataRow(user1 user) {
  String? fullname=user.first_name! +" "+ user.last_name!;
  return DataRow(

    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fullname,style: communTextStyle24black,),
            ),
          ],
        ),
      ),
      DataCell(Text(user.location!,style: communTextStyle24black,)),
      DataCell(Text(user.email!,style: communTextStyle24black,)),
    ],
  );
}