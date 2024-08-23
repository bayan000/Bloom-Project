

import 'package:url_launcher/url_launcher.dart';

import 'package:admin/models/appointments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/appointments_controller.dart';

class ScheduledAppointments extends StatelessWidget {
  const ScheduledAppointments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child:
      Container(

        padding: EdgeInsets.all(defaultPadding),

        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Consumer<AppointmentsController>(
            builder: (context,ac,child) {
              return FutureBuilder(
                  future: ac.fetchMeetings(),
                  builder: (context,snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Column(
                        children: [
                          SizedBox(height: size.height*0.37,),
                          Container(
                            height: size.height*0.5,
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Center(child: Column(children: [
                              CircularProgressIndicator(),
                              SizedBox(height: size.height*0.01,),
                              Text('loading...',style: TextStyle(fontSize: 15),),],)),),
                        ],

                      );
                    }
                    if(snapshot.hasError)
                    {
                      return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
                    }
                    else{
                      if(snapshot.data!.data!.length!=0)
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: defaultPadding),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Center(
                                child: Text(
                                    "المواعيد ",
                                    overflow: TextOverflow.ellipsis,
                                    style:communTextStyle24white
                                ),
                              ),
                            ),
                            SizedBox(height: defaultPadding*2),
                            SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: DataTable(
                                  columnSpacing: defaultPadding,
                                  // minWidth: 600,
                                  columns: [
                                    DataColumn(
                                      label: Text("  التاريخ", style: communTextStyle24textColor,),
                                    ),

                                    DataColumn(
                                  label: Text("الرابط", style: communTextStyle24textColor,),
                                ),


                                  ],
                                  rows: List.generate(
                                      snapshot.data!.data!.length ??0,
                                          (index) => MeetingDataRow(snapshot.data!.data![index]) //   (index) => projectDataRow(project_list_item[index]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      else
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: defaultPadding),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Center(
                                child: Text(
                                    "المواعيد ",
                                    overflow: TextOverflow.ellipsis,
                                    style:communTextStyle24white
                                ),
                              ),
                            ),
                            SizedBox(height: defaultPadding*2),
                            SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: Text("  لا توجد مواعيد محجوزة", style: communTextStyle24textColor,),
                              ),
                            ),
                          ],
                        );
                    }
                  }
              );
            }
        )
      )
,
    );
  }
}
DataRow MeetingDataRow(meeting meeting) {
  AppointmentsController appointmentsController=AppointmentsController();
  return DataRow(
    cells: [

      DataCell(
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(meeting.meetingDate!,style:communTextStyle24black))
          ],
        ),
      ),

      DataCell(
        Consumer<AppointmentsController>(
          builder: (context, ac, child) {
            return FutureBuilder<String>(
              future: ac.fetchZoomMeetingLink(),
              builder: (context, ap) {
                final meetingLink = ac.meetingLink ?? ''; // Handle null data gracefully
print("meeeting link is "+ meetingLink);
                return Row(
                  children: [/*
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(meetingLink, style: communTextStyle24black),
                    ),*/
                    IconButton(
                      icon: Icon(
                        meetingLink == 'l'
                            ? Icons.attachment_outlined
                            : Icons.attachment,
                        color: meetingLink == 'l' ? Colors.black : Colors.white,
                      ),
                      onPressed: meetingLink != 'l'
                          ? () {
                        // Navigate to the Zoom meeting link
                        launchUrl(Uri.parse(meetingLink));
                      }
                          : null, // Disable the button if the link is not 'l'
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    ],
  );
}