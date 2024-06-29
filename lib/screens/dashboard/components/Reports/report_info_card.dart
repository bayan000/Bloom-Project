import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';
import '../../../../controllers/ProjectsController.dart';
import '../../../../models/project_list.dart';


class ReportInfoCard extends StatelessWidget {
  const ReportInfoCard({
    Key? key,this.projectName, this.achievedGoalsSummary, this.unachievedGoalsSummary, this.investorAmount, this.receivedMaterials, this.materialPrice, this.totalCosts, this.overallNetProfit, this.maintenanceAmount, this.wagesAndTransactionsAmount, this.mainRecommendations, this.createdAt, required this.projectId, required this.userId, this.reportTitle, this.totalRevenue,


  }) : super(key: key);

  final String? reportTitle,achievedGoalsSummary,unachievedGoalsSummary,investorAmount,
      receivedMaterials,materialPrice,totalCosts
  ,overallNetProfit,maintenanceAmount,wagesAndTransactionsAmount,projectName,
      mainRecommendations,createdAt,totalRevenue;
  final int projectId,userId;

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

                  Column(
                    children: [
                      Text(
                        "عنوان التقرير",
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$reportTitle",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "اسم المشروع",
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Consumer<MenuAppController>(
                          builder: (context,mc,child) {
                          return Consumer<ProjectsController>(
                              builder: (context,pc,child) {
                              return InkWell(
                                onTap: (){
                                  pc.pressed=1;
                                  pc.curr_project(Project(id: projectId));
                                  mc.UpdateScreenIndex(0);
                                },
                                child: Text(
                                  "$projectName",
                                  style:TextStyle(color: white,
                                    fontFamily: 'font1',
                                    fontSize: 22,
                                  ),
                                  softWrap: true,
                                ),
                              );
                            }
                          );
                        }
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "ملخص الأهداف المحققة",
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$achievedGoalsSummary",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$unachievedGoalsSummary",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$investorAmount",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$receivedMaterials",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$materialPrice",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "إجمالي الكلف",
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$totalCosts",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$overallNetProfit",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$maintenanceAmount",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$wagesAndTransactionsAmount",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$mainRecommendations",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22
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
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$totalRevenue",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                        ),
                        softWrap: true,
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),

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
