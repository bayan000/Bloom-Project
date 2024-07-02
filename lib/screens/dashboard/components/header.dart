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
    dropdownColor: textColor,
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
          style: communTextStyle20white,
          textDirection: TextDirection.rtl,// Adjust color for RTL
        ),

      ),
     DropdownMenuItem<String>(
       alignment: AlignmentDirectional.bottomEnd,

       value: 'textform',
        child: Text(
          'أضف نوع مشروع جديد',
          style: communTextStyle20white,
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
class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {

  String _selectedFilter = "عن طريق الاسم";

  List<String> _filters = ["عن طريق الاسم", "عن طريق الكلفة"];

  final TextEditingController _searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Consumer<ProjectsController>(
            builder: (context, pc, child) {
              return TextField(
                controller: _searchController, // Use TextEditingController
                decoration: InputDecoration(
                  hintText: "ابحث",
                  fillColor: secondaryColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: Consumer<MenuAppController>(
                      builder: (context,mAC,child) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DropdownButton<String>(
                            value: _selectedFilter,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: communTextStyle20white, // Assuming this is your text style
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedFilter = newValue!;
                              });
                              pc.Update_selectedFilter(_selectedFilter);
                              pc.UpdateSearchValue(newValue);
                              mAC.UpdateScreenIndex(9);
// Update search value in controller
                            }, items: _filters.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                              dropdownColor: textColor,
                          ),
                          Consumer<MenuAppController>(
                            builder: (context,mAC,child) {
                              return IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  final searchTerm = _searchController.text;
                                  if(pc.selectedFilter==null)pc.Update_selectedFilter("عن طريق الاسم");
                                  print("Search: ${pc.selectedFilter} - $searchTerm");
                                  pc.Update_selectedFilter(_selectedFilter);
                                  pc.UpdateSearchValue(searchTerm);
                                  mAC.UpdateScreenIndex(9);
                                  }, // Call separate onSearch function
                              );
                            }
                          ),
                        ],
                      );
                    }
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


