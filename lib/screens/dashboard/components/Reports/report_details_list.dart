
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/controllers/ReportsController.dart';
import 'package:admin/screens/dashboard/components/Reports/report_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../models/report.dart';

class ReportDetailsList extends StatelessWidget {
  const ReportDetailsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportsController rc=ReportsController();
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Consumer<ProjectsController>(
          builder: (context,pc,child) {//removed rc controller
          return FutureBuilder<List<Report>>(
              future: rc.fetchProjectReports(pc.project.id),
              builder: (context,snapshot) {

                if(snapshot.connectionState==ConnectionState.waiting||snapshot.hasError)
                {
                  return Container(

                    padding: EdgeInsets.all(defaultPadding),

                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(140), // Image radius
                            child:
                            CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            "تفاصيل التقارير",
                            style:TextStyle(color: white,
                              fontFamily: 'font1',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding*0.5),
                        CircularProgressIndicator(),

                      ],
                    ),
                  );
                }
                else{
                  return ColumnOfReports(snapshot.data!);
                }
              });
        }
      ),
    );
  }

  Column ColumnOfReports(List<Report> reports) {

    return Column(
      children: [
       /* ClipRRect(
          borderRadius: BorderRadius.circular(20), // Image border
          child: SizedBox.fromSize(
            size: Size.fromRadius(140), // Image radius
            child: Image.network('https://freerangestock.com/sample/118703/business-report-vector-icon.jpg',
                fit: BoxFit.cover),
          ),
        ),*/
        SizedBox(height: defaultPadding),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            "تفاصيل التقارير",
            style:TextStyle(color: white,
              fontFamily: 'font1',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: defaultPadding*2),
        for (int i=0;i<reports.length;i++) ...[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              "التقرير ${i+1} ",
              style:TextStyle(color: textColor,
                fontFamily: 'font1',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(defaultPadding),

            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                SizedBox(height: defaultPadding*0.5),
                ReportInfoCard(
                  reportTitle:reports[i].reportTitle,
                  achievedGoalsSummary:reports[i].achievedGoalsSummary,
                  userId:reports[i].userId!,
                  unachievedGoalsSummary:reports[i].unachievedGoalsSummary,
                  investorAmount:reports[i].investorAmount,
                  receivedMaterials:reports[i].receivedMaterials,
                  materialPrice:reports[i].materialPrice,
                  totalCosts:reports[i].totalCosts,
                  overallNetProfit:reports[i].overallNetProfit,
                  maintenanceAmount:reports[i].maintenanceAmount,
                  wagesAndTransactionsAmount:reports[i].wagesAndTransactionsAmount,
                  projectName:reports[i].projectName,
                  mainRecommendations:reports[i].mainRecommendations,
                  createdAt:reports[i].createdAt,
                  totalRevenue:reports[i].totalRevenue,
                  projectId:reports[i].projectId!,

                ),
              ],
            ),
          ),
          SizedBox(height: defaultPadding ),

        ],
      ],
    );

  }
}
