import 'package:admin/screens/dashboard/components/Investors/investor_info_card.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';



class InvestorDetails extends StatelessWidget {
  const InvestorDetails({
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
              child: Image.network('https://news.crunchbase.com/wp-content/uploads/2020/10/Bank_Rebundle.png',
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

          InvestorInfoCard(email: 'useremail@gmail.com', location: 'دمشق', verified: "verified",
            firstName: "الاسم",lastName: "الاسم2", personal_photo: "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",

          ),
        ],
      ),
    );
  }
}
