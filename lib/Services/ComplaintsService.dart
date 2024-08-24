

import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../controllers/CommunicationRequestsController.dart';
import '../controllers/aninvestorController.dart';
import '../models/complaints.dart';

class ComplaintsService {
  static var project;
  static var Investor;
  static var id;

  static Future<List<complaintModelForFullInfo>> fetchComplaints(String url) async {
    CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
    InvestorController investorController=InvestorController();
    List<complaintModelForFullInfo> comlist=[];
    //print("hi"+ " ${GetStorage().read('token')}");
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Content-Type':'application/json',
      'Accept':'application/json',
    });

    if (response.statusCode == 200) {
      print("thanks God");
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final complaints = Complaints.fromJson(json);
      print(complaints.complaint![0].description);
      for(int i=0;i<complaints.complaint!.length;i++){
        project=await communicationRequestsController.getProjectName(complaints.complaint![i].projectId);
        Investor=await investorController.fetchInvestorName(complaints.complaint![i].investorId);
        comlist.add(complaintModelForFullInfo(description:complaints.complaint![i].description,projectName: project,investorName: Investor,
        id: complaints.complaint![i].id,updatedAt: complaints.complaint![i].updatedAt,createdAt: complaints.complaint![i].createdAt));
        print(comlist[i].description);

      }
      return comlist;
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to fetch complaints: ${response.statusCode}');
    }
  }

//********************* Deleting Complaint *********************************//

  static Future<int> DeleteComplaint(String url) async {

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

