import 'package:covid19_dashboard/view/controller_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../ui_componants/Themes.dart';
import '../../view/home_view.dart';
class NavController extends GetxController{

  Widget currentScreen=HomeView();
  int currentIndex=0;
  changeTheme(){
    Themes().changeTheme();
    Get.forceAppUpdate();
    update();
  }
//git clone git@github.com:mahmoudayman55/covid_dashboard - Correct

}