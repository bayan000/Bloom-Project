import 'package:admin/controllers/CommunicationRequestsController.dart';
import 'package:admin/screens/dashboard/components/Communication_Requests/communication_request_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';


class communicationRequestDetails extends StatelessWidget {
  const communicationRequestDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Consumer<CommunicationRequestsController>(
        builder: (context,comreq,child) {
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
                communicationRequestInfoCard(created_at: formatDateString(comreq.requestInfoCard.createdAt!),
                  investor_name: comreq.requestInfoCard.investorName,
                  project_name: comreq.requestInfoCard.projectName,
                  status: comreq.requestInfoCard.status,
                  id: comreq.requestInfoCard.id,

                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
