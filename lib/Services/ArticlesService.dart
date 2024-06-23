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
  static Future<void> AddArticle(String url, String name,String description, imagesPaths) async {
   /* FormData formData=FormData();
    formData.files.add(
      MapEntry('image',await MultipartFile.fromFile(imagesPaths[0]))
    );
   Dio().post(
     url,
   data: formData,
     options: Options(
       headers: {
         'Authorization':'Bearer  ${GetStorage().read('token')}',
         'enctype':'multipart/form-data',
         'Connection': 'keep-alive',
         "Content-Type":"multipart/form-data"
       },
       contentType:'multipart/form-data'
     )
   ).then((value) => print(value.data)).catchError((error){
     print(error);
   });*/



 var headers={
    'Authorization':'Bearer  ${GetStorage().read('token')}',
    'enctype':'multipart/form-data',
    'Connection': 'keep-alive',
    "Content-Type":"multipart/form-data"
    };
 var request= http.MultipartRequest('Post', Uri.parse(url));
 Uint8List data =await imagesPaths.readAsBytes();
 List<int> list= data.cast();
 request.fields.addAll({
   'description': description,
   'name':name
 });
 request.files.add(http.MultipartFile.fromBytes('image', list,filename: 'name.png'));

 var response= await request.send();
 response.stream.bytesToString().asStream().listen((event) {
   print("ho ho ho");
   //var parsedJson=json.decode(event);
   print("ho ho ho");
  // print(parsedJson);
   print("ho ho ho");
print(response.stream.bytesToString());
   print(response.statusCode);
 });  if (response.statusCode == 201) {

print("cool");
 } else {
   print("Oh, oh");
 }
 /////////////////////////////
/*
       final bytes = image.readAsBytesSync();
    final Map<String, dynamic> body = {'name': name,'description':description,
      'image':bytes
    };
print("start");
    final response = await http.post(Uri.parse(url), body: jsonEncode(body),,
        encoding: Encoding.getByName("utf-8")

    );

  print('response.body');
  print(response.body);

    if (response.statusCode == 201) {

      return response.statusCode;

    } else {
      print("here's a break down");
      print(response.body);
      return 0;
    }
*/
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