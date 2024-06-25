import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';


class ArticleInfoCard extends StatelessWidget {
  const ArticleInfoCard({
    Key? key,
    required this.description,
    required this.name,
    required this.id,
    required this.updated_at,
  }) : super(key: key);

  final String? description,name,updated_at;
  final int? id;


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
                    name!,
                    maxLines: 9,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyle(color: white,
                      fontFamily: 'font1',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Center(
                    child:
                      Text(
                        "$description",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                      ),

                  ),

                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text(
                        "آخر تحديث",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: defaultPadding*0.5),
                      Text(
                        "$updated_at",
                        style:TextStyle(color: white,
                          fontFamily: 'font1',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
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
