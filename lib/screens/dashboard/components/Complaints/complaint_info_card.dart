import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';


class ComplaintInfoCard extends StatelessWidget {
  const ComplaintInfoCard({
    Key? key,
    required this.description,
    required this.nameOfProject,
    required this.id,
    required this.created_at,
    required this.investor,
  }) : super(key: key);

  final String? description,nameOfProject,created_at,investor;
  final int id;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [


          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Center(
                      child: Text(
                        "$nameOfProject!",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  SizedBox(height: defaultPadding),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "اسم المستثمر",
                          style:TextStyle(color: textColor,
                            fontFamily: 'font1',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: defaultPadding*0.5),
                        Text(
                          "$investor!",
                          style:TextStyle(color: white,
                            fontFamily: 'font1',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Center(
                    child:
                    Text(
                      "$description",
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.visible,
                    ),

                  ),

                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text(
                        "تاريخ الإضافة",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding*0.5),
                      Text(
                        "$created_at",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
          //Text(description)
        ],
      ),
    );
  }
}
