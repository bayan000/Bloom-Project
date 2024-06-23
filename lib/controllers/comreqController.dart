


import 'package:flutter/cupertino.dart';

import '../Config/server_config.dart';
import '../Services/comreqService.dart';
import '../models/communication_request.dart';


class ComReqController extends ChangeNotifier{
  CommunicationRequest communicationRequest=CommunicationRequest();
  var id;


//fetchACommunicationRequest------------------------------------------
  Future<CommunicationRequest> fetchCommunicationRequest(id) async{
    final communicationRequest=await CommunicationRequestService.fetchCommunicationRequest(ServerConfig.url+ServerConfig.getACommunicationRequest+id.toString());
    return communicationRequest;
  }
  //curr_communicationRequestId------------------------------------------
  curr_communicationRequestId(id){
    this.id=id;
    notifyListeners();
    return id;
  }
}
