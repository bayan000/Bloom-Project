import 'package:admin/controllers/workerInfoController.dart';
import 'package:admin/controllers/workersController.dart';
import 'package:admin/screens/dashboard/components/Investors/investor_info_card.dart';
import 'package:admin/screens/dashboard/components/Workers/workerModel.dart';
import 'package:admin/screens/dashboard/components/Workers/worker_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';



class WorkerDetails1 extends StatelessWidget {
  const WorkerDetails1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),

      child: Consumer<WorkersController>(
        builder: (context,workersController,child) {
          WorkerInfoController workerInfoController=WorkerInfoController();
          return FutureBuilder<WorkerDetails>(
            future: workerInfoController.fetchWorkerById(workersController.currWorker.id),
            builder: (context,snapshot) {
              print("id isss "+workersController.currWorker.id.toString());
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
                        ),                        SizedBox(height: defaultPadding),
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

                      WorkerInfoCard(email: 'useremail@gmail.com', location: 'دمشق',
                        firstName: "الاسم",lastName: "الكنية", personal_photo: "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",

                      ),
                    ],
                  ),
                );
              }
              else{
                print(workersController.currWorker.id.toString()+"idyababe");

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

                      Consumer<WorkersController>(
                          builder: (context,workersController,child) {
                            var worker=snapshot.data!.worker!.user;
                            var projects=snapshot.data!.worker!.projects;
                            print(worker!.email.toString()+"emailllllllllllllll");
                            if(workersController.currWorker==null)
                            {
                              print("oh,oh null");
                              return CircularProgressIndicator();
                            }
                            else{
                              print(worker!.email);
                              return WorkerInfoCard(email: worker!.email, location: worker.location,
                                firstName: worker.firstName,lastName: worker.lastName, personal_photo:worker.personalPhoto,
                                projects:projects,
                              );

                            }

                          }
                      )

                    ],
                  ),
                );              }
            }
          );
        }
      ),
    );
  }
}
