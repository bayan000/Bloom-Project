import 'package:admin/models/Statistics.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/Articles/article_details.dart';
import 'package:admin/screens/dashboard/components/Articles/articles_list.dart';
import 'package:admin/screens/dashboard/components/Canvas.dart';
import 'package:admin/screens/dashboard/components/Chat/chat_body.dart';
import 'package:admin/screens/dashboard/components/Communication_Requests/communication_request_details.dart';
import 'package:admin/screens/dashboard/components/Communication_Requests/communication_requests_list.dart';
import 'package:admin/screens/dashboard/components/Complaints/complaint_details.dart';
import 'package:admin/screens/dashboard/components/Complaints/complaints_list.dart';
import 'package:admin/screens/dashboard/components/Investors/investor_details.dart';
import 'package:admin/screens/dashboard/components/Investors/investors_list.dart';
import 'package:admin/screens/dashboard/components/Publishing_Requests/requests_details.dart';
import 'package:admin/screens/dashboard/components/Publishing_Requests/requests_list.dart';
import 'package:admin/screens/dashboard/components/Reports/report_details.dart';
import 'package:admin/screens/dashboard/components/Reports/reports_list.dart';
import 'package:admin/screens/dashboard/components/Statistics/monthlyChart.dart';
import 'package:admin/screens/dashboard/components/Statistics/reports_chart.dart';
import 'package:admin/screens/dashboard/components/Transactions/transaction_details.dart';
import 'package:admin/screens/dashboard/components/Transactions/transactions_list.dart';
import 'package:admin/screens/dashboard/components/TransactionsRequests/ApprovedTransactionsList.dart';
import 'package:admin/screens/dashboard/components/TransactionsRequests/TransactionRequestList.dart';
import 'package:admin/screens/dashboard/components/Workers/worker_details.dart';
import 'package:admin/screens/dashboard/components/Workers/workers_list.dart';
import 'package:admin/screens/dashboard/components/test_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/MenuAppController.dart';
import 'components/Appointment/appointments_list.dart';
import 'components/Appointment/scheduled_appointments.dart';
import 'components/SearchList.dart';
import 'components/Statistics/projectsChart.dart';
import 'components/Transactions/transactions_details_list.dart';
import 'components/TransactionsRequests/TransactionRequestDetails.dart';
import 'components/header.dart';

import 'components/projects_list.dart';
import 'components/project_details.dart';
import 'package:admin/controllers/ProjectsController.dart';

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
          Consumer<MenuAppController>(
          builder: (context,mAC,child){

            if (mAC.screenIndex==12)
              return SizedBox(height: defaultPadding,);
            else return Header();

          }
            ),
            SizedBox(height: defaultPadding),
            Consumer<MenuAppController>(
            builder: (context,mAC,child) {
              if (mAC.screenIndex==0) {
                print("hey it is 0");

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            Canvas(),
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
                        child: Column(
                          children: [
                            ProjectDetails(),

                          ],
                        ),
                      ),
                  ],
                );

              }

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
                              WorkerDetails1(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child:WorkerDetails1(),

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
              else if (mAC.screenIndex==7)
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
              else if(mAC.screenIndex==8){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            RequestsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                          //  if (Responsive.isMobile(context))
                             // RequestsDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    /*if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child:RequestsDetails(),

                      ),*/
                  ],
                );
              }
              //if mAC.screenIndex==9 then we're searching'
              else if(mAC.screenIndex==9){
                print("hey it is 9");
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            //Text('Search'),
                            SearchProjectsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding), //  if (Responsive.isMobile(context))
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      //SearchProjectsList(),
                      SizedBox(width: defaultPadding),

                  ],
                );
              }
              //if mAC.screenIndex==10 then we're viewing transactionsRequests'
               else if(mAC.screenIndex==10){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            TransactionsRequestsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                            TransactionRequestDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                      if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: TransactionRequestDetails(),
                      ),
                  ],
                );
              }
              //if mAC.screenIndex==11 then we're viewing Approved transactionsRequests
              else if(mAC.screenIndex==11 ) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            ApprovedTransactionsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),

                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                  ],
                );
              }
              // then we're chatting

              else if(mAC.screenIndex==12)   {
                return Column(
                  children: [
                    ChatBody(),

                  ],
                );
              }
              else if(mAC.screenIndex==20){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 4,//5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            AppointmentsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),

                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              SizedBox(height: defaultPadding,),
                              ScheduledAppointments(),
                            ],
                          ))
                  ],
                );

              }
              //if mAC.screenIndex==13 ~ then we're viewing  projects

              else{
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
                            // if (Responsive.isMobile(context))
                            //  ProjectDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text("أصحاب العمل",style: TextStyle(color: white,fontFamily: 'font1',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,)),
                            Text("المستثمرين",style: TextStyle(color: Color(0xFFFFCF26),fontFamily: 'font1',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,),),
                            MonthlyChart(),
                            SizedBox(height: defaultPadding,),
                            Text("المشاريع الممولة",style: TextStyle(color: white,fontFamily: 'font1',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,),),
                            Text("كل المشاريع",style: TextStyle(color: Color(0xFFFFCF26),fontFamily: 'font1',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,)),
                            ProjectChart(),
                            SizedBox(height: defaultPadding,),
                            Text("مجموع الأرباح",style: TextStyle(color: Color(0xFFFFCF26),fontFamily: 'font1',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,)),
                            Text("مجموع أرباح صاحب العمل",style: TextStyle(color: secondaryColor,fontFamily: 'font1',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,)),
                            Text("مجموع أرباح المستثمر",style: TextStyle(color: buttonColor,fontFamily: 'font1',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,)),
                            Text("العائد الكلي",style: TextStyle(color: white,fontFamily: 'font1',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,)),
                            ReportChart(),
                            SizedBox(height: defaultPadding,),
                           // Text('لا يوجد مستخدمين أو مشاريع في بقية الأشهر',style: communTextStyle20white,),


                          ],
                        ),
                      ),
                  ],
                );

              }

//Canvas

            })
          ],
        ),
      ),
    );
  }
}
