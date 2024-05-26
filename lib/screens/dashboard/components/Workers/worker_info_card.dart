import 'package:admin/screens/dashboard/components/Workers/workerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';


class WorkerInfoCard extends StatelessWidget {
  const WorkerInfoCard({
    Key? key,
    required this.email,
    //required this.verified,
    required this.location, this.firstName, this.lastName, this.personal_photo, this.projects,

  }) : super(key: key);

  final String? email;
  //final String? verified;
  final String? firstName;
  final String? lastName;
  final String? location;
  final String? personal_photo;
  final List<Projects>? projects;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [


          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(right: defaultPadding),
                      child: CircleAvatar(
                        radius: 30.0, // Adjust radius as needed
                        backgroundColor: Colors.white, // Background for the avatar
                        backgroundImage:personal_photo == null
                            ? NetworkImage('https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png')// Handling case where no photo is available
                            : NetworkImage(personal_photo!)

                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0, // Adjust border width as needed
                          color: primaryColor, // Border color
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      "$firstName"+ " "+ "$lastName",
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                 /* Center(
                    child: Text(
                      "$verified",
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),*/
                  SizedBox(height: defaultPadding),
                  Center(
                    child: Text(
                      email!=null?"$email":"لا يتوفر إيميل",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding),

                  Center(
                    child: Text(
                      location!=null?"$location":"لم يُحدد الموقع",
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding),

                  projects!=null?Center(child: RowsOfProjects(projects)):Center(
                    child: Text(
                      "لا توجد مشاريع", // Handle missing name
                      style: TextStyle(
                        color: white,
                        fontFamily: 'font1',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Text(description)
        ],
      ),
    );
  }
}
Column RowsOfProjects(List<Projects>? projects) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
          "المشاريع",
          style: communTextStyle24textColor
      ),
      // Loop with error handling
      for (final project in projects!) ...[
        Center(
          child: Text(
            project.name.toString(), // Handle missing name
            style: TextStyle(
              color: white,
              fontFamily: 'font1',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: defaultPadding * 2.5),
      ],
    ],
  );
}