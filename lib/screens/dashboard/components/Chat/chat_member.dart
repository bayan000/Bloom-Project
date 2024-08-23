
import 'package:admin/controllers/messagesController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/usersWithUnseenMessages.dart';
/*
class ChatMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Chats",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.blue.withOpacity(.1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("Open", style: TextStyle(color: Colors.blue)),
              ),
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.blue.withOpacity(.1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                      color: Theme.of(context).iconTheme.color!, width: .5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Open",
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            children: List.generate(
              investors.length,
                  (index) => MemberCard(inv: investors[index], trailing: null,),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Icon(Icons.feedback),
              SizedBox(width: 10),
              Text(
                "Submit Feedback",
                style: TextStyle(color: Theme.of(context).iconTheme.color),
              )
            ],
          )
        ],
      ),
    );
  }
}*/

class InvestorMemeberCard extends StatefulWidget {
  final Investors inv;
  final bool showJob;
  final Widget? trailing;
  const InvestorMemeberCard({Key? key, this.showJob = false, required this.inv, required this.trailing}) : super(key: key);

  @override
  State<InvestorMemeberCard> createState() => _InvestorMemeberCardState();
}

class _InvestorMemeberCardState extends State<InvestorMemeberCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //MessagesController messagesController=MessagesController();
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Consumer<MessagesController>(
            builder: (context,messagesController,child) {
              return ListTile(
                onTap: () {
                 var id=widget.inv.id;
                 messagesController.UpdateIndexOfUser(id.toString(),"investor",DateTime.now().toString(),10.toString());
                 print(messagesController.uesRtype+" investor " + messagesController.useRID +" id " + messagesController.lastMessageTime +messagesController.limit);
                },
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.inv.firstName!+" "+widget.inv.lastName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.inv.personalPhoto != null ?NetworkImage(widget.inv.personalPhoto!):NetworkImage("https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png"),
                    ),
                  ),
                ),
                trailing: widget.inv.unseenMessagesCount! > 0 ? buildUnreadCount(widget.inv.unseenMessagesCount!) : widget.trailing ?? Text(""), // Display unread count if available, otherwise use existing trailing widget
                subtitle: widget.inv.location != null ? Text(widget.inv.location!) : Text(''),
              );
            }
          ),
        ],
      ),
    );
  }
/*
*/

  Widget buildUnreadCount(int count) {
    return Stack(
      children: [
        if (widget.trailing != null) widget.trailing!, // Show existing trailing widget if present
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(5.0),
            constraints: BoxConstraints(minWidth: 16, minHeight: 16), // Set minimum size
            child: Text(
              count.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}



class UsersMemeberCard extends StatefulWidget {
  final Users users;
  final bool showJob;
  final Widget? trailing;

  const UsersMemeberCard({Key? key, this.showJob = false, required this.users, required this.trailing}) : super(key: key);

  @override
  State<UsersMemeberCard> createState() => _UsersMemeberCardState();
}

class _UsersMemeberCardState extends State<UsersMemeberCard> {
  @override
  Widget build(BuildContext context) {
    //MessagesController messagesController=MessagesController();
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Consumer<MessagesController>(
            builder: (context,messagesController,child) {
              return ListTile(
                onTap: () {
                  var id=widget.users.id;
                  messagesController.UpdateIndexOfUser(id.toString(),"user",DateTime.now().toString(),10.toString());
                  print(messagesController.uesRtype+"userrrr" + messagesController.useRID +"idddddddd" + messagesController.lastMessageTime +messagesController.limit);
                },
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.users.firstName!+" "+widget.users.lastName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.users.personalPhoto != null ?NetworkImage(widget.users.personalPhoto!):NetworkImage("https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png"),
                    ),
                  ),
                ),
                trailing: widget.users.unseenMessagesCount! > 0 ? buildUnreadCount(widget.users.unseenMessagesCount!) : widget.trailing ?? Text(""), // Display unread count if available, otherwise use existing trailing widget
                subtitle: widget.users.location != null ? Text(widget.users.location!) : Text(''),
              );
            }
          ),
        ],
      ),
    );
  }

  Widget buildUnreadCount(int count) {
    return Stack(
      children: [
        if (widget.trailing != null) widget.trailing!, // Show existing trailing widget if present
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(5.0),
            constraints: BoxConstraints(minWidth: 16, minHeight: 16), // Set minimum size
            child: Text(
              count.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}