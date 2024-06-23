
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/ReportsController.dart';
import '../../../../models/report.dart';


class ReportsList extends StatelessWidget {
  const ReportsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportsController reportsController= ReportsController();
    Size size =MediaQuery.of(context).size;

    return Container( padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),

      child: FutureBuilder<List<Report>>(
        future: reportsController.fetchReports(),
          builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting)
      {return Column(
      children: [
      SizedBox(height: size.height*0.37,),
      Container(
      height: size.height*0.5,
      alignment: AlignmentDirectional.bottomCenter,
      child: Center(child: Column(children: [
      CircularProgressIndicator(),
      SizedBox(height: size.height*0.01,),
      Text('loading...',style: TextStyle(fontSize: 15),),],)),),
      ],

      );}
      if(snapshot.hasError)
      {
      return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
      }
      else{
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
                      snapshot.data?.length ??0,
                          (index) => reportDataRow(snapshot.data![index]) //   (index) => projectDataRow(project_list_item[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      }
        }
      ),
    );
  }
}
/*DataRow ArticleDataRow(Article article,BuildContext context) {
  Size size =MediaQuery.of(context).size;
  ArticlesController articlesController=ArticlesController();
  return DataRow(
    cells: [
      DataCell(
        Consumer<ArticlesController>(
        builder: (context,ac,child) {
          return InkWell( // Wrap DataCell with InkWell
          onTap: (){
          ac.curr_article(article);
          print(article.id.toString()+"article iddddddddd");
          print(formatDateString(ac.article0.updatedAt.toString()));
          },
            child: Row(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(article.name!,style: communTextStyle24black,),
                ),
              ],
            ),
          );
        }
      ),
      ),
      DataCell(SizedBox(width: size.width*0.34,)
      ),
      DataCell(
        Consumer<MenuAppController>(
            builder: (context,mc,child) {
              return IconButton(
                  icon: Icon(Icons.delete, color: white),
                  onPressed: () async {
                    //print(project.id);
                    EasyLoading.show(status: 'Loading....');
                    final r = await articlesController.deleteArticle(article.id);
                    if (r == 200)
                      EasyLoading.showSuccess("Done");
                    else
                      EasyLoading.showError('Something must have gone wrong');
                    mc.UpdateScreenIndex(1);
                  });
            }
        ),)

    ],
  );
}*/
DataRow reportDataRow(Report r) {
  ReportsController reportsController=ReportsController();
  return DataRow(
    cells: [
      DataCell(
        Consumer<ReportsController>(
          builder: (context,rc,child) {
            return InkWell(
              onTap: (){
                rc.curr_report(r);
              },
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(r.reportTitle!,style: communTextStyle24black,),
                  ),
                ],
              ),
            );
          }
        ),
      ),
      DataCell(Text(r.projectName!.toString(),style: communTextStyle24black,)),//I have to change this to get the project name right
    ],
  );
}