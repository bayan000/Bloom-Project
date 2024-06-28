import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/Statistics.dart';

class StatisticsService{
  //********************* Fetching Monthly Statistics *********************************//
  static Future<List<MonthlyStatistics>> fetchMonthlyStatistics(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = jsonDecode(response.body) as List;
      return data.map((item) => MonthlyStatistics.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch monthly statistics. Status code: ${response.statusCode}');
    }
  }

  //********************* Fetching Project Statistics *********************************//
  static Future<List<ProjectStatistics>> fetchProjectStatistics(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = jsonDecode(response.body) as List;
      return data.map((item) => ProjectStatistics.fromJson(item)).toList();
    } else {
      // Handle error
      throw Exception('Failed to fetch project statistics. Status code: ${response.statusCode}');
    }
  }

}
