import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'article_info_card.dart';


class ArticleDetails extends StatelessWidget {
  const ArticleDetails({
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
                child: Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/795f6210039721.5602f2fc3a204.jpg',
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                "تفاصيل المقالة",
                style:TextStyle(color: white,
                  fontFamily: 'font1',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: defaultPadding*0.5),
            ArticleInfoCard(description: 'this is the description of an article this is the description of an article this is the description of an article this is the description of an article this is the description of an article this is the description of an article this is the description of an article this is the description of an article ', name: 'أهمية الاستثمار',id: 0, updated_at: '25-2-2023',

            ),
          ],
        ),
      ),
    );
  }
}
