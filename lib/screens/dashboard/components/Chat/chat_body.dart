import 'package:admin/screens/dashboard/components/Chat/chat_member.dart';
import 'package:admin/screens/dashboard/components/Chat/custom_divider.dart';
import 'package:admin/screens/dashboard/components/Chat/message_box.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessagingHeader(),
        SizedBox(height: defaultPadding,),
        Row(
          children: [
            MessageBox(),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),

              child: Container(
                width: size.width*0.24,
                height:size.height ,
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Adjust radius as needed
                ),              child: Column(
                mainAxisSize:  MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MoreDetails()
                ],
              ),
              ),
            ),

          ],
        ),


      ],
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
                  style: TextStyle(color: white,
                    fontFamily: 'font1',
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  )
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}


class MoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    children: List.generate(
                      3,
                          (index) => MemberCard(
                        showJob: true,
                        inv: investors[index],
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
      ),
    );
  }
}