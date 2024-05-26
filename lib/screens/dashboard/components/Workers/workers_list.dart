import 'package:admin/controllers/workersController.dart';
import 'package:admin/models/investor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../models/workers.dart';


class WorkersList extends StatelessWidget {
  const WorkersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    WorkersController workersController=WorkersController();
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FutureBuilder<List<Worker>>(
        future: workersController.fetchWorkers(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Column(
                  children: [
                    SizedBox(height: size.height*0.37,),
                    Container(
                      height: size.height*0.5,
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Center(child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: size.height*0.01,),
                        Text('loading...',style: TextStyle(fontSize: 15),),],)),),
                  ],

                );
              }
            if(snapshot.hasError){
              return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
            }
            else{
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "قائمة المستخدمين",
                    style: TextStyle(color: textColor,
                      fontFamily: 'font1',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columnSpacing: defaultPadding,
                      // minWidth: 600,
                      columns: [
                        DataColumn(
                          label: Text("اسم المستخدم", style: communTextStyle24textColor,),

                        ),
                        DataColumn(
                          label: Text("الموقع", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("الإيميل", style: communTextStyle24textColor,),
                        ),
                      ],
                      rows: List.generate(
                        /*snapshot.data?.length ??0,
                              (index) => investorDataRow(snapshot.data![index])*/
                          snapshot.data?.length ??0,
                              (index) => workerDataRow(snapshot.data![index]) //   (index) => projectDataRow(project_list_item[index]),
                      ),
                    ),
                  ),
                ],
              );

            }
        }
      ),
    );
  }
}

DataRow workerDataRow(Worker worker) {
  String? fullname=worker.firstName! +" "+ worker.lastName!;
  return DataRow(

    cells: [
      DataCell(
        Consumer<WorkersController>(
          builder: (context,workersController,child)
  {
    return
      InkWell(
        onTap: () {
          workersController.curr_Worker(worker);
          workersController.currWorker.id=worker.id;

        },
        child: Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fullname, style: communTextStyle24black,),
            ),
          ],
        ),
      );
  })),
      DataCell(Text(worker.location!=null? worker.location!.toString(): "لم يُحدد الموقع",style: communTextStyle24black,)),
      DataCell(Text(worker.email!=null? worker.email!.toString(): "لا يتوفر بريد إلكتروني",style: communTextStyle24black,)),
    ],
  );
}