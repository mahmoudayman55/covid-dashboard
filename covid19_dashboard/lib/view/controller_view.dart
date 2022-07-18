import 'package:covid19_dashboard/core/controller/home_controller.dart';
import 'package:covid19_dashboard/ui_componants/custom_widgets/active_bottom_nav_item.dart';
import 'package:covid19_dashboard/view/home_view.dart';
import 'package:covid19_dashboard/view/statistics_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:covid19_dashboard/core/controller/nav_controller.dart';
import 'package:covid19_dashboard/ui_componants/custom_app_bar.dart';
import 'package:covid19_dashboard/ui_componants/screen_utils/info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui_componants/Themes.dart';
import '../ui_componants/custom_colors.dart';

class ControllerView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (controller) {
      return InfoWidget(builder: (context, deviceInfo) {
        double maxWidth = deviceInfo.width;
        double maxHeight = deviceInfo.height;
        double screenWidth = deviceInfo.screenWidth;
        double screenHeight = deviceInfo.screenHeight;
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed:  ()=>
                   controller.changeTheme()
                  ,
                    icon: Icon(
                      Themes().isDarkTheme()
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: Themes().isDarkTheme()
                          ? Colors.amber
                          : CustomColors.deepBlue,
                    ))
              ],
            ),
            body: controller.currentScreen,
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: false,onTap: (i){
                controller.currentIndex=i;
              controller.update();
              controller.currentScreen=i==0?HomeView():StatisticsView();
              controller.update();
              },
              currentIndex: controller.currentIndex,
              items: [
               BottomNavigationBarItem(
                   activeIcon: ActiveNavBarIcon(maxWidth,maxHeight,Icons.home),
                    label: '',
                    icon: Icon(Icons.home ,size: 20.w,)),
                BottomNavigationBarItem(
                    label: '',
                    activeIcon: ActiveNavBarIcon(maxWidth,maxHeight,Icons.stacked_bar_chart),
                    icon: Container(
                      child: Icon(Icons.stacked_bar_chart,size: 20.w,),
                    )),
              ],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ));
      });
    });
  }
}

