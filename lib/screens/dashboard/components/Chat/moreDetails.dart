

import 'package:admin/controllers/messagesController.dart';
import 'package:admin/screens/dashboard/components/Chat/chat_member.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/usersWithUnseenMessages.dart';

class MoreDetails extends StatefulWidget {
  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {

  @override
  Widget build(BuildContext context) {
    MessagesController messagesController =MessagesController();
    Size size = MediaQuery.of(context).size;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultPadding,),
          Text("     المستثمرين",
            style: TextStyle(
              color: grey,
              fontFamily: 'font1',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
          FutureBuilder<InvestorsWithUnseenMessages?>(
              future: messagesController.getInvestorsMessages(),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting)
                {
                  return Container(
                    height: size.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: List.generate(
                                  10,
                                      (index) => Container(color: grey,),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                else if(snapshot.hasError)
                {
                  return Container(
                    height: size.height,
                    child: Center(child: Text('Error !',style: TextStyle(fontSize: 20),),),
                  );
                }
                else
                {
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: List.generate(
                                  snapshot!.data!.investors!.length,
                                      (index) => InvestorMemeberCard(
                                    showJob: true,
                                    inv: snapshot!.data!.investors![index],
                                    trailing: Container(
                                      child: Material(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                        Theme.of(context).primaryColor.withOpacity(.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            color: Theme.of(context).primaryColor,
                                            icon: Icon(Icons.message),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }


              }),
          Text("     أصحاب العمل",
            style: TextStyle(
              color: grey,
              fontFamily: 'font1',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
          FutureBuilder<UsersWithUnseenMessages?>(
              future: messagesController.getUsersMessages(),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting)
                {
                  return Container(
                    height: size.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: List.generate(
                                  10,
                                      (index) => Container(color: grey,),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                else if(snapshot.hasError)
                {
                  return Container(
                    height: size.height,
                    child: Center(child: Text('Error !',style: TextStyle(fontSize: 20),),),
                  );
                }
                else
                {
                  return Container(
                    height: size.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: List.generate(
                                  snapshot!.data!.users!.length,
                                      (index) => UsersMemeberCard(
                                    showJob: true,
                                    users: snapshot!.data!.users![index],
                                    trailing: Container(
                                      child: Material(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                        Theme.of(context).primaryColor.withOpacity(.1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            color: Theme.of(context).primaryColor,
                                            icon: Icon(Icons.message),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }


              }),


        ]);

  }
}