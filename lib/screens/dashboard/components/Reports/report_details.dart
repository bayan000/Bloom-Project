import 'package:admin/controllers/ReportsController.dart';
import 'package:admin/models/report.dart';
import 'package:admin/screens/dashboard/components/Reports/report_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';


class ReportDetails extends StatelessWidget {
  const ReportDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Consumer<ReportsController>(
        builder: (context,rc,child) {
          return FutureBuilder<Report>(
            future: rc.fetchReport(rc.report0.projectId, rc.report0.id),
              builder: (context,snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                          borderRadius: BorderRadius.circular(20),
                          // Image border
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
                            "تفاصيل التقرير",
                            style: TextStyle(color: white,
                              fontFamily: 'font1',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding * 0.5),
                        Consumer<ReportsController>(
                            builder: (context, rc, child) {
                              return
                                CircularProgressIndicator();
                            }),

                      ],
                    ),
                  );
                }
                else if(snapshot.hasError)
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
                            child: Image.network('https://freerangestock.com/sample/118703/business-report-vector-icon.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Center(
                            child: Text(
                              "تفاصيل التقرير",
                              style:TextStyle(color: white,
                                fontFamily: 'font1',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding*0.5),

                        Consumer<ReportsController>(
                            builder: (context,rc,child) {
                              if(rc.report0==Null){
                                return CircularProgressIndicator();
                              }
                              else return ReportInfoCard(
                                reportTitle: "title",
                                achievedGoalsSummary: "achievedGoalsSummary",
                                userId: 0,
                                unachievedGoalsSummary:"unachievedGoalsSummary",
                                investorAmount:"investorAmount",
                                receivedMaterials: "receivedMaterials",
                                materialPrice:"materialPrice",
                                totalCosts:"totalCosts",
                                overallNetProfit:"overallNetProfit",
                                maintenanceAmount:"maintenanceAmount",
                                wagesAndTransactionsAmount:"wagesAndTransactionsAmount",
                                projectName:"projectName",
                                mainRecommendations:"mainRecommendations",
                                createdAt:"createdAt",
                                totalRevenue:"totalRevenue",
                                projectId: 1,

                              );
                            }
                        ),
                      ],
                    ),
                  );
                }
                else return Container(
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
                          child: Image.network('https://freerangestock.com/sample/118703/business-report-vector-icon.jpg',
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: defaultPadding),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Center(
                          child: Text(
                            "تفاصيل التقرير",
                            style:TextStyle(color: white,
                              fontFamily: 'font1',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: defaultPadding*0.5),

                      Consumer<ReportsController>(
                        builder: (context,rc,child) {
                          if(rc.report0==Null){
                            return CircularProgressIndicator();
                          }
                          else return ReportInfoCard(
                            reportTitle: snapshot.data!.reportTitle,
                              achievedGoalsSummary: snapshot.data!.achievedGoalsSummary,
                            userId: snapshot.data!.userId!,
                              unachievedGoalsSummary:snapshot.data!.unachievedGoalsSummary,
                              investorAmount: snapshot.data!.investorAmount,
                              receivedMaterials: snapshot.data!.receivedMaterials,
                              materialPrice:snapshot.data!.materialPrice,
                              totalCosts:snapshot.data!.totalCosts,
                              overallNetProfit:snapshot.data!.overallNetProfit,
                              maintenanceAmount:snapshot.data!.maintenanceAmount,
                              wagesAndTransactionsAmount:snapshot.data!.wagesAndTransactionsAmount,
                              projectName:snapshot.data!.projectName,
                              mainRecommendations:snapshot.data!.mainRecommendations,
                              createdAt:snapshot.data!.createdAt,
                              totalRevenue:snapshot.data!.totalRevenue,
                            projectId: snapshot.data!.projectId!,

                          );
                        }
                      ),
                    ],
                  ),
                );
              }

                );
              }

    ),
    );
  }
}
