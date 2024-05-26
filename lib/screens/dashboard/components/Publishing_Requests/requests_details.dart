import 'package:admin/constants.dart';
import 'package:admin/screens/dashboard/components/Publishing_Requests/requests_info_card.dart';
import 'package:flutter/material.dart';


class RequestsDetails extends StatelessWidget {
  const RequestsDetails({
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
              child: Image.network('https://img.freepik.com/free-vector/flat-illustration-growing-green-plants-from-golden-coins-business-investment-growth-concept_1302-5467.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              "تفاصيل المشروع",
              style:TextStyle(color: white,
                fontFamily: 'font1',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: defaultPadding*0.5),
          RequestInfoCard(
              description: "اسم المشروع",
              feasibilityStudy: '1328.pdf',
              cost:50,
              location: "دمشق"
          ),
        ],
      ),
    );
  }
}
