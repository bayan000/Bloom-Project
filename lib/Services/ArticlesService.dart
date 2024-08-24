import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import '../Config/server_config.dart';
import '../models/Articles.dart';


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
// Add a new article----------------------------------------------
  static Future<int> AddArticle(String url, String name,String description, image) async {
    var headers = {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ServerConfig.url + ServerConfig.AddAnArticle),
    );

    request.fields.addAll({
      'name': name,
      'description': description,
    });

    //if (image.value != null && image.value!.lengthSync() > 0) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'image',
          Uint8List.fromList(image.readAsBytes),
          filename: 'images.png',
        ),
      );
   // }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();


    print(responseData);

    if (response.statusCode == 201) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }


 }


// Delete an article----------------------------------------------

  static Future<int> DeleteAnArticle(String url) async {

    final response = await http.post(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
    print(response.body);

    if (response.statusCode == 200) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }



  }
}