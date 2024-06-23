

import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/CommunicationRequestsService.dart';
import 'package:admin/Services/OneProjectServices.dart';
import 'package:admin/models/CommunicationRequests.dart';
import 'package:admin/screens/dashboard/components/Communication_Requests/communication_request_info_card.dart';
import 'package:flutter/material.dart';

import '../Services/comreqService.dart';


class CommunicationRequestsController extends ChangeNotifier{

  CommunicationRequestModelForFullInfo requestInfoCard=CommunicationRequestModelForFullInfo(id:0,investorName: "Investor Name", projectName:"Project Name",status: 0,updatedAt: '2024-05-21T12:13:32.000000Z' ,createdAt: '2024-05-21T12:13:32.000000Z');
  int status=0;

  //fetchCommunicationRequests------------------------------------------
  Future<List<CommunicationRequestModelForFullInfo>> fetchCommunicationRequests() async{
    final communicationRequests=await CommunicationRequestsService.fetchCommunicationRequests(ServerConfig.url+ServerConfig.getAllCommunicationRequests);
    return communicationRequests;
}

  //ProjectsName------------------------------------------
  Future<String> getProjectName(var id) async{
    final name= await OneProjectServices.fetchProjectName(ServerConfig.url+ServerConfig.getAProject+id.toString());
    return name;
  }
  //----------------------------
    Future<int> acceptCommunicationRequest(var id) async{
    status= await CommunicationRequestsService.AcceptCommunicationRequest(ServerConfig.url+ServerConfig.acceptCommunicationRequests+id.toString());
    return status;
  }

  //curr_requet_update------------------------------------------
  curr_requets(CommunicationRequestModelForFullInfo requestInfoCard){
    this.requestInfoCard=requestInfoCard;
    notifyListeners();
    return requestInfoCard;
  }
}
