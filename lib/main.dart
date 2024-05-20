import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) =>MenuAppController()),
        ChangeNotifierProvider(create: (_) =>ProjectsController()),

      ],
        child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloom Admin',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),

      home: MultiProvider(
          providers: [

            ChangeNotifierProvider(create: (context) => MenuAppController(),),

          ],
          child: new Directionality(textDirection: TextDirection.rtl,
              child: MainScreen())//MainScreen(),
      ),
    );
  }
}