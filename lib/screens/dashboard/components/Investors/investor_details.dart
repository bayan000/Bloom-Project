import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/controllers/investor_controller.dart';
import 'package:admin/models/project_list.dart';
import 'package:admin/screens/dashboard/components/Investors/investor_info_card.dart';
import 'package:admin/screens/dashboard/components/Investors/one_investor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/aninvestorController.dart';



class InvestorDetails extends StatelessWidget {
  const InvestorDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child:  Consumer<InvestorsController>(
          builder: (context,IS,child) {
            InvestorController investorController=InvestorController();
          return FutureBuilder<AnInvestor>(
              future: investorController.fetchInvestorById(IS.currInvestor.id)
              ,builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
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
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Center(
                        child: Text(
                          "التفاصيل",
                          style:TextStyle(color: white,
                            fontFamily: 'font1',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding*0.5),

                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
            else if(snapshot.hasError){
              print("error"+snapshot.error.toString());
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
                        child: Image.network('https://news.crunchbase.com/wp-content/uploads/2020/10/Bank_Rebundle.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Center(
                        child: Text(
                          "التفاصيل",
                          style:TextStyle(color: white,
                            fontFamily: 'font1',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding*0.5),

                    InvestorInfoCard(email: 'useremail@gmail.com', location: 'دمشق',
                      firstName: "الاسم",lastName: "الكنية", personal_photo: "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",

                    ),
                  ],
                ),
              );
            }
            else{
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
                        child: Image.network('https://news.crunchbase.com/wp-content/uploads/2020/10/Bank_Rebundle.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Center(
                        child: Text(
                          "التفاصيل",
                          style:TextStyle(color: white,
                            fontFamily: 'font1',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding*0.5),

                    Consumer<InvestorsController>(
                        builder: (context,IS,child) {
                        var investor=snapshot.data!.investorInfo!.investor;
                        var projects=snapshot.data!.investorInfo!.projects;
                          if(IS.currInvestor==null)
                            {
                              print("oh,oh null");
                              return CircularProgressIndicator();
                            }
                          else{
                            print(investor!.email);
                            return InvestorInfoCard(email: investor!.email, location: investor.location,
                              firstName: investor.firstName,lastName: investor.lastName, personal_photo:investor.personalPhoto,
                              projects:projects,
                            );

                          }

                        }
            )

                  ],
                ),
              );
            }
          }
          );
        }
      ),
    );
}
}
