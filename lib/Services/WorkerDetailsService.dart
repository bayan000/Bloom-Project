
import 'package:get_storage/get_storage.dart';

import '../screens/dashboard/components/Workers/workerModel.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class WorkerDetailsService{

//fetchingWorkerDetails--------------------------------------------------

  static Future<WorkerDetails> fetchWorkerDetails(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
    final statusCode = response.statusCode;

    if (statusCode == 200) {
      print("hi");
      final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final data = jsonResponse['data'] as Map<String, dynamic>;

      final user = User.fromJson(data['user']);
      final projects = (data['projects'] as List)
          .map((project) => Projects.fromJson(project))
          .toList();

      final worker = Worker(user: user, projects: projects);
      return WorkerDetails(worker: worker, message: jsonResponse['message'], status: statusCode);
    } else {
      throw Exception('Failed to get worker details from URL: $statusCode');
    }
  }

}