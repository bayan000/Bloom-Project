
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/models/ProjectDetails.dart';
import 'package:admin/screens/dashboard/components/project_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import 'Reports/report_details_list.dart';
import 'Transactions/transactions_details_list.dart';



class ProjectDetails extends StatelessWidget {

  const ProjectDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var investmentStatus;
    var invName;
    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child:
        Consumer<ProjectsController>(
            builder: (context,pc,child) {
                return FutureBuilder<ProjectDetailsWithCanvases>(
                    future: pc.fetchProjectDetails(pc.project.id)!,
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
                            children: [
                              Column(
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
                                  Center(
                                    child: Text(
                                      "تفاصيل المشروع",
                                      style:TextStyle(color: white,
                                        fontFamily: 'font1',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: defaultPadding*0.5),
                                  Center(child: CircularProgressIndicator()),

                                ],
                              ),
                              //put on the reports here
                            ],
                          ),
                        );
                      }

                      else {
                        if(snapshot.data!.data!.investmentStatus==1)
                          investmentStatus="مُستَثمر";
                        else
                          investmentStatus="غير مُستَثمر";
                        if(investmentStatus=="غير مُستَثمر")
                          invName="لا يوجد مستثمر";
                        else
                          invName=snapshot.data!.data!.invName;

                        return Container(
                        padding: EdgeInsets.all(defaultPadding),

                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(70),
                                  //// Image radius
                                  child: Image.network('https://cdn-icons-png.freepik.com/512/182/182687.png',//'https://img.freepik.com/free-vector/flat-illustration-growing-green-plants-from-golden-coins-business-investment-growth-concept_1302-5467.jpg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Center(
                                child: Text(
                                  "تفاصيل المشروع",
                                  style:TextStyle(color: white,
                                    fontFamily: 'font1',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: defaultPadding*0.5),

                            ProjectInfoCard(description:snapshot.data!.data!.description, amount: snapshot.data!.data!.amount!,
                              location:snapshot.data!.data!.location,
                              name:snapshot.data!.data!.name, investment_status:investmentStatus, invName: invName
                              , wName: snapshot.data!.data!.wName,
                              invId: snapshot.data!.data!.investorId!,
                              wId: snapshot.data!.data!.userId!,

                            ),
                            SizedBox(height: defaultPadding,),
                            TransactionDetailsList(),
                            SizedBox(height: defaultPadding,),
                            ReportDetailsList()
                          ],
                        ),
                      );
                      }

                    }
                );



            }
        )
    );
  }
}
