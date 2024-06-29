import 'package:admin/controllers/transactionsController.dart';
import 'package:admin/models/transaction.dart';
import 'package:admin/screens/dashboard/components/Transactions/transaction_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';



class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Consumer<TransactionsController>(
          builder: (context,tc,child) {
          return FutureBuilder<Transaction>(
              future: tc.fetchTransaction(tc.transaction.id),
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
                            "تفاصيل المعاملة",
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
                else
              return Container(
                padding: EdgeInsets.all(defaultPadding),

                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(140), // Image radius
                        child: Image.network('https://thumbs.dreamstime.com/b/purchase-order-po-document-paper-work-procurement-process-vector-57721124.jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        "تفاصيل المعاملة",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding*0.5),
                    TransactionInfoCard(
                      pId:snapshot!.data!.projectId! ,
                      pName:snapshot!.data!.ProjectName! ,name: snapshot!.data!.name!, price: snapshot!.data!.price!, id: snapshot!.data!.projectId!, discount: snapshot!.data!.discount!,details: snapshot!.data!.description!,

                    ),
                  ],
                ),
              );
            }
          );
        }
      ),
    );
  }
}
