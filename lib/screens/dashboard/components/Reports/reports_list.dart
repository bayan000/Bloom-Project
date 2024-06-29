
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
        if(snapshot.data!.length==0)
          return Center(child:Text("لا توجد تقارير",style: communTextStyle24white));
        else
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