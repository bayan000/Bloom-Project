/*import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchProjectName(String url) async {
  final response = await http.get(Uri.parse(url), headers: {
    'Authorization': 'Bearer ${GetStorage().read('token')}', // Assuming you have a token storage mechanism
    'Accept': 'application/json',
  });

  final statusCode = response.statusCode;
  final body = await response.body;

  if (statusCode == 200) {
    final json = jsonDecode(body) as Map<String, dynamic>;
    final projectData = json['data'] as Map<String, dynamic>;
    return projectData['name'] as String;
  } else {
    print(response.body);
    throw Exception('Failed to fetch project name: $statusCode');
  }
}
*/


import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OneProjectServices {
//********************* Fetching ProjectName *********************************//
  static Future<String> fetchProjectName(String url) async {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${GetStorage().read('token')}', // Assuming you have a token storage mechanism
      'Accept': 'application/json',
    });

    final statusCode = response.statusCode;
    final body = await response.body;

    if (statusCode == 200) {
      final json = jsonDecode(body) as Map<String, dynamic>;
      final projectData = json['data'] as Map<String, dynamic>;
      print(projectData['name'] as String);
      return projectData['name'] as String;
    } else {
      print(response.body);
      throw Exception('Failed to fetch project name: $statusCode');
    }
  }
}






