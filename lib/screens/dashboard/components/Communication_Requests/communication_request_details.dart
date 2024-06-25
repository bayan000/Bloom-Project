import 'package:admin/controllers/comreqController.dart';
import 'package:admin/screens/dashboard/components/Communication_Requests/communication_request_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../models/communication_request.dart';


class communicationRequestDetails extends StatelessWidget {
  const communicationRequestDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Consumer<ComReqController>(
        builder: (context,comreq,child) {
          return FutureBuilder<CommunicationRequest>(
              future: comreq.fetchCommunicationRequest(comreq.id),
              builder: (context,snapshot){
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
                /*if(snapshot.hasError)
                {
                  return Center(child: Text('',style: TextStyle(fontSize: 20),),);
                }*/
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
                            child: Image.network('https://www.pngitem.com/pimgs/m/69-693975_information-technology-clipart-png-download-clipart-communication-png.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: defaultPadding),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Center(
                            child: Text(
                              "تفاصيل الطلب",
                              style:TextStyle(color: white,
                                fontFamily: 'font1',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: defaultPadding*0.5),
                        communicationRequestInfoCard(created_at: formatDateString(snapshot.data!.communication!.createdAt!),
                          investor_name: snapshot.data!.communication!.investor!.firstName!+ " "+ snapshot.data!.communication!.investor!.lastName!,
                          project_name: snapshot.data!.communication!.project!.name!,
                          status: snapshot.data!.communication!.status,
                          id: snapshot.data!.communication!.id,
                          inv_email: snapshot.data!.communication!.investor!.email ,
                          inv_phone:  snapshot.data!.communication!.investor!.phone,

                        ),
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
/*
*/