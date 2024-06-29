import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/ArticlesService.dart';
import 'package:admin/models/Articles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class ArticlesController extends ChangeNotifier{
  List<Article> articles=[];
  Article article=Article();
  Article article0=Article();
  int status=0;
  late String fileName;
  late Rx<File?> photo = Rx<File?>(null);
  late Rx<File?> selectedFile = Rx<File?>(null);
  var name;
  var description;





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
  Future<void> addArticle(name,description,image) async{
    await ArticlesService.AddArticle(ServerConfig.url+ServerConfig.AddAnArticle, name,description,[image]);
  }
  //DeleteArticle------------------------------------------
  Future<int> deleteArticle(var id) async{
    status= await ArticlesService.DeleteAnArticle(ServerConfig.url+ServerConfig.DeleteAnArticle+id.toString());
    return status;
  }

  void pickPic(String field) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );
      if (result != null) {
        File file = File(result.files.single.path ?? "");
        switch (field) {
          case 'photo':
            fileName = file.path.split(r'\').last;
            break;
          default:
            break;
        }

        print("${result.files.single.path}");
        _onFileSelected(file, field);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
  void _onFileSelected(File file, String field) {
    switch (field) {
      case 'photo':
        photo.value = file;
        break;
      default:
        break;
    }
   // print(photo.value!.path+"  pathhhhhh");
  }
  var uploaded = false;

  Future<int> uploadArticle(name,description) async {
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

    if (photo.value != null && photo.value!.lengthSync() > 0) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'image',
          Uint8List.fromList(photo.value!.readAsBytesSync()),
          filename: fileName,
        ),
      );
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      status=201;
      uploaded = true;
      selectedFile.value = null;
      var jsonResponse = json.decode(responseData);
      return 201;

    } else {
      print(responseData);
      return 0;

    }
  }

  //
  UpdateDescription(var description){
    this.description=description;
    notifyListeners();
    return description;
  }

  UpdateName(var name){
    this.name=name;
    notifyListeners();
    return name;
  }
}
