
import 'dart:io';


import 'package:admin/controllers/transactionsRequestsController.dart';
import 'package:admin/models/ApprovedTransactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';


class ApprovedTransactionsList extends StatelessWidget {

  const ApprovedTransactionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionsRequestsController transactionsRequestsController=TransactionsRequestsController();

    Size size =MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FutureBuilder<ApprovedTransactions>(
          future: transactionsRequestsController.fetchApprovedTransactions(),
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
                    "المعاملات المقبولة",
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
                          label: Text("الحالة", style: communTextStyle24textColor,),
                        ),

                      ],
                      rows: List.generate(
                          snapshot!.data!.data?.length ??0,
                              (index) => transactionRequestDataRow(snapshot!.data!.data![index],context,transactionsRequestsController) //   (index) => projectDataRow(project_list_item[index]),
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
  DataRow transactionRequestDataRow(AnApprovedTransaction anApprovedTransaction,BuildContext context,TransactionsRequestsController transactionsRequestsController) {
    return DataRow(
      cells: [
        DataCell(
         Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child:anApprovedTransaction.name!=null? Text(anApprovedTransaction.name!, style: communTextStyle24black,):
                      Text("", style: communTextStyle24black,)
                    ),
                  ],
                )
        ),
        DataCell(anApprovedTransaction.price!=null? Text(anApprovedTransaction.price!, style: communTextStyle24black,):
        Text("", style: communTextStyle24black,)   ),
        DataCell(anApprovedTransaction.discount!=null? Text(anApprovedTransaction.discount!, style: communTextStyle24black,):
        Text("", style: communTextStyle24black,)   ),
        DataCell(anApprovedTransaction.ProjectName!=null? Text(anApprovedTransaction.ProjectName!, style: communTextStyle24black,):
        Text("", style: communTextStyle24black,)   ),
        DataCell(anApprovedTransaction.status!=null? Text(anApprovedTransaction.status!, style: communTextStyle24black,):
        Text("", style: communTextStyle24black,)   ),



      ],
    );
  }


}



