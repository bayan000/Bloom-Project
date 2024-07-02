import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  var screenIndex;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
  UpdateScreenIndex(var index){
    this.screenIndex=index;
    notifyListeners();
    print("Screen INDEX IS "+index.toString()+ " NOW");
    return index;
  }
}
