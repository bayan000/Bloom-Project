
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/workers.dart';

class WorkersService{
  static Future<List<Worker>> fetchWorkers(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Application':'application/json',
    });
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final workers = (jsonResponse['data'] as List)
          .map((worker) => Worker.fromJson(worker))
          .toList();
      return workers;
    } else {
      throw Exception('Failed to get workers from URL: $statusCode');
    }
  }
}