
/*
import 'dart:convert';
import 'dart:io';

import 'package:admin/models/report.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';
import '../../../../controllers/articles_controller.dart';
import '../../../../models/Articles.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticlesController ac=ArticlesController();
    Size size =MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        /**/
        child:FutureBuilder<List<Article>>(
            future: ac.fetchArticles(),
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

                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "المقالات",
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
                                label: Text("عنوان المقالة", style: communTextStyle24textColor,),

                              ),
                              DataColumn(
                                label: Text("",),

                              ),DataColumn(
                                label: Text("",),

                              ),

                            ],
                            rows: List.generate(
                                snapshot.data?.length ??0,
                                    (index) =>ArticleDataRow(snapshot.data![index],context)
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    Padding(
                        padding:  EdgeInsets.only(right:size.width*0.48
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              _showTextInputDialog(context);
                            },
                            child: const Icon(Icons.add),
                            style: ButtonStyle(
                              //elevation: MaterialStateProperty.all(40),
                              shape: MaterialStateProperty.all(const CircleBorder()),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                              foregroundColor: MaterialStateProperty.all(white),
                              backgroundColor: MaterialStateProperty.all(textColor), // <-- Button color
                              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                                if (states.contains(MaterialState.pressed)) return white; // <-- Splash color
                              }),)))
                  ],
                );
              }
            }
        )
    );
  }
}
//ArticleDataRow-------------------------
DataRow ArticleDataRow(Article article,BuildContext context) {
  Size size =MediaQuery.of(context).size;
  ArticlesController articlesController=ArticlesController();
  return DataRow(
    cells: [
      DataCell(
        Consumer<ArticlesController>(
        builder: (context,ac,child) {
          return InkWell( // Wrap DataCell with InkWell
          onTap: (){
          ac.curr_article(article);
          print(article.id.toString()+"article iddddddddd");
          print(formatDateString(ac.article0.updatedAt.toString()));
          },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(article.name!,style: communTextStyle24black,overflow: TextOverflow.ellipsis,),
                ),
              ],
            ),
          );
        }
      ),
      ),
      DataCell(SizedBox(width: size.width*0.27,)
      ),
      DataCell(
        Consumer<MenuAppController>(
            builder: (context,mc,child) {
              return IconButton(
                  icon: Icon(Icons.delete, color: white),
                  onPressed: () async {
                    //print(project.id);
                    EasyLoading.show(status: 'Loading....');
                    final r = await articlesController.deleteArticle(article.id);
                    if (r == 200)
                      EasyLoading.showSuccess("Done");
                    else
                      EasyLoading.showError('Something must have gone wrong');
                    mc.UpdateScreenIndex(1);
                  });
            }
        ),),


    ],
  );
}
//_showTextInputDialog-----------------------------------------
void _showTextInputDialog(BuildContext context) {
  Uint8List selectedImageInBytes;
  final _titleController = TextEditingController(); // Title input
  final _longTextController = TextEditingController();
  var picPath;
  var selectFile;

  // Function to handle image selection (replace with your implementation)
  Future<String?> _pickImage() async {
    FilePickerResult? fileResult=await FilePicker.platform.pickFiles();
    if(fileResult!=null)
      {
        //var selected=fileResult.files.first
      }

    /*final picker = ImagePicker();
    List<XFile> pickedImages=[];
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImages.add(pickedFile);
      print("hello world1");
      print(pickedFile.path);
      print("hello world2");
      picPath=pickedFile;
      print("hello world3");*/
      //
      var selectedImageInBytes;
      var image=Image.memory(selectedImage);
      return pickedFile.path;
    }
    return null;
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'عنوان المقالة الجديدة',
          style: communTextStyle20textColor,
          textDirection: TextDirection.rtl,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Avoid excessive scrolling
          children: [
            TextField(
              textAlign: TextAlign.end,
              controller: _titleController, // Title input
              decoration: InputDecoration(hintText: 'أدخل عنوان المقالة'),
            ),
            TextField(
              textAlign: TextAlign.end,
              controller: _longTextController, // Long text input
              maxLines: null, // Allow for multiple lines
              decoration: InputDecoration(hintText: 'أدخل نص المقالة كاملاً'),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    FilePickerResult image =(await FilePicker.platform.pickFiles())!;
                   // final image = await _pickImage();
                    if (image != null) {
                      selectFile=image.files.first.name;
                      // Handle image upload here (replace with your logic)
                    }
                  },
                  child: Text(
                    'إضافة صورة',
                    style: communTextStyle20textColor,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Spacer(), // Add space between buttons
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'إلغاء',
                    style: communTextStyle20textColor,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                TextButton(
                  onPressed: () async{
                    if(_titleController.text==null||_longTextController.text==null||picPath==null){
                      EasyLoading.showError("Please Fill all Required Field");
                    }
                    else{
                      ArticlesController ac=ArticlesController();
                      EasyLoading.show(status: 'Loading....');
                      final imageFile = File(picPath.path);
                      final bytes = await imageFile.readAsBytes();
                      final encodedImageData = base64Encode(bytes);

                        print(imageFile.path+ " File path");
                        List<String> images=[];
                        images.add(imageFile.path);
                        await ac.addArticle(_titleController.text, _longTextController.text, selectFile);
                        if(ac.status==201)
                          EasyLoading.showSuccess('تم حفظ نوع المقالة الجديدة');
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

}*/


import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../controllers/MenuAppController.dart';
import '../../../../controllers/articles_controller.dart';
import '../../../../models/Articles.dart';

class ArticlesList extends StatefulWidget {
  const ArticlesList({
    Key? key,
  }) : super(key: key);

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {

  @override
  Widget build(BuildContext context) {
    var selectedImageInBytes;
    var selectFile;

    ArticlesController ac=ArticlesController();
    Size size =MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child:FutureBuilder<List<Article>>(
            future: ac.fetchArticles(),
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

                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "المقالات",
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
                                label: Text("عنوان المقالة", style: communTextStyle24textColor,),

                              ),
                              DataColumn(
                                label: Text("",),

                              ),DataColumn(
                                label: Text("",),

                              ),

                            ],
                            rows: List.generate(
                                snapshot.data?.length ??0,
                                    (index) =>ArticleDataRow(snapshot.data![index],context)
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    Padding(
                        padding:  EdgeInsets.only(right:size.width*0.48
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              _showTextInputDialog(context);
                            },
                            child: const Icon(Icons.add),
                            style: ButtonStyle(
                              //elevation: MaterialStateProperty.all(40),
                              shape: MaterialStateProperty.all(const CircleBorder()),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                              foregroundColor: MaterialStateProperty.all(white),
                              backgroundColor: MaterialStateProperty.all(textColor), // <-- Button color
                              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                                if (states.contains(MaterialState.pressed)) return white; // <-- Splash color
                              }),)))
                  ],
                );
              }
            }
        )
    );
  }
}
//ArticleDataRow-------------------------
DataRow ArticleDataRow(Article article,BuildContext context) {
  Size size =MediaQuery.of(context).size;
  ArticlesController articlesController=ArticlesController();
  return DataRow(
    cells: [
      DataCell(
        Consumer<ArticlesController>(
            builder: (context,ac,child) {
              return InkWell( // Wrap DataCell with InkWell
                onTap: (){
                  ac.curr_article(article);
                  print(article.id.toString()+"article iddddddddd");
                  print(formatDateString(ac.article0.updatedAt.toString()));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(article.name!,style: communTextStyle24black,overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
      DataCell(SizedBox(width: size.width*0.27,)
      ),
      DataCell(
        Consumer<MenuAppController>(
            builder: (context,mc,child) {
              return IconButton(
                  icon: Icon(Icons.delete, color: white),
                  onPressed: () async {
                    EasyLoading.show(status: 'Loading....');
                    final r = await articlesController.deleteArticle(article.id);
                    if (r == 200)
                      EasyLoading.showSuccess("Done");
                    else
                      EasyLoading.showError('Something must have gone wrong');
                    mc.UpdateScreenIndex(1);
                  });
            }
        ),),


    ],
  );
}
//_showTextInputDialog-----------------------------------------
void _showTextInputDialog(BuildContext context) {
  ArticlesController articlesController=ArticlesController();
  var selectedImageInBytes;
  var selectFile;
  final _titleController = TextEditingController(); // Title input
  final _longTextController = TextEditingController();
  var picPath;
  var picker;
  var bytes;
  // Function to handle image selection (replace with your implementation)
  /*Future<Uint8List?> _pickImage() async {

    picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
        bytes = await imageFile.readAsBytes();
      return bytes;
    } else {
      return null; // Handle the case where no image is selected
    }

    //}
  }*/

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'عنوان المقالة الجديدة',
          style: communTextStyle20textColor,
          textDirection: TextDirection.rtl,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Avoid excessive scrolling
          children: [
            TextField(
              textAlign: TextAlign.end,
              controller: _titleController, // Title input
              decoration: InputDecoration(hintText: 'أدخل عنوان المقالة'),
            ),
            TextField(
              textAlign: TextAlign.end,
              controller: _longTextController, // Long text input
              maxLines: null, // Allow for multiple lines
              decoration: InputDecoration(hintText: 'أدخل نص المقالة كاملاً'),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    articlesController.pickPic("photo");

                  },
                  child: Text(
                    'إضافة صورة',
                    style: communTextStyle20textColor,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Spacer(), // Add space between buttons
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'إلغاء',
                    style: communTextStyle20textColor,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Consumer<ArticlesController>(
                  builder: (context,ac,child) {
                    return TextButton(
                      onPressed: () async{
                        ac.UpdateDescription(_longTextController.text);
                        ac.UpdateName(_titleController.text);
                        if(_titleController.text==null||_longTextController.text==null){
                          EasyLoading.showError("Please Fill all Required Field");
                        }
                        else{
                          EasyLoading.show(status: 'Loading....');
                          final state=await articlesController.uploadArticle(ac.name,ac.description) ;//ac.addArticle(_titleController.text, _longTextController.text, bytes);
                          if(state==201)
                            EasyLoading.showSuccess('تم حفظ نوع المقالة الجديدة');
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
                    );
                  }
                ),
              ],
            ),
          ],
        ),
      );
    },
  );

}
