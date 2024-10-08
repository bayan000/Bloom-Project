import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/controllers/ReportsController.dart';
import 'package:admin/controllers/StatisticsController.dart';
import 'package:admin/controllers/appointments_controller.dart';
import 'package:admin/controllers/articles_controller.dart';
import 'package:admin/controllers/comreqController.dart';
import 'package:admin/controllers/investor_controller.dart';
import 'package:admin/controllers/login_controller.dart';
import 'package:admin/controllers/messagesController.dart';
import 'package:admin/controllers/transactionsController.dart';
import 'package:admin/controllers/transactionsRequestsController.dart';
import 'package:admin/controllers/workerInfoController.dart';
import 'package:admin/controllers/workersController.dart';
import 'package:admin/screens/Login/login_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/CommunicationRequestsController.dart';
import 'controllers/ComplaintsController.dart';
import 'controllers/aninvestorController.dart';

void main() async{
  await GetStorage.init();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) =>LoginController()),
        ChangeNotifierProvider(create: (_) =>MenuAppController()),
        ChangeNotifierProvider(create: (_) =>ProjectsController()),
        ChangeNotifierProvider(create: (_) =>ArticlesController()),
        ChangeNotifierProvider(create: (_) =>InvestorsController()),
        ChangeNotifierProvider(create: (_) =>InvestorController()),
        ChangeNotifierProvider(create: (_) =>WorkersController()),
        ChangeNotifierProvider(create: (_) =>WorkerInfoController()),
        ChangeNotifierProvider(create: (_) =>CommunicationRequestsController()),
        ChangeNotifierProvider(create: (_) =>ComplaintsController()),
        ChangeNotifierProvider(create: (_) =>ReportsController()),
        ChangeNotifierProvider(create: (_) =>ComReqController()),
        ChangeNotifierProvider(create: (_) =>TransactionsController()),
        ChangeNotifierProvider(create: (_) =>TransactionsRequestsController()),
        ChangeNotifierProvider(create: (_) =>StatisticsController()),
        ChangeNotifierProvider(create: (_) =>MessagesController()),
        ChangeNotifierProvider(create: (_) =>AppointmentsController()),
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
      builder: EasyLoading.init(),
      home: MultiProvider(
          providers: [

            ChangeNotifierProvider(create: (context) => MenuAppController(),),

          ],
          child: new Directionality(textDirection: TextDirection.rtl,
              child:GetStorage().hasData('token') ? //TestWidget():
              MainScreen() :
              LoginPage()//
          )//MainScreen(),
      ),
    );
  }
}