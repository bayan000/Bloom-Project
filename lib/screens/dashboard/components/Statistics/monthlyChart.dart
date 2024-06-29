import 'package:admin/controllers/StatisticsController.dart';
import 'package:admin/models/Statistics.dart';
import 'package:admin/models/investor.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';


class MonthlyChart extends StatelessWidget {
  const MonthlyChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Consumer<StatisticsController>(
        builder: (context,sc,child) {
          return FutureBuilder<List<MonthlyStatistics>>(
            future: sc.fetchMonthlyStatistics(),
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

List<PieChartSectionData> paiChartSelectionData(investors,users) => [

  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: investors,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: white,
    value: users,
    showTitle: false,
    radius: 16,
  ),

];

Column ColumnOfStatistics(List<MonthlyStatistics> m) {
  return Column(
    children: [
      SizedBox(height: defaultPadding),
      for (int i = 0; i < m.length; i++) ...[
        if(m[i].users!=0||m[i].investors!=0)
        Column(children: [
          Container(
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
                    sections: paiChartSelectionData(
                      m[i].investors!.toDouble(),
                      m[i].users!.toDouble(),
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: defaultPadding),
                      Text(m[i].month!, style: communTextStyle20white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
          SizedBox(height: defaultPadding),

        ],
        )
        else if(m[i].users==0||m[i].investors==0)
          Column(children: [Container(
  height: 200, // Adjust height as needed
  width: 200, // Adjust width as needed

            child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Center(child: Text('No Data In Rest Months',style: communTextStyle20white,),)
                    ),
          ),
          SizedBox(height: defaultPadding),],)



      ],
    ],
  );
}
