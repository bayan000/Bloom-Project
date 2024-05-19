import 'package:admin/screens/dashboard/components/Complaints/complaint_info_card.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


class ComplaintDetails extends StatelessWidget {
  const ComplaintDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(

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
                child: Image.network('https://media.istockphoto.com/id/980554662/vector/complaint-concept-woman-wrote-a-complaint.jpg?s=612x612&w=0&k=20&c=1Prl7gXoIkLS0NDPgh8uKAPcO0SPIAZzyf6k2pQ_Pho=',

                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Center(
                child: Text(
                  "تفاصيل الشكوى",
                  style:TextStyle(color: white,
                    fontFamily: 'font1',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: defaultPadding*0.5),
            ComplaintInfoCard(description: 'this is the description of a complaint',id: 0, nameOfProject: 'مشروع الاستثمار 1', investor: 'المستثمر 2', created_at: '6-4-2024',

            ),
          ],
        ),
      ),
    );
  }
}
