import 'package:admin/Services/ComplaintsService.dart';
import 'package:admin/models/complaints.dart';
import 'package:flutter/cupertino.dart';

import '../Config/server_config.dart';

class ComplaintsController extends ChangeNotifier{
  complaintModelForFullInfo currComplaint=complaintModelForFullInfo(id:0,investorName: "Investor Name", projectName:"Project Name",description:"description" ,updatedAt: '2024-05-21T12:13:32.000000Z' ,createdAt: '2024-05-21T12:13:32.000000Z');
  int status=0;

  //fetchCommunicationRequests------------------------------------------
  Future<List<complaintModelForFullInfo>> fetchComplaints() async{
    final Complaints=await ComplaintsService.fetchComplaints(ServerConfig.url+ServerConfig.getComplaints);
    return Complaints;
  }

  curr_Complaint(complaintModelForFullInfo currComplaint){
    this.currComplaint=currComplaint;
    notifyListeners();
    return currComplaint;
  }
//DeleteComplaint------------------------------------------
  Future<int> deleteComplaint(var id) async{
    status= await ComplaintsService.DeleteComplaint(ServerConfig.url+ServerConfig.deleteComplaint+id.toString());
    return status;
  }

}

