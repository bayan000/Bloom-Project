import 'dart:convert';
import 'package:admin/Config/server_config.dart';
import 'package:get_storage/get_storage.dart';

import '../models/project_list.dart';
import 'package:http/http.dart' as http;


class ProjectsService{
  //********************* Fetching Projects *********************************//

  static Future<List<Project>> getProjects(String url) async {
    final response = await http.get(Uri.parse(ServerConfig.url+url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      print("hey hey hey");
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final projectsData = jsonBody['data'] as List<dynamic>;
      final projects = projectsData.map((projectData) => Project.fromJson(projectData)).toList();
      return projects;
    } else {
      throw Exception('Failed to fetch projects');
    }
  }
//********************* Adding Project Type *********************************//
  static Future<int> AddProjectType(String url, String name) async {
    final Map<String, dynamic> body = {'name': name};

    final response = await http.post(Uri.parse(url), body: jsonEncode(body),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    print(response.body);

    if (response.statusCode == 201) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }

  }
//********************* Accept Project *********************************//

  static Future<int> AcceptProject(String url) async {

    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
//'content-Type':'application/json',
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

//********************* Deleting Project *********************************//

  static Future<int> DeleteProject(String url) async {

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

//********************* searchForProject *********************************//

  static Future<List<Project>> searchForProject(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final projectsData = jsonBody['data'] as List<dynamic>;
      final projects = projectsData.map((projectData) => Project.fromJson(projectData)).toList();
      return projects;
    } else {
      throw Exception('Failed to fetch projects: ${response.statusCode}');
    }
  }

}








