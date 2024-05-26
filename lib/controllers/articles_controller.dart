import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/ArticlesService.dart';
import 'package:admin/models/Articles.dart';
import 'package:flutter/cupertino.dart';

class ArticlesController extends ChangeNotifier{
  List<Article> articles=[];
  Article article=Article();
  Article article0=Article();
  Future<List<Article>> fetchArticles() async{
    articles=(await ArticlesService.fetchArticles(ServerConfig.url+ServerConfig.getAllArticles))!;
    return articles;
  }

  curr_article(Article article){
    this.article0=article;
    notifyListeners();
    return article;
  }

  Future<Article> fetchArticle(var id) async{
    article=(await ArticlesService.fetchArticle(ServerConfig.url+ServerConfig.getAnArticle+id.toString()))!;
    return article;
  }
}