import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';
import '../../../../controllers/ProjectsController.dart';
import '../../../../models/project_list.dart';


class TransactionInfoCard extends StatelessWidget {

  const TransactionInfoCard({
    Key? key, required this.name, required this.price, required this.id, required this.discount, required this.details, required this.pName, required this.pId,

  }) : super(key: key);

  final String name,details, price,pName;
  final int id,pId;
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
                    maxLines: null,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Column(
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
                      Consumer<MenuAppController>(
                          builder: (context,mc,child) {
                          return Consumer<ProjectsController>(
                              builder: (context,pc,child) {
                              return InkWell(
                                onTap: (){
                                  pc.pressed=1;
                                  pc.curr_project(Project(id: pId));
                                  mc.UpdateScreenIndex(0);
                                  },
                                child: Text(
                                  "$pName",
                                  maxLines: null,
                                  overflow: TextOverflow.ellipsis,
                                  style:TextStyle(color: white,
                                    fontFamily: 'font1',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }
                          );
                        }
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
