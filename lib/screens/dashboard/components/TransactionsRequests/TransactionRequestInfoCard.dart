import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';


class TransactionRequestInfoCard extends StatelessWidget {

  const TransactionRequestInfoCard({
    Key? key, required this.name, required this.price, required this.id, required this.discount, required this.details, required this.status, required this.projectId, required this.pName,

  }) : super(key: key);

  final String name,details, price,status,pName;
  final int id,projectId;
  final String discount;


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

                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "اسم المشروع ",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$pName",
                        style:TextStyle(color: white,
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
                        "الكلفة ",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$price",
                        style:TextStyle(color: white,
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
                        "الحسم",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$discount",
                        style:TextStyle(color: white,
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
                        "الحالة",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$status",
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
                        "تفاصيل المعاملة",
                        style:TextStyle(color: textColor,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(width: defaultPadding),
                      Text(
                        "$details",
                        style:TextStyle(color: white,
                            fontFamily: 'font1',
                            fontSize: 22
                        ),
                        softWrap: true,
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
