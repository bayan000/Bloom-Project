
import 'dart:async';

import 'package:admin/screens/dashboard/components/Chat/chat_body.dart';
import 'package:admin/screens/dashboard/components/Chat/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../../../constants.dart';
import '../../../../controllers/messagesController.dart';
import '../../../../models/messagesIndex.dart';

class MessageBox extends StatefulWidget {
  final String id;

  const MessageBox({required this.id});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  MessagesController messagesController = MessagesController();
  Timer? _timer;
  int _buildCount = 0;// To track build count
  String id="2";
  @override
  void initState() {
    super.initState();
    print('hi from initState');
    _startTimer();
  }

  void _startTimer() {
    print("refreshing");
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      print('timer ticked');
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _buildCount++;
    print('built: $_buildCount');
    Size size =MediaQuery.of(context).size;
    if(messagesController.uesRtype==null)
    {
      messagesController.UpdateIndexOfUser(2.toString(),"user",DateTime.now(),10.toString());
    }
      return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),

            child: Container(
              width: size.width*0.5,
              child: Column(
                mainAxisSize:  MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize:  MainAxisSize.min,
                    children: [
                      Text(
                        "Bloom",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        "أهلاً وسهلاً",
                        style: communTextStyle28white,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "يمكنك التواصل والتعاون مع أصحاب العمل والمستثمرين بسهولة\n"
                            "ناقش المشاريع..\n"
                            "ولا تنسَ أننا موجودون دائماً لتقديم الدعم.\n",
                        style: communTextStyle20white

                      ),
                      SizedBox(height: 20),
                      FutureBuilder<List<Message>?>(
                        future: messagesController.getMessages(id.toString(),messagesController.uesRtype,DateTime.now().toString(),messagesController.limit),
                        builder: (context, snapshot) {

                          if (snapshot.hasError) {
                            return Center(child: Text('Error !', style: TextStyle(fontSize: 20)));
                          }

                          if (snapshot.hasData) {
                            var messagess = messagesController.messages;
                            final messages = messagess!.reversed.toList();
                            final List<Widget> messageWidgets = [];
                            for (final message in messages) {
                              if (message.senderType == "admin") {
                                messageWidgets.add(
                                  Container(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 10),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  fit: FlexFit.loose,
                                                  child: _buildMessage(message.content!,size.width),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                messageWidgets.add(
                                  Container(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  fit: FlexFit.loose,
                                                  child: _buildMessage(
                                                    message.content!,size.width,
                                                    isSend: true,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                            }

                            // Ensure at least an empty widget is returned
                            return messageWidgets.isNotEmpty ? Column(children: messageWidgets) : Container();
                          } else {
                            // This shouldn't be reached due to the previous checks, but handle it for safety
                            return Container();
                          }
                        },
                      ),

                    ],
                  ),
                  SizedBox(height: defaultPadding,),

                ],
              ),
            ),
          ),


        ],
      ),
    );
  }

  Container _buildMessage(String message,double width, {bool isSend = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isSend ? white : Colors.grey[300]!.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width*0.3), // Adjust maxWidth as needed
        child: Text(
          message,
          style: TextStyle(color: isSend ? textColor : null, fontFamily: 'font1', fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }}
