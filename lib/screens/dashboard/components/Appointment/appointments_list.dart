
import 'package:admin/constants.dart';
import 'package:admin/controllers/appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/ComplaintsController.dart';
import '../../../../controllers/MenuAppController.dart';
import '../../../../models/appointments.dart';

class AppointmentsList extends StatefulWidget {
  const AppointmentsList({
    Key? key,
  }) : super(key: key);

  @override
  State<AppointmentsList> createState() => _AppointmentsListState();
}

class _AppointmentsListState extends State<AppointmentsList> {
  @override
  Widget build(BuildContext context) {
    AppointmentsController appointmentsController=AppointmentsController();
    Size size =MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Consumer<AppointmentsController>(
          builder: (context,ac,child) {
            return FutureBuilder(
                future: ac.fetchAppointments(),
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

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "جدول أوقاتك المتاحة",
                          style: communTextStyle28textColor
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("الساعة", style: communTextStyle24textColor,),
                            ),

                            DataColumn(
                              label: Text("", style: communTextStyle24textColor,),
                            ),

                            DataColumn(
                              label: Text("", style: communTextStyle24textColor,),
                            ),

                          ],
                          rows: List.generate(
                              snapshot.data!.data!.length ??0,
                                  (index) => FreeAppointmentDataRow(snapshot.data!.data![index]) //   (index) => projectDataRow(project_list_item[index]),
                          ),
                        ),
                      ),
                        Consumer<MenuAppController>(
                        builder: (context, mc, child) {
                  return TextButton(
                  child: Text("أضف وقتاً آخر", style: communTextStyle24white,),
                  onPressed: () async {
                  String newHour = '';
                  String timePeriod = '';

                  // Use showDialog to display a custom dialog with text fields
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog(
                  title: Text('Add Appointment Time',style: communTextStyle24black,),
                  content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter Hour (e.g., 10)',
                  ),
                  onChanged: (value) {
                  newHour = value;
                  },
                  ),
                  TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter Time Period (e.g., AM, PM)',
                  ),
                  onChanged: (value) {
                  timePeriod = value;
                  },
                  ),
                  ],
                  ),
                  actions: [
                  TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                  Navigator.of(context).pop();
                  },
                  ),
                  TextButton(
                  child: Text('Add'),
                  onPressed: () async{

                    EasyLoading.show(status: 'Loading....');

                    final state=await appointmentsController.addAppointment(newHour, timePeriod);
                    print(state);
                    if(state==201) {
                      EasyLoading.showSuccess('تم حفظ الموعد');
                      mc.UpdateScreenIndex(20);
                      //Navigator.pop(context);

                    } else
                      EasyLoading.showError('Something went wrong');
                    Navigator.of(context).pop();
                  },
                  ),
                  ],
                  );
                  },
                  );
                  },
                  );
                  },
                  )

                    ],
                  );
                }
            );
          }
      ),
    );
  }
}

DataRow FreeAppointmentDataRow(Appointment appointment) {
  AppointmentsController appointmentsController=AppointmentsController();
  return DataRow(
    cells: [

      DataCell(
        Consumer<ComplaintsController>(
            builder: (context,comc,child) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(appointment!.timePeriod!+" "+appointment!.hour!,style:communTextStyle24black))
                ],
              );
            }
        ),
      ),
      DataCell(SizedBox(width: 50,)),

      DataCell(
        Consumer<MenuAppController>(
          builder: (context, mc, child) {
            return IconButton(
              icon: Icon(Icons.edit, color: Colors.white),
              onPressed: () async {
                String? newHour = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController hourController=TextEditingController();
                    return AlertDialog(
                      title: Text('Edit Hour'),
                      content: TextField(
                        controller: hourController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: 'Enter new hour'),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: Text('Save'),
                          onPressed: () async {
                            if (hourController.text.isNotEmpty) {
                              EasyLoading.show(status: 'Loading....');
                              final r = await appointmentsController.UpdateAppointment(appointment!.id!, hourController.text);
                              if (r == 201 )
                                EasyLoading.showSuccess("Done");
                              else
                                EasyLoading.showError('Something must have gone wrong');
                              mc.UpdateScreenIndex(20);
                              Navigator.of(context).pop();
                            } else {
                              //EasyLoading.showError('Something must have gone wrong');

                              // Handle empty hour input
                            }
                          },
                        ),
                      ],
                    );
                  },
                );

                if (newHour != null) {
                  // Handle the new hour value if needed
                }
              },
            );
          },
        ),
      ),

    ],
  );
}
