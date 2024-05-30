import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/ArticlesService.dart';
import 'package:admin/models/Articles.dart';
import 'package:flutter/cupertino.dart';

class ArticlesController extends ChangeNotifier{
  List<Article> articles=[];
  Article article=Article();
  Article article0=Article();
  int status=0;

  //fetchArticles------------------------------------------
  Future<List<Article>> fetchArticles() async{
    articles=(await ArticlesService.fetchArticles(ServerConfig.url+ServerConfig.getAllArticles))!;
    return articles;
  }
  //curr_article------------------------------------------
  curr_article(Article article){
    this.article0=article;
    notifyListeners();
    return article;
  }
  //fetchArticle------------------------------------------
  Future<Article> fetchArticle(var id) async{
    article=(await ArticlesService.fetchArticle(ServerConfig.url+ServerConfig.getAnArticle+id.toString()))!;
    return article;
  }


  //AddArticle------------------------------------------
  Future<int> addArticle(name,description,image) async{
    status= await ArticlesService.AddArticle(ServerConfig.url+ServerConfig.AddAnArticle, name,description,image);
    return status;
  }
  //DeleteArticle------------------------------------------
  Future<int> deleteArticle(var id) async{
    status= await ArticlesService.DeleteAnArticle(ServerConfig.url+ServerConfig.DeleteAnArticle+id.toString());
    return status;
  }
}