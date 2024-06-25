
import 'dart:io';

import 'package:admin/controllers/transactionsController.dart';
import 'package:admin/controllers/transactionsRequestsController.dart';
import 'package:admin/models/TransactionsRequests.dart';
import 'package:admin/screens/dashboard/components/TransactionsRequests/TransactionRequestDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';


class TransactionsRequestsList extends StatelessWidget {

  const TransactionsRequestsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
TransactionsRequestsController transactionsRequestsController =TransactionsRequestsController();
Size size =MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FutureBuilder<TransactionsRequests>(
          future: transactionsRequestsController.fetchTransactions(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
            {return Column(
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

            );}
            if(snapshot.hasError)
            {
              return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
            }
            else{
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "طلبات المعاملات",
                    style: TextStyle(color: textColor,
                      fontFamily: 'font1',
                      fontSize: 26,
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
                          label: Text("المعاملة", style: communTextStyle24textColor,),

                        ),

                        DataColumn(
                          label: Text("التكلفة", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("الحسم", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("اسم المشروع", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("", style: communTextStyle24textColor,),
                        ),

                      ],
                      rows: List.generate(
                          snapshot!.data!.transactionRequest?.length ??0,
                              (index) => transactionRequestDataRow(snapshot!.data!.transactionRequest![index],context) //   (index) => projectDataRow(project_list_item[index]),
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
  DataRow transactionRequestDataRow(TransactionRequest t,BuildContext context) {
    TransactionsRequestsController transactionsRequestsController=TransactionsRequestsController();
    return DataRow(
      cells: [
        DataCell(
          Consumer<TransactionsRequestsController>(
              builder: (context,trc,child) {
                return InkWell(
                  onTap: (){
                    trc.curr_transactionRequest(t);
                    trc.updatePressed(1);},
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Text(t.transaction!.name!, style: communTextStyle24black,),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
        DataCell(Text(t.transaction!.price!.toString(), style: communTextStyle24black,)),
        DataCell(Text(t.transaction!.discount!, style: communTextStyle24black,)),
        DataCell(Text(t.transaction!.ProjectName!, style: communTextStyle24black,)),
    t.transaction!.status=="pending"?      DataCell(
          Consumer<MenuAppController>(
              builder: (context,mc,child) {
                return IconButton(
                    icon: Icon(Icons.check, color: white),
                    onPressed: () async{
                      EasyLoading.show(status: 'Loading....');
                      final r=await transactionsRequestsController.approveTransaction(t.transaction!.id);
                      if(r==200)
                      {
                        EasyLoading.showSuccess("Done");}
                      else
                        EasyLoading.showError('Something must have gone wrong');
                      mc.UpdateScreenIndex(10);
                    }
                    
                );
              }
          ),
        )
            :      DataCell(
          IconButton(
                    icon: Icon(Icons.check, color: textColor), // Adjust icon and color as needed
                    onPressed: () {
                      EasyLoading.showSuccess("Request Has been already accepted",duration: Duration(seconds: 2));}

                )

        )

      ],
    );
  }


}



