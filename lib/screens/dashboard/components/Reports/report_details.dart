import 'package:admin/screens/dashboard/components/Reports/report_info_card.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


class ReportDetails extends StatelessWidget {
  const ReportDetails({
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
          ReportInfoCard(
              title: "تقرير التنفيذ",
              acheivedObjectives: "الأهداف محققة",
              unacheivedObjectives: "الأهداف كلها المحققة",
              investmentPayment: "500",
              Revenues:"900",
              suppliedMaterials: "الكثير من المواد المستلمة",
              MaterialsPrice: "300",
              SumOfSails: "1400",
              SumOfProfits: "400",
              maintainancePayement: "40",
              Amount_of_wages_and_transactions: "20",
              essintialRecommendations: "لا توجد توصيات",
              created_at:"2024-05-14T19:37:46.000000Z",
              project_id: 3,
              user_id:3
          ),
        ],
      ),
    );
  }
}
