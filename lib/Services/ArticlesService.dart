import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../models/Articles.dart';
import '../models/loginModel.dart';


class ArticlesService {
  static var status ;
// Fetching All Articles------------------------------------------
  static Future<List<Article>?> fetchArticles(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      final articlesList = Articles.fromJson(jsonResponse);
      status = jsonResponse['status'];

      return articlesList.article;
    } else {
      print('Error: Failed to fetch articles. Status code: ${response.statusCode}');
      return null;
    }
  }
// Fetching An Articles-------------------------------------------
  static Future<Article?> fetchArticle(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      if (jsonResponse['data'] != null) {
        final articleData = jsonResponse['data'] as Map<String, dynamic>;
        return Article.fromJson(articleData);
      } else {
        print('Error: Missing article data in response.');
        return null;
      }
    } else {
      print('Error: Failed to fetch article. Status code: ${response.statusCode}');
      return null;
    }
  }
}