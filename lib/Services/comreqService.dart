import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/communication_request.dart';



class CommunicationRequestService {
  static Future<CommunicationRequest> fetchCommunicationRequest(String url) async {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${GetStorage().read('token')}', // Assuming you have a token storage mechanism
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final communicationJson = data['communication'];
      if (communicationJson == null) {
        throw FormatException('Invalid JSON format: missing communication key');
      }

      final communication = Communication.fromJson(communicationJson);

      return CommunicationRequest(communication: communication); // Parse the data
    } else {
      throw Exception('Failed to fetch communication request: ${response.statusCode}');
    }

  }
}







