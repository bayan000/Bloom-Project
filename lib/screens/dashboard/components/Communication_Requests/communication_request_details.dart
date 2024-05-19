import 'package:admin/screens/dashboard/components/Communication_Requests/communication_request_info_card.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


class communicationRequestDetails extends StatelessWidget {
  const communicationRequestDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          communicationRequestInfoCard(created_at: '2024-05-12T19:52:48.000000Z', investor_name: 'فلان', project_name: 'مشروع الري بالتنقيط', project_id: 0, investor_id: 0, status: 0,
          ),
        ],
      ),
    );
  }
}
