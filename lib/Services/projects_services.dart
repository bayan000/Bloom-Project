import 'dart:convert';
import 'package:admin/Config/server_config.dart';

import '../models/project_list.dart';
import 'package:http/http.dart' as http;


class ProjectsService{
  static String Token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNWQ1NDU0YTdhM2RmYmMyYTc5NGZiMmMzZjg5OGJlOGExMjkxNDMzMjExZjE2MTRiNDdhZWM4MGU4YmVkOGYyZjY2MjFmODg4YmFkNzg4ZmQiLCJpYXQiOjE3MTYyMTE1NjMuODYyMjg5LCJuYmYiOjE3MTYyMTE1NjMuODYyMjkxLCJleHAiOjE3NDc3NDc1NjMuODU3MDAzLCJzdWIiOiIyIiwic2NvcGVzIjpbImFkbWluIl19.iVAeL6Rh4BW4YcKOOpYwg1fLu7_PV_JPS9cbAAujfKE9k433PIgjHlc8IZTCtqFSkEuaGg9EZARNanji0o6g5YqD8Pz-cDXHT4WYxFyCbR1E5sr1vpSUJBqM-fybUFKNOzCP4GnrGSd8ERCcVScK3Jh3em7_P_ADhzlHTuXnUdttwDBIaU_5Mjg96t3Shk22ByRsEVYqG1Nc96r2VMzYn5NwNj5GywSprRQ64zCvBLia9a30RuV8wAcNMiTkY6M5lEy5wdNVwRGqPyt8iucQmE6NIertz3tYPawD8Z2Pig3j13Dp7NGT7U00Zk-j7kKNlLI72BOd06ldvllJKldQyTZHKA1xytIVAUepC2HBWbwYRw58tL69rV3gYdTjnryTwAa3kwj1n-SU0T0U2S0Mo9s1OOCCAFWtnLU7wWbV66ATC9QjJeRhZyxzpfUz83duX76_yQ60vazTuB-Mfm_xk83MDWUdm7WdSX7MewGBScJ9gqkiIjHcQmkldyOAAQYmwAifaOSN2f5jHWqNYYO1sOe8oG9N-kplaXspu_B-vpgUIJNZyO9TlzL24VA1-8r440AT7OAS3qXidtdko9jE7wifgiqJ40F-qsGDBeLWGCDhZoQkZMOUKVDEodTpjDspjZV5NUDTtSSfJTNtPr97QEjixjWNwpO1AgcvaaSNCR0";

  //********************* Fetching Projects *********************************//

  static Future<List<Project>> getProjects(String url) async {
    final response = await http.get(Uri.parse(ServerConfig.url+url),headers: {
      'Authorization':'Bearer  ${Token}',
      'Accept':'application/json',
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
}

