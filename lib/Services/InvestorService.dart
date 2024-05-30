import 'dart:convert' as convert;
import 'dart:convert';
import 'package:admin/models/project_list.dart';
import 'package:get_storage/get_storage.dart';

import '../models/investor.dart';
import 'package:http/http.dart' as http;

import '../screens/dashboard/components/Investors/one_investor.dart';

class InvestorService{

//fetchingAnInvestor--------------------------------------------------
  static Future<AnInvestor> fetchInvestor(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
    final statusCode = response.statusCode;
    final body = await response.body;

    if (statusCode == 200) {
      final json = jsonDecode(body) as Map<String, dynamic>;
      AnInvestor inv =AnInvestor.fromJson(json);
      return inv;
    } else {      print(response.body);

    throw Exception('Failed to fetch investor: $statusCode');
    }
  }
//fetchingAnInvestor'sName--------------------------------------------------
  static Future<String> fetchInvestorName(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
    final statusCode = response.statusCode;
    final body = await response.body;

    if (statusCode == 200) {
      final json = jsonDecode(body) as Map<String, dynamic>;
      AnInvestor inv =AnInvestor.fromJson(json);
      final fullName=inv.investorInfo!.investor!.firstName!+" "+inv.investorInfo!.investor!.lastName!;
      print(fullName);
      return fullName;
    } else {      print(response.body);

    throw Exception('Failed to fetch investor: $statusCode');
    }
  }

}

