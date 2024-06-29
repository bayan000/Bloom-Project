

import 'package:admin/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/StatisticsController.dart';
import '../../../../models/Statistics.dart';

class ReportChart extends StatelessWidget {
  const ReportChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<StatisticsController>(
          builder: (context,sc,child) {
            return FutureBuilder<List<ReportsStatistics>>(
                future: sc.fetchReportsStatistics(),
                builder: (context,snapshot) {
                  if(snapshot.hasError||snapshot.connectionState==ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator(),);
                  else
                    return SingleChildScrollView(
                        physics:NeverScrollableScrollPhysics(),child: ColumnOfStatistics(snapshot.data!));
                }
            );
          }
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionData(total_net_profit,total_net_profit_employer,total_net_profit_investor,total_revenue) => [

  PieChartSectionData(
    color:Color(0xFFFFCF26),
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: secondaryColor,
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: buttonColor,
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: white,
    value: 15,
    showTitle: false,
    radius: 16,
  ),

];

Column ColumnOfStatistics(List<ReportsStatistics> r) {
  return Column(
    children: [
      SizedBox(height: defaultPadding),
      for (int i = 0; i < r.length; i++) ...[
        if(r[i].totalRevenue!=0||r[i].totalNetProfit!=0||r[i].totalNetProfitEmployer!=0||r[i].totalNetProfitInvestor!=0)
          Column(children: [Container(
            height: 200, // Adjust height as needed
            width: 200, // Adjust width as needed
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 70,
                      startDegreeOffset: -90,
                      //total_net_profit,total_net_profit_employer,total_net_profit_investor,total_revenue
                      sections: paiChartSelectionData(
                        r[i].totalNetProfit!.toDouble(),
                        r[i].totalNetProfitEmployer!.toDouble(),
                        r[i].totalNetProfitInvestor!.toDouble(),
                        r[i].totalRevenue!.toDouble(),
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: defaultPadding),
                        Text(r[i].month!, style: communTextStyle20white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
            SizedBox(height: defaultPadding),],)


      ],
    ],
  );
}
