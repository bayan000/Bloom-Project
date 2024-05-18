
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/Articles.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
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
            "المقالات",
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
                  label: Text("عنوان المقالة", style: communTextStyle24textColor,),

                ),

              ],
              rows: List.generate(
                  20,//project_list_item.length,
                      (index) => ArticleDataRow(Artiles_list_Item[0]) //   (index) => projectDataRow(project_list_item[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow ArticleDataRow(Article article) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(article.name!,style: communTextStyle24black,),
            ),
          ],
        ),
      ),
    ],
  );
}