import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/controllers/login_controller.dart';
import 'package:admin/models/loginModel.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/Login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size= MediaQuery.of(context).size;

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "الداشبورد",
            style: TextStyle(color: white,
              fontFamily: 'font1',
              fontSize: 34,
              fontWeight: FontWeight.bold,
            )
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 1 : 1),
        Expanded(child: SearchField()),
        if (!Responsive.isMobile(context))
          SizedBox(width: size.width*0.04,),
         // Spacer(flex: Responsive.isDesktop(context) ? 1 : 1),
        ProfileCard()
      ],
    );
  }
}
class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          if (!Responsive.isMobile(context))
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("الآدمن",style: communTextStyle24black,),
            ),
         // Icon(Icons.keyboard_arrow_down),
          Image.asset(
            "assets/images/profile.jpg",
            height: 38,
          ),
          _buildDropdownMenu(context),
        ],
      ),
    );
  }
}
Widget _buildDropdownMenu(BuildContext context) {
  return DropdownButton<String>(
    underline: Container(), // Remove default underline
    icon: Icon(
      Icons.keyboard_arrow_down,
      color: Colors.white, // Adjust color for RTL display
    ),
    items: [
      DropdownMenuItem<String>(
        alignment: AlignmentDirectional.bottomEnd,
        value: 'logout',
        child: Text(
          'تسجيل خروج',
          style: communTextStyle20textColor,
          textDirection: TextDirection.rtl,// Adjust color for RTL
        ),

      ),
     DropdownMenuItem<String>(
       alignment: AlignmentDirectional.bottomEnd,

       value: 'textform',
        child: Text(
          'أضف نوع مشروع جديد',
          style: communTextStyle20textColor,
          textDirection: TextDirection.rtl,// Adjust color for RTL
        ),
      ),
    ],
    onChanged: (value) async{
      if (value == 'logout') {
          LoginController loginController=LoginController();
          EasyLoading.show(status: 'Loading....');
          await loginController.onClickLogout();
          print(loginController.message);
            EasyLoading.showSuccess("Logged Out Successfully");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );




        // Call your defined function here
      } else if (value == 'textform') {
        _showTextInputDialog(context);
      }
    },
  );

}

void _showTextInputDialog(BuildContext context) {
  final _textController = TextEditingController(); // Declare a TextEditingController

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'أدخل النوع',
          style: communTextStyle20textColor,
          textDirection: TextDirection.rtl,
        ),
        content: TextField(
          controller: _textController, // Assign the TextEditingController
          decoration: InputDecoration(hintText: 'أدخل النص هنا'),
        ),
        actions: [
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
              final userInput = _textController.text; // Get the text from controller
              print('User input: $userInput');
              ProjectsController p=ProjectsController();
              EasyLoading.show(status: 'Loading....');
              await p.addProjectType(userInput);
              if(p.status==201)
                EasyLoading.showSuccess('تم حفظ نوع المشاريع الجديد');
              else
                EasyLoading.showError('Something went wrong');
              Navigator.pop(context);
            },
            child: Text(
              'تأكيد',
              style: communTextStyle20textColor,
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      );
    },
  );
}

/*
void _showTextInputDialog(BuildContext context) {

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('أدخل النوع',
          style: communTextStyle20textColor,
          textDirection: TextDirection.rtl,),
        content: TextField(

          decoration: InputDecoration(hintText: 'أدخل النص هنا'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء',
              style: communTextStyle20textColor,
              textDirection: TextDirection.rtl,),
          ),
          TextButton(
            onPressed: () async{
              ProjectsController p=ProjectsController();
              await p.addProjectType();
              // Handle text input submission here
              Navigator.pop(context);
            },
            child: Text('تأكيد',
              style: communTextStyle20textColor,
              textDirection: TextDirection.rtl,),
          ),
        ],
      );
    },
  );
}
*/
class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "ابحث",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
