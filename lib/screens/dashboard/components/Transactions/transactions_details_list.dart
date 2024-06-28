
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/screens/dashboard/components/Transactions/transaction_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/transactionsController.dart';
import '../../../../models/TransactionsForEachProject.dart';

class TransactionDetailsList extends StatelessWidget {
  const TransactionDetailsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Consumer<ProjectsController>(
          builder: (context,pc,child) {
            return FutureBuilder<TransactionsForEachProject>(
            future: pc.fetchTransactionsForEachProject(pc.project.id),
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
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  "تفاصيل المعاملات",
                  style:TextStyle(color: white,
                    fontFamily: 'font1',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: defaultPadding*0.5),
              CircularProgressIndicator(),

            ],
          ),
        );
      }
      else{
        return ColumnOfTransactions(snapshot.data!.trans!);
      }
    });
          }
      ),
    );
  }

  Column ColumnOfTransactions(List<Tran> trans) {
    return Column(
      children: [
        /*ClipRRect(
          borderRadius: BorderRadius.circular(20), // Image border
          child: SizedBox.fromSize(
            size: Size.fromRadius(140), // Image radius
            child: Image.network('https://thumbs.dreamstime.com/b/purchase-order-po-document-paper-work-procurement-process-vector-57721124.jpg',
                fit: BoxFit.cover),
          ),
        ),*/
        SizedBox(height: defaultPadding),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            "تفاصيل المعاملات",
            style:TextStyle(color: white,
              fontFamily: 'font1',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: defaultPadding*2),
        for (int i=0;i<trans.length;i++) ...[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              "المعاملة ${i+1} ",
              style:TextStyle(color: textColor,
                fontFamily: 'font1',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(defaultPadding),

            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                SizedBox(height: defaultPadding*0.5),
                TransactionInfoCard(
                  pName:trans[i].transaction!.pName!
                  ,name:trans[i].transaction!.name!,
                  price:trans[i].transaction!.price!,
                  id:trans[i].transaction!.projectId!,
                  discount:trans[i].transaction!.discount!,
                  details:trans[i].transaction!.description!,

                ),
              ],
            ),
          ),
          SizedBox(height: defaultPadding ),

        ],
      ],
    );

  }
}




