
import 'package:admin/controllers/CommunicationRequestsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';
import '../../../../models/CommunicationRequests.dart';
import '../../../../models/communication_request.dart';


class communicationRequestsList extends StatelessWidget {
  const communicationRequestsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Consumer<CommunicationRequestsController>(
        builder: (context,cr,child) {
          return FutureBuilder(
            future: cr.fetchCommunicationRequests(),
            builder: (context,snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
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
              if(snapshot.hasError)
              {
                return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "طلبات التواصل",
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

                          label: Text("اسم المستثمر", style: communTextStyle24textColor,),

                        ),
                        DataColumn(
                          label: Text("اسم المشروع", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("قبول الطلب", style: communTextStyle24textColor,),
                        ),
                      ],
                      rows: List.generate(
                          snapshot.data?.length ??0,
                          (index) => communicationRequestDataRow(snapshot.data![index]) //   (index) => projectDataRow(project_list_item[index]),
                      ),
                    ),
                  ),
                ],
              );
            }
          );
        }
      ),
    );
  }
}

DataRow communicationRequestDataRow(CommunicationRequestModelForFullInfo cr) {
  CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
  return DataRow(
    cells: [
      DataCell(
        Consumer<CommunicationRequestsController>(
          builder: (context,comreq,child) {
            return InkWell(
                onTap: (){
                  comreq.curr_requets(cr);
                },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(cr.investorName.toString(),style: communTextStyle24black,),
                  ),
                ],
              ),
            );
          }
        ),
      ),
      DataCell(Text(cr.projectName.toString(),style: communTextStyle24black,)),
cr.status==0?      DataCell(
  Consumer<MenuAppController>(
      builder: (context,mc,child) {
        return IconButton(
            icon: Icon(Icons.check, color: white), // Adjust icon and color as needed
            onPressed: () async{
              EasyLoading.show(status: 'Loading....');
              final r=await communicationRequestsController.acceptCommunicationRequest(cr.id);
              if(r==200)
              {
                EasyLoading.showSuccess("Done");}
              else
                EasyLoading.showError('Something must have gone wrong');
              mc.UpdateScreenIndex(7);
            }
        );
      }
  ),
)
:      DataCell(
  Consumer<MenuAppController>(
      builder: (context,mc,child) {
        return IconButton(
            icon: Icon(Icons.check, color: textColor), // Adjust icon and color as needed
            onPressed: () {
              EasyLoading.showSuccess("Request Has been already accepted",duration: Duration(seconds: 2));}

        );
      }
  ),
)

    ],
  );
}