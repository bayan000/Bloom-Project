
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controllers/MenuAppController.dart';
import '../../../controllers/ProjectsController.dart';
import '../../../models/project_list.dart';

class SearchProjectsList extends StatelessWidget {
  const SearchProjectsList({
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
        child:  Consumer<ProjectsController>(
            builder: (context,pc,child) {
              final byAmount="عن طريق الكلفة";

              if(pc.selectedFilter==byAmount)
                {
                  return FutureBuilder<List<Project>>(
                      future: pc.SearchForProjectsByAmount(pc.SearchValue),
                      builder: (context,snapshot){
                        if(snapshot.connectionState==ConnectionState.waiting)
                        {return Column(
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

                        );}
                        if(snapshot.hasError)
                        {
                          return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
                        }
                        else{
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "قائمة المشاريع",
                                style: TextStyle(color: textColor,
                                  fontFamily: 'font1',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: DataTable(
                                  columnSpacing: defaultPadding,
                                  // minWidth: 600,
                                  columns: [
                                    DataColumn(
                                      label: Text("اسم المشروع", style: communTextStyle24textColor,),

                                    ),
                                    DataColumn(
                                      label: Text("الموقع", style: communTextStyle24textColor,),
                                    ),
                                    DataColumn(
                                      label: Text("التكلفة", style: communTextStyle24textColor,),
                                    ),
                                    DataColumn(
                                      label: Text("", style: communTextStyle24textColor,),
                                    ),
                                  ],
                                  rows: List.generate(
                                      snapshot.data?.length ??0,
                                          (index) => projectDataRow(snapshot.data![index])
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                      });
                }
              else {
                return FutureBuilder<List<Project>>(
                    future: pc.SearchForProjectsByName(pc.SearchValue),
                    builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting)
                      {return Column(
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

                      );}
                      if(snapshot.hasError)
                      {
                        return Center(child: Text('Error !',style: TextStyle(fontSize: 20),),);
                      }
                      else{
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "قائمة المشاريع",
                              style: TextStyle(color: textColor,
                                fontFamily: 'font1',
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                columnSpacing: defaultPadding,
                                // minWidth: 600,
                                columns: [
                                  DataColumn(
                                    label: Text("اسم المشروع", style: communTextStyle24textColor,),

                                  ),
                                  DataColumn(
                                    label: Text("الموقع", style: communTextStyle24textColor,),
                                  ),
                                  DataColumn(
                                    label: Text("التكلفة", style: communTextStyle24textColor,),
                                  ),
                                  DataColumn(
                                    label: Text("", style: communTextStyle24textColor,),
                                  ),
                                ],
                                rows: List.generate(
                                    snapshot.data?.length ??0,
                                        (index) => projectDataRow(snapshot.data![index])
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                    });
              }
              })
    );
  }
}
DataRow projectDataRow(Project project) {
  ProjectsController projectsController=ProjectsController();
  return DataRow(
    cells: [
      DataCell(
        GestureDetector(
          child: Row(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Container(
                    width: 250,
                    child: Text(project.name!,style: communTextStyle24black,overflow: TextOverflow.ellipsis,textDirection: TextDirection.rtl,)),
              ),
            ],
          ),
        ),
      ),
      DataCell(Text(project.location!,style: communTextStyle24black,overflow: TextOverflow.ellipsis,)),
      DataCell(Text(project.amount!.toString(),style: communTextStyle24black,overflow: TextOverflow.ellipsis,)),
      DataCell(
        Consumer<MenuAppController>(
            builder: (context,mc,child) {
              return IconButton(
                  icon: Icon(Icons.delete, color: white),
                  onPressed: () async {
                    print(project.id);
                    EasyLoading.show(status: 'Loading....');
                    final r = await projectsController.deleteProject(project.id);
                    if (r == 200)
                      EasyLoading.showSuccess("Done");
                    else
                      EasyLoading.showError('Something must have gone wrong');
                    mc.UpdateScreenIndex(0);
                  });
            }
        ),)
    ],
  );
}