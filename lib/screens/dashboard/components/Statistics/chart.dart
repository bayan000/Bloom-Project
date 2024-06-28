import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Monthly_statistics extends StatelessWidget {
  const Monthly_statistics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  "month",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 0.5,
                  ),
                ),
                SizedBox(height: defaultPadding),

                Text("2024-06",style: communTextStyle20white,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}/*
List<int> countRadius(value1,value2){
  var total=(value1+value2);
  var percentage1=(value1*100)/total;
  var percentage2=(value2*100)/total;
  List<int> values=[];
  values.add(percentage1);
  values.add(percentage2);
return values;
}*/
List<PieChartSectionData> paiChartSelectionData = [
  /*PieChartSectionData(
    color: primaryColor,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 22,
  ),*/
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 2,
    showTitle: false,
    radius: 19,
  ),
  /*PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 16,
  ),*/
  PieChartSectionData(
    color: white,//primaryColor.withOpacity(0.1),
    value: 4,
    showTitle: false,
    radius: 13,
  ),
];