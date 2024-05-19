import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';


class WorkerInfoCard extends StatelessWidget {
  const WorkerInfoCard({
    Key? key,
    required this.email,
    required this.verified,
    required this.location, this.firstName, this.lastName, this.personal_photo,

  }) : super(key: key);

  final String? email;
  final String? verified;
  final String? firstName;
  final String? lastName;
  final String? location;
  final String? personal_photo;


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
                        backgroundImage: personal_photo != null
                            ? NetworkImage(personal_photo!) // Set image from URL
                            :NetworkImage('https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png'), // Handle case where no photo is available

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
                  Center(
                    child: Text(
                      "$verified",
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
                      email!,
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
                      "$location",
                      style:TextStyle(color: white,
                        fontFamily: 'font1',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
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
