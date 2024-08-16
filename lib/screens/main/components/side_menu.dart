import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  MenuAppController menuAppController=MenuAppController();

   SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<MenuAppController>(
        builder: (context,mAC,child) {
      return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/Bloom Logoooooooooo.png"),
          ),

          DrawerListTile(
            title: "المشاريع",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {mAC.UpdateScreenIndex(13);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "المقالات",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {mAC.UpdateScreenIndex(1);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "الشكاوى",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {mAC.UpdateScreenIndex(2);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "المستثمرين",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {mAC.UpdateScreenIndex(3);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "أصحاب العمل",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {mAC.UpdateScreenIndex(4);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "المعاملات",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {mAC.UpdateScreenIndex(5);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "التقارير",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {mAC.UpdateScreenIndex(6);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "طلبات التواصل",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {mAC.UpdateScreenIndex(7);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "المشاريع المعلقة",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {mAC.UpdateScreenIndex(8);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "طلبات المعاملات",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {mAC.UpdateScreenIndex(10);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "المعاملات المقبولة",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {mAC.UpdateScreenIndex(11);
            print(mAC.screenIndex);},
          ),
          DrawerListTile(
            title: "المحادثات",
            svgSrc: "assets/icons/chat.svg",
            press: () {mAC.UpdateScreenIndex(12);
            print(mAC.screenIndex);},
          ),
        ],
      ),
    );});
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style:communTextStyle24textColor
      ),
    );
  }
}
