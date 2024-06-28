
import 'package:admin/controllers/transactionsRequestsController.dart';
import 'package:admin/models/viewTransactionsRequest.dart';
import 'package:admin/screens/dashboard/components/TransactionsRequests/TransactionRequestInfoCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';



class TransactionRequestDetails extends StatelessWidget {

  const TransactionRequestDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child:
      Consumer<TransactionsRequestsController>(
          builder: (context,trc,child) {
            if(trc.pressed==1){
              return FutureBuilder<ViewTranRequest>(
                  future: trc.fetchTransaction(trc.transactionRequest.transaction!.id)!,
                  builder: (context,snapshot) {
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
                                child:
                                CircularProgressIndicator(),
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                "تفاصيل الطلب",
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
                    if(snapshot.hasError)
                    {
                      return Container(

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
                                child:
                                Consumer<TransactionsRequestsController>(
                                  builder: (context, trc, child) {
                                    if (snapshot.data!.data!.receipt==null) {
                                      return CircularProgressIndicator();}
                                    else{
                                      return Image.network(
                                        snapshot.data!.data!.receipt!,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Text('Error loading image'); // Handle network errors
                                        },
                                      );
                                    }



                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                "تفاصيل طلب المعاملة",
                                style:TextStyle(color: white,
                                  fontFamily: 'font1',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: defaultPadding*0.5),
                            TransactionRequestInfoCard(pName:snapshot.data!.data!.transaction!.ProjectName!,name: snapshot.data!.data!.transaction!.name!, price: snapshot.data!.data!.transaction!.price!, id: snapshot.data!.data!.transaction!.id!, discount: snapshot.data!.data!.transaction!.discount!, details: snapshot.data!.data!.transaction!.description!, status: snapshot.data!.data!.transaction!.status!, projectId: snapshot.data!.data!.transaction!.projectId!)

                          ],
                        ),
                      );
                  }
              );

            }
            else
              return Container();
          }
      )
    );
  }
}
