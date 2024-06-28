
import 'package:admin/controllers/transactionsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controllers/MenuAppController.dart';
import '../../../controllers/ProjectsController.dart';
import '../../../models/project_list.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({
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
              return FutureBuilder<List<Project>>(
                  future: pc.fetchProjects(),
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
                              fontSize: 26,
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
                                  label: Text("حالة الاستثمار", style: communTextStyle24textColor,),
                                ),
                                DataColumn(
                                  label: Text("", style: communTextStyle24textColor,),
                                ),
                                DataColumn(
                                  label: Text("",),

                                ),
                              ],
                              rows: List.generate(
                                  snapshot.data?.length ??0,
                                      (index) => projectDataRow(snapshot.data![index],context)
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                  });})
    );
  }
  DataRow projectDataRow(Project project,BuildContext context) {
    ProjectsController projectsController=ProjectsController();
    return DataRow(
      cells: [
        DataCell(
          Consumer<ProjectsController>(
              builder: (context,pc,child) {
              return Consumer<MenuAppController>(
                  builder: (context,mc,child) {
                  return InkWell(
                    onTap: (){
                      pc.pressed=1;
                      pc.curr_project(project);
                      mc.UpdateScreenIndex(12);

                    },
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
                  );
                }
              );
            }
          ),
        ),
        DataCell(Text(project.location!,style: communTextStyle24black,overflow: TextOverflow.ellipsis,)),
        DataCell(Text(project.amount!.toString(),style: communTextStyle24black,overflow: TextOverflow.ellipsis,)),
        DataCell(project.investmentStatus==1?
        Text("مُستَثمر",style: communTextStyle24black,overflow: TextOverflow.ellipsis,):
        Text("غير مُستَثمر",style: communTextStyle24black,overflow: TextOverflow.ellipsis,)
        ),


        DataCell(
          Consumer<MenuAppController>(
              builder: (context,mc,child) {
                return IconButton(
                    icon: Icon(Icons.delete, color: white),
                    onPressed: () async {
                      print(project.id);
                      EasyLoading.show(status: 'Loading....');
                      final r = await projectsController.deleteProject(project.id);
                      if (r == 200) {
                        EasyLoading.showSuccess("Done");
                        mc.UpdateScreenIndex(0);
                      } else
                        EasyLoading.showError('Something must have gone wrong');
                    });
              }
          ),),
        DataCell(
          IconButton(
              icon: Icon(Icons.add, color: textColor,weight: 40,),
              onPressed: (){_showTextInputDialog(context,project.id);}),)
      ],
    );
}

void _showTextInputDialog(BuildContext context,id) {
  final _titleController = TextEditingController(); // Title input
  final PriceController = TextEditingController();
  final DiscountController = TextEditingController();
  final DescriptionController = TextEditingController();
  TransactionsController transactionsController = TransactionsController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'معاملة جديدة',
          style: communTextStyle20textColor,
          textDirection: TextDirection.rtl,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Avoid excessive scrolling
          children: [
            TextField(
              textAlign: TextAlign.end,
              controller: _titleController, // Title input
              decoration: InputDecoration(hintText: 'أدخل اسم المعاملة'),
            ),
            TextField(
              textAlign: TextAlign.end,
              controller: PriceController, // Long text input
              decoration: InputDecoration(hintText: 'أدخل سعر المعاملة'),
            ),
            TextField(
              textAlign: TextAlign.end,
              controller: DiscountController, // Long text input
              decoration: InputDecoration(hintText: 'أدخل الحسم على المعاملة'),
            ),
            TextField(
              textAlign: TextAlign.end,
              controller: DescriptionController, // Long text input
              decoration: InputDecoration(hintText: 'أدخل وصف المعاملة'),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'إلغاء',
                    style: communTextStyle20textColor,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (_titleController.text == null ||
                        PriceController.text == null ||
                        DiscountController.text == null ||
                        DescriptionController.text == null) {
                      EasyLoading.showError("Please Fill all Required Field");
                    }
                    else {
                      EasyLoading.show(status: 'Loading....');
                      await transactionsController.addTransaction(
                          _titleController.text, id, int.parse(PriceController.text),
                          DiscountController.text, DescriptionController.text);
                      if (transactionsController.status == 201)
                        EasyLoading.showSuccess('تم حفظ المعاملة الجديدة');
                      else
                        EasyLoading.showError('Something went wrong');
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'تأكيد',
                    style: communTextStyle20textColor,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}}