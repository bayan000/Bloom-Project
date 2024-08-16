
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/workers.dart';

class WorkersService{
  static Future<List<Worker>> fetchWorkers(String url) async {

    final response = await http.get(Uri.parse("https://noor-demo-store.webmyidea.com/api/admin/users"),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Application':'application/json',
      'Content-Type':'application/json',
      'Accept-Encoding':'gzip, deflate, br',
      'Connection':'keep-alive'
    });
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      print("okkk");
      final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final workers = (jsonResponse['data'] as List)
          .map((worker) => Worker.fromJson(worker))
          .toList();
      return workers;
    } else {
      print(response.statusCode);
      //print(response.body);
      throw Exception(response.body);
    }
  }
}