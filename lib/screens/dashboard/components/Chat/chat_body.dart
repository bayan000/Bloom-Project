import 'dart:async';

import 'package:admin/models/messagesIndex.dart';
import 'package:admin/screens/dashboard/components/Chat/chat_member.dart';
import 'package:admin/screens/dashboard/components/Chat/message_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../../../constants.dart';
import '../../../../controllers/messagesController.dart';
import '../../../../models/usersWithUnseenMessages.dart';

class ChatBody extends StatefulWidget {
  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final TextEditingController _controller = TextEditingController();
  MessagesController messagesController=MessagesController();
  late PusherChannelsFlutter pusher;
  late PusherChannel channel;
  Timer? _timer;
  int _buildCount = 0; // To track build count

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _messageController = TextEditingController();


    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessagingHeader(),
          SizedBox(height: defaultPadding),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Consumer<MessagesController>(
                          builder: (context,ms,child) {

                            return MessageBox(id: messagesController.useRID.toString());
                          }
                        )),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                filled: true, // This enables the filled property
                                fillColor: Colors.grey[350],
                                hintText: "Write message..",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Consumer<MessagesController>(
                            builder: (context,messagesController,child) {
                              return IconButton(
                                icon: Icon(
                                  Icons.send_rounded,
                                  color: white,
                                ),
                                onPressed: () async{
                                  if(messagesController.uesRtype==null)
                                  {
                                    messagesController.UpdateIndexOfUser(2.toString(),"user",DateTime.now(),10.toString());
                                  }
                                  //print("will send to"+messagesController.useRID);
                                 await messagesController.sendMessage(ChatModel(content: _messageController.text, receiver_id: messagesController.useRID, receiver_type: messagesController.uesRtype.toString()));
                                  },
                              );
                            }
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
              //try to put this on dashboard
              Expanded(
                flex: 1,
                child: Container(
                  width: size.width * 0.24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Expanded(child: MoreDetails()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MessagingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            height: 100,
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  "المحادثات",
                  style: TextStyle(
                    color: white,
                    fontFamily: 'font1',
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


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

