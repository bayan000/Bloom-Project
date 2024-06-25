
import 'package:admin/controllers/ComplaintsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';
import '../../../../models/Articles.dart';
import '../../../../models/complaints.dart';

class ComplaintsList extends StatelessWidget {
  const ComplaintsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Consumer<ComplaintsController>(
          builder: (context,cc,child) {
          return FutureBuilder(
              future: cc.fetchComplaints(),
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
                    "الشكاوى",
                    style: communTextStyle28textColor
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columnSpacing: defaultPadding,
                      // minWidth: 600,
                      columns: [
                        DataColumn(
                          label: Text("توصيف الشكوى", style: communTextStyle24textColor,),
                        ),

                        DataColumn(
                          label: Text("اسم المشروع", style: communTextStyle24textColor,),
                        ),

                        DataColumn(
                          label: Text("", style: communTextStyle24textColor,),
                        ),

                        DataColumn(
                          label: Text("اسم المستثمر", style: communTextStyle24textColor,),
                        ),
                        DataColumn(
                          label: Text("", style: communTextStyle24textColor,),
                        ),

                      ],
                      rows: List.generate(
                          snapshot.data?.length ??0,
                              (index) => ComplaintDataRow(snapshot.data![index]) //   (index) => projectDataRow(project_list_item[index]),
                      ),
                    ),
                  ),
                ],
              );
            }
          );
        }
      ),
    );
  }
}

DataRow ComplaintDataRow(complaintModelForFullInfo complaint ) {
ComplaintsController complaintsController=ComplaintsController();
  return DataRow(
    cells: [

      DataCell(
        Consumer<ComplaintsController>(
            builder: (context,comc,child) {
            return InkWell(
              onTap: (){
                comc.curr_Complaint(complaint);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(complaint.description!,
                      style: communTextStyle24black,
                      overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            );
          }
        ),
      ),

      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(complaint.projectName!,
                style: communTextStyle24black,
                overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      ),

      DataCell(SizedBox(width: 50,)),
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(complaint.investorName!,
                style: communTextStyle24black,
                overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      ),

      DataCell(
        Consumer<MenuAppController>(
            builder: (context,mc,child) {
          return IconButton(
          icon: Icon(Icons.delete, color: white),
          onPressed: () async {
            EasyLoading.show(status: 'Loading....');
            final r = await complaintsController.deleteComplaint(complaint.id);
            if (r == 200)
              EasyLoading.showSuccess("Done");
            else
              EasyLoading.showError('Something must have gone wrong');
            mc.UpdateScreenIndex(2);
          });
        }
      ),)

    ],
  );
}