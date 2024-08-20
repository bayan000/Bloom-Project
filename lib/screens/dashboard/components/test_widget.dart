import 'package:admin/controllers/CommunicationRequestsController.dart';
import 'package:admin/controllers/ComplaintsController.dart';
import 'package:admin/controllers/aninvestorController.dart';
import 'package:admin/models/CommunicationRequests.dart';
import 'package:flutter/material.dart';

import '../../../Services/messages_service.dart';
import '../../../controllers/ProjectsController.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
  InvestorController investorController=InvestorController();
  ComplaintsController complaintsController=ComplaintsController();
  ProjectsController projectsController=ProjectsController();
  // Define your functions here
  void function1() async{
    print("Function 1 executed!");
    await MessagesService().getMessages(2.toString(),"user",DateTime.now().toString(),30.toString());//projectsController.SearchForProjectsByName("نجار");
    //await complaintsController.fetchComplaints();
    //await communicationRequestsController.fetchCommunicationRequests();

  }

  void function2() async{
    print("Function 2 executed!");
    await communicationRequestsController.getProjectName(10);
    await investorController.fetchInvestorName(8);
  }

  @override
  Widget build(BuildContext context) {
    return Column( // You can replace Column with any other layout widget
      children: [
        ElevatedButton(
          onPressed: function1,
          child: Text("Run Function 1"),
        ),
        ElevatedButton(
          onPressed: function2,
          child: Text("Run Function 2"),
        ),
      ],
    );
  }
}
