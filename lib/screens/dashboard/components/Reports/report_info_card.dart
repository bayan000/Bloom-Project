import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';


class ReportInfoCard extends StatelessWidget {
  const ReportInfoCard({
    Key? key, this.acheivedObjectives, this.unacheivedObjectives, this.investmentPayment, this.suppliedMaterials, this.MaterialsPrice, this.SumOfSails, this.SumOfProfits, this.maintainancePayement, this.Amount_of_wages_and_transactions, this.essintialRecommendations, this.created_at, required this.project_id, required this.user_id, this.title, this.Revenues,


  }) : super(key: key);

  final String? title,acheivedObjectives,unacheivedObjectives,investmentPayment,suppliedMaterials,MaterialsPrice,SumOfSails
  ,SumOfProfits,maintainancePayement,Amount_of_wages_and_transactions,essintialRecommendations,created_at,Revenues;
  final int project_id,user_id;

/*title: "تقرير التنفيذ",
    acheivedObjectives: "ملخص_الأهداف_المحققة",
    unacheivedObjectives: "ملخص_الأهداف_غير_المحققة",
    investmentPayment: "مبلغ_المستثمر",Revenues:"الأرباح_الصافية",
    suppliedMaterials: "المواد_المستلمة",
    MaterialsPrice: "سعر_المواد",
    SumOfSails: "إجمالي_المبيعات",
    SumOfProfits: "صافي_الربح_الكلي",
    maintainancePayement: "مبلغ_الصيانة",
    Amount_of_wages_and_transactions: "مبلغ_الأجور_والمعاملات",
    essintialRecommendations: "التوصيات_الرئيسية",
    created_at:"2024-05-14T19:37:46.000000Z",
    updated_at: "2024-05-14T19:37:46.000000Z",
    project_id: 3,
    user_id:3*/
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [


          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Center(
                    child: Text(
                      title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Center(
                    child: Text(
                      project_id!.toString(),//I'll get the project
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "ملخص الأهداف المحققة",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$acheivedObjectives",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(

                    children: [
                      Text(
                        "ملخص الأهداف غير المحققة",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$unacheivedObjectives",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "المبلغ المستثمر",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$investmentPayment",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "المواد المستلمة",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$suppliedMaterials",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "سعر المواد",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$MaterialsPrice",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "إجمالي المبيعات",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$SumOfSails",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "صافي الربح الكلي",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$SumOfProfits",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "مقدار الصيانة",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$maintainancePayement",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "مبلغ الأجور والمعاملات",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$Amount_of_wages_and_transactions",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "التوصيات الرئيسية",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$essintialRecommendations",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "التوصيات الرئيسية",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$essintialRecommendations",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "العائد",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$Revenues",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "قام بإنشائه",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$user_id",//I'll get the user
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
          //Text(description)
        ],
      ),
    );
  }
}
