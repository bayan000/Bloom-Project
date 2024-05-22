import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

import '../models/investor.dart';
import 'package:http/http.dart' as http;

class InvestorsService{

  static Future<List<Investor>> fetchInvestors(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Application':'application/json',
    });
    print(response.body);
    print(response.statusCode+200!);


      final data = convert.jsonDecode(response.body) as Map<String, dynamic>;
    if (data['message'] == "ok") {
      final status = data['status']; // Store the status
      final investorList = <Investor>[];

      if (data['data'] != null) {
        data['data'].forEach((v) => investorList.add(Investor.fromJson(v)));
      }

      return investorList;
    } else {
      throw Exception('Failed to fetch investors. Status code: ${response.statusCode}');
    }
  }

}

