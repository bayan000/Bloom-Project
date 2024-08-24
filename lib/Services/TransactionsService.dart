
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:admin/Config/server_config.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../controllers/CommunicationRequestsController.dart';
import '../models/transaction.dart';



class TransactionsService{
  //********************* Fetching transactions *********************************//
  static Future<Transactions> fetchTransactions(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Transactions.fromJson(json);
    } else {
      throw Exception('Failed to fetch transactions: ${response.statusCode}');
    }
  }

  //********************* Adding or updating a transaction *********************************//
  static Future<int> AddOrUpdateTransaction(String url, String name, price, String discount,int project_id,description) async {
    final Map<String, dynamic> body = {'name': name,'price':price,'discount':discount,'project_id':project_id,'description':description};

    final response = await http.post(Uri.parse(url), body: jsonEncode(body),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    print(response.body);

    if (response.statusCode == 201) {

      return response.statusCode;

    } else {
      print(response.body);
      print("Unknown error");
      return 0;
    }

  }
//********************* Deleting A Transaction *********************************//

  static Future<int> DeleteTransaction(String url) async {

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

  //********************* Fetching A Transaction *********************************//

  static Future<Transaction> fetchTransaction(String url, int transactionId) async {

    final response = await http.get(Uri.parse('$url/$transactionId'),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
      var t=Transaction.fromJson(json['data']);
      t.ProjectName=await communicationRequestsController.getProjectName(t.projectId);
        return t;

    } else {
      throw Exception('Failed to fetch transactions: ${response.statusCode}');
    }
  }


}








