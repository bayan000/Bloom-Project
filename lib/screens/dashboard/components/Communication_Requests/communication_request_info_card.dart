import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';


class communicationRequestInfoCard extends StatelessWidget {
  const communicationRequestInfoCard({
    Key? key, required this.created_at, required this.investor_name, required this.project_name, required this.status, this.id,


  }) : super(key: key);

  final String? created_at,investor_name,project_name;
  final int? status,id;


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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "اسم المستثمر ",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        investor_name!,
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "اسم المشروع ",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$project_name",
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "تاريخ الطلب ",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$created_at",
                        style:TextStyle(color: textColor,
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
