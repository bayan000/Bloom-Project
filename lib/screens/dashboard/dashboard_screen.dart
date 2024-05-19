import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/Articles/article_details.dart';
import 'package:admin/screens/dashboard/components/Articles/articles_list.dart';
import 'package:admin/screens/dashboard/components/Communication_Requests/communication_request_details.dart';
import 'package:admin/screens/dashboard/components/Communication_Requests/communication_requests_list.dart';
import 'package:admin/screens/dashboard/components/Complaints/complaint_details.dart';
import 'package:admin/screens/dashboard/components/Complaints/complaints_list.dart';
import 'package:admin/screens/dashboard/components/Investors/investor_details.dart';
import 'package:admin/screens/dashboard/components/Investors/investors_list.dart';
import 'package:admin/screens/dashboard/components/Reports/report_details.dart';
import 'package:admin/screens/dashboard/components/Reports/reports_list.dart';
import 'package:admin/screens/dashboard/components/Transactions/transaction_details.dart';
import 'package:admin/screens/dashboard/components/Transactions/transactions_list.dart';
import 'package:admin/screens/dashboard/components/Workers/worker_details.dart';
import 'package:admin/screens/dashboard/components/Workers/workers_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/MenuAppController.dart';
import 'components/header.dart';

import 'components/projects_list.dart';
import 'components/project_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Consumer<MenuAppController>(
            builder: (context,mAC,child) {
              if (mAC.screenIndex==0)
                return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child:  Column(
                        children: [
                          SizedBox(height: defaultPadding),
                          ProjectsList(),
                          if (Responsive.isMobile(context))
                            SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context))
                            ProjectDetails(),
                        ],
                      )
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: ProjectDetails(),
                  ),
              ],
            );
            else  if (mAC.screenIndex==1)
              {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            ArticlesList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                              ArticleDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: ArticleDetails(),
                      ),
                  ],
                );
              }
              else  if (mAC.screenIndex==2)
              {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            ComplaintsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                              ComplaintDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: ComplaintDetails(),
                      ),
                  ],
                );
              }
              else  if (mAC.screenIndex==3)
              {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            InvestorsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                              InvestorDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: InvestorDetails(),
                      ),
                  ],
                );
              }
              else  if (mAC.screenIndex==4)
              {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            WorkersList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                              WorkerDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child:WorkerDetails(),

                      ),
                  ],
                );
              }
              else  if (mAC.screenIndex==5)
              {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            TransactionsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                              TransactionDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child:TransactionDetails(),

                      ),
                  ],
                );
              }
              else  if (mAC.screenIndex==6)
              {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            ReportsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                              ReportDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child:ReportDetails(),

                      ),
                  ],
                );
              }
              else
              {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            communicationRequestsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                              communicationRequestDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child:communicationRequestDetails(),

                      ),
                  ],
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
