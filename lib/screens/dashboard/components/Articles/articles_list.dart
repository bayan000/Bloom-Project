
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/articles_controller.dart';
import '../../../../models/Articles.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticlesController ac=ArticlesController();
    Size size =MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        /**/
        child:FutureBuilder<List<Article>>(
            future: ac.fetchArticles(),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting)
              {return Column(
                children: [
                  SizedBox(height: size.height*0.37,),
                  Container(
                    height: size.height*0.5,
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Center(child: Column(children: [
                      CircularProgressIndicator(),
                      SizedBox(height: size.height*0.01,),
                      Text('loading...',style: TextStyle(fontSize: 15),),],)),),
                ],

              );}
              if(snapshot.hasError)
              {
                return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
              }
              else{

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "المقالات",
                      style: TextStyle(color: textColor,
                        fontFamily: 'font1',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: DataTable(
                        columnSpacing: defaultPadding,
                        // minWidth: 600,
                        columns: [
                          DataColumn(
                            label: Text("عنوان المقالة", style: communTextStyle24textColor,),

                          ),

                        ],
                        rows: List.generate(
                            snapshot.data?.length ??0,
                                (index) =>ArticleDataRow(snapshot.data![index])
                        ),
                      ),
                    ),
                  ],
                );
              }
            }
        )
    );
  }
}
DataRow ArticleDataRow(Article article) {
  return DataRow(
    cells: [
      DataCell(
        Consumer<ArticlesController>(
        builder: (context,ac,child) {
          return InkWell( // Wrap DataCell with InkWell
          onTap: (){
          ac.curr_article(article);
          print(article.id.toString()+"article iddddddddd");
          print(formatDateString(ac.article0.updatedAt.toString()));
          },
            child: Row(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(article.name!,style: communTextStyle24black,),
                ),
              ],
            ),
          );
        }
      ),
      )],
  );
}