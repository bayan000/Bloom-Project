import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProjectInfoCard extends StatelessWidget {
   ProjectInfoCard({
    Key? key,
    required this.description,
    //required this.description,
    required this.amount,
    required this.location, required this.name, required this.investment_status, required this.invName, required this.wName,
     required this.invId, required this.wId
  }) : super(key: key);
   String? description,name,investment_status,invName,wName
   ;
   int amount,invId,wId;
   String? location;


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
        crossAxisAlignment: CrossAxisAlignment.center,

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
                        "مشروع $name ",
                        maxLines: 9,
                        overflow: TextOverflow.ellipsis,
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "الحالة: $investment_status ",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),


                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  description!=null?
                  Text(
                    description!,
                    maxLines: null,
                    //overflow: TextOverflow.ellipsis,
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ):
                  Text(
                    "لا يوجد وصف",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Text(
                    "المستثمر: $invName ",
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                  SizedBox(height: defaultPadding),
                  Text(
                    "صاحب العمل: $wName ",
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      Text(
                        "الكلفة  ",

                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$amount",
                        maxLines: null,
                        overflow: TextOverflow.ellipsis,
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
                  children: [
                    Text(
                    "الموقع ",
                      maxLines: null,
                      overflow: TextOverflow.ellipsis,
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    SizedBox(width: defaultPadding),
                    location!=null?
                    Text(
                      "$location",
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ):Text(
                      "لم يحدد الموقع",
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ))


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
