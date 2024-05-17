import 'package:admin/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/MenuAppController.dart';
import 'components/header.dart';

import 'components/projects_list.dart';
import 'components/project_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Consumer<MenuAppController>(
            builder: (context,mAC,child) {
              if (mAC.screenIndex==0)
                return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child:  Column(
                        children: [
                          SizedBox(height: defaultPadding),
                          ProjectsList(),
                          if (Responsive.isMobile(context))
                            SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context))
                            ProjectDetails(),
                        ],
                      )
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: ProjectDetails(),
                  ),
              ],
            );
            else
              {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 5,
                        child:  Column(
                          children: [
                            SizedBox(height: defaultPadding),
                            ProjectsList(),
                            if (Responsive.isMobile(context))
                              SizedBox(height: defaultPadding),
                            if (Responsive.isMobile(context))
                              ProjectDetails(),
                          ],
                        )
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we don't want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: ProjectDetails(),
                      ),
                  ],
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
