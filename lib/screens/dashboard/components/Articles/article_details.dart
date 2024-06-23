import 'package:admin/controllers/articles_controller.dart';
import 'package:admin/models/Articles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<ArticlesController>(
        builder: (context,ac,child) {
            return FutureBuilder<Article>(
            future: ac.fetchArticle(ac.article0.id),
            builder: (context,snapshot){

              if(snapshot.connectionState==ConnectionState.waiting||snapshot.hasError)
              {
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
                          child:
                          CircularProgressIndicator(),
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
                      Consumer<ArticlesController>(
                          builder: (context,ac,child) {
                            return
                              CircularProgressIndicator();
                          }),

                    ],
                  ),
                );
              }
            /*  else if(snapshot.hasError){
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
                          child:
                          Consumer<ArticlesController>(
                            builder: (context, ac, child) {
                                return Image.network(
                                  'https://media.istockphoto.com/id/1197779723/vector/03-green-ecology-and-save-save-energy-landing-page-background-template.jpg?s=612x612&w=0&k=20&c=ivglY5N4E263SdsibYbBKyChHhIr4XjOc_MEYaHGIsc=',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text('Error loading image'); // Handle network errors
                                  },
                                );
                            },
                          ),
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
                      Consumer<ArticlesController>(
                          builder: (context,ac,child) {

                              return ArticleInfoCard(description:"تناقش المقالة الاستثمار لمصادر الطاقة المتجددة", name: "استثمار مصادر الطاقة المتجددة",id: 0, updated_at:"12-3-2023");


                          }),

                    ],
                  ),
                );
              }
*/
              else{

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
                          child:
                          Consumer<ArticlesController>(
                            builder: (context, ac, child) {
                              if (snapshot.data!.image==Null) {
                                return CircularProgressIndicator();}
                              else{
                                return Image.network(
                                  snapshot.data!.image!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text('Error loading image'); // Handle network errors
                                  },
                                );
                              }



                            },
                          ),
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
                      Consumer<ArticlesController>(
                          builder: (context,ac,child) {

                            if(ac.article0==Null){
                              return CircularProgressIndicator();;
                            }
                            else{
                              return ArticleInfoCard(description: snapshot.data!.description, name: snapshot.data!.name,id: snapshot.data!.id, updated_at: formatDateString(snapshot.data!.updatedAt.toString()),
                              );
                            }

                          }),

                    ],
                  ),
                );
              }

            });
          }

    ));
  }
}
