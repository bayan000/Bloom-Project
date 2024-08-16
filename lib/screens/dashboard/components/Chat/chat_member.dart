
import 'package:admin/models/investor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
}

class MemberCard extends StatelessWidget {
  final Investors inv;
  final bool showJob;
  final Widget? trailing;

  const MemberCard({Key? key, this.showJob = false, required this.inv, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            inv.firstName!+" "+inv.lastName!,
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
              image: inv.location != null ?NetworkImage(inv.personalPhoto!):NetworkImage("https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png"),
            ),
          ),
        ),
        trailing: inv.unseenMessagesCount! > 0 ? buildUnreadCount(inv.unseenMessagesCount!) : trailing ?? Text(""), // Display unread count if available, otherwise use existing trailing widget
        subtitle: inv.location != null ? Text(inv.location!) : Text(''),
      ),
    );
  }

  Widget buildUnreadCount(int count) {
    return Stack(
      children: [
        if (trailing != null) trailing!, // Show existing trailing widget if present
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




List<Investors> investors = [
  Investors(
    personalPhoto:"",
    firstName: "سامية",
    lastName: "محمد",
    location: "دمشق",
    unseenMessagesCount: 1

  ),
  Investors(personalPhoto:
    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    firstName:"يمنى",
    lastName: "المصري",
    location: "دمشق",
      unseenMessagesCount: 0
  ),
  Investors(personalPhoto:
  "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    firstName:"سامية",
    lastName: "محمد",
    location: "دمشق",
      unseenMessagesCount: 10
  ),
];

class InvestorsWithUnread {
  bool? status;
  List<Investors>? investors;

  InvestorsWithUnread({this.status, this.investors});

  InvestorsWithUnread.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['investors'] != null) {
      investors = <Investors>[];
      json['investors'].forEach((v) {
        investors!.add(new Investors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.investors != null) {
      data['investors'] = this.investors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Investors {
  int? id;
  String? firstName;
  String? lastName;
  String? userType;
  String? email;
  int? verified;
  String? password;
  String? otp;
  String? deviceToken;
  String? phone;
  String? location;
  String? iDCard;
  String? personalPhoto;
  String? createdAt;
  String? updatedAt;
  int? unseenMessagesCount;

  Investors(
      {this.id,
        this.firstName,
        this.lastName,
        this.userType,
        this.email,
        this.verified,
        this.password,
        this.otp,
        this.deviceToken,
        this.phone,
        this.location,
        this.iDCard,
        this.personalPhoto,
        this.createdAt,
        this.updatedAt,
        this.unseenMessagesCount});

  Investors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    verified = json['verified'];
    password = json['password'];
    otp = json['otp'];
    deviceToken = json['device_token'];
    phone = json['phone'];
    location = json['location'];
    iDCard = json['iD_card'];
    personalPhoto = json['personal_photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unseenMessagesCount = json['unseen_messages_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['device_token'] = this.deviceToken;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['iD_card'] = this.iDCard;
    data['personal_photo'] = this.personalPhoto;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['unseen_messages_count'] = this.unseenMessagesCount;
    return data;
  }
}