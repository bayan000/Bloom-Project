

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../controllers/CommunicationRequestsController.dart';
import '../controllers/aninvestorController.dart';
import '../models/CommunicationRequests.dart';

class CommunicationRequestsService {
  static var project;
  static var Investor;
  static var id;

  //********************* Fetching CommunicationRequests *********************************//
  static Future<List<CommunicationRequestModelForFullInfo>> fetchCommunicationRequests(
      String url) async {
    CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
    InvestorController investorController=InvestorController();
    List<CommunicationRequestModelForFullInfo> comlist=[];
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
      'Accept': 'application/json',
    });
    final statusCode = response.statusCode;
    final body = await response.body;
    if (statusCode == 200) {
      print("it is 200");
      final json = jsonDecode(body) as Map<String, dynamic>;
      final communicationRequests = CommunicationRequests.fromJson(json);
      print(communicationRequests.communicationRequest![0].id);
      for(int i=0;i<communicationRequests.communicationRequest!.length;i++){
        project=await communicationRequestsController.getProjectName(communicationRequests.communicationRequest![i].projectId);
        Investor=await investorController.fetchInvestorName(communicationRequests.communicationRequest![i].investorId);
        comlist.add(CommunicationRequestModelForFullInfo(id: communicationRequests.communicationRequest![i].id,
        projectName: project,investorName: Investor,updatedAt: communicationRequests.communicationRequest![i].updatedAt,
          createdAt: communicationRequests.communicationRequest![i].createdAt,status: communicationRequests.communicationRequest![i].status
        ));
        print(comlist[i].status.toString());
        print("hi");
      }
      return comlist;
    } else {
      print(response.body);
      throw Exception('Failed to fetch communication requests: $statusCode');
    }

  }

  //********************* Accept CommunicationRequest *********************************//

  static Future<int> AcceptCommunicationRequest(String url) async {

    final response = await http.get(Uri.parse(url),headers: {
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






