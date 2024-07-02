import 'dart:convert' as convert;
import 'dart:convert';
import 'package:admin/Config/server_config.dart';
import 'package:admin/controllers/CommunicationRequestsController.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../models/ApprovedTransactions.dart';
import '../models/TransactionsRequests.dart';
import '../models/transaction.dart';
import '../models/viewTransactionsRequest.dart';

class TransactionsRequestsService{
  //********************* Fetching transactions requests *********************************//

  static Future<TransactionsRequests> fetchTransactionRequests(String url) async {
    CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      print("success");
      final json = jsonDecode(response.body);

        final transactionsRequests = TransactionsRequests.fromJson(json);
        for(int i=0; i<transactionsRequests.transactionRequest!.length; i++){
          final name=await communicationRequestsController.getProjectName(transactionsRequests.transactionRequest![i].transaction!.projectId);
          transactionsRequests.transactionRequest![i].transaction!.ProjectName=name;
        }

        return transactionsRequests;

    } else {
      throw Exception('Failed to fetch requests: ${response.statusCode}');
    }
  }
  //********************* Fetching a transaction request *********************************//

  static Future<ViewTranRequest> fetchATransactionsRequest(String url) async {
    CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    if (response.statusCode == 200) {
      print("it's okay");
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final name=await communicationRequestsController.getProjectName(ViewTranRequest.fromJson(json).data!.transaction!.projectId);
      ViewTranRequest v=ViewTranRequest.fromJson(json);
      v.data!.transaction!.ProjectName=name;

      return v;
    } else {
      print("it's okay too");
      throw Exception('Failed to fetch request: ${response.statusCode}');
    }
  }

  //********************* Fetching approved transactions  *********************************//

  static Future<ApprovedTransactions> fetchApprovedTransactions(String url) async {
    CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      for(int i=0; i<ApprovedTransactions.fromJson(json).data!.length; i++){
        final name=await communicationRequestsController.getProjectName(ApprovedTransactions.fromJson(json).data![i].projectId);
        ApprovedTransactions.fromJson(json).data![i].ProjectName=name;
      }
      return ApprovedTransactions.fromJson(json);
    } else {
      throw Exception('Failed fetching approved transactions: ${response.statusCode}');
    }
  }

  //********************* Approve Transaction *********************************//

  static Future<int> ApproveTransaction(String url) async {

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

}








