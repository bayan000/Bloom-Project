import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProjectInfoCard extends StatelessWidget {
  const ProjectInfoCard({
    Key? key,
    required this.description,
    //required this.description,
    required this.feasibilityStudy,
    required this.cost,
    required this.location
  }) : super(key: key);

  final String description;
  final int cost;//in the API it's amount
  final String feasibilityStudy;
  final String location;


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

                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text(
                        "الكلفة ",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$cost",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: defaultPadding),
                  Row(
                  children: [
                    Text(
                    "الموقع ",
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    SizedBox(width: defaultPadding),
                    Text(
                      "$location",
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text(
                        "دراسة الجدوى ",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$feasibilityStudy",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  )
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
