import 'package:covid19_dashboard/core/controller/home_controller.dart';
import 'package:covid19_dashboard/core/model/global_summary_model.dart';
import 'package:covid19_dashboard/ui_componants/loading_widget.dart';
import 'package:covid19_dashboard/view/country_summary.dart';
import 'package:covid19_dashboard/view/global_summary.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'dart:ui';
import 'package:covid19_dashboard/core/model/country_summary.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:covid19_dashboard/ui_componants/custom_colors.dart';
import 'package:covid19_dashboard/ui_componants/custom_widgets/contact_button.dart';
import 'package:covid19_dashboard/ui_componants/custom_widgets/data_view_container.dart';
import 'package:covid19_dashboard/ui_componants/custom_widgets/prevention_widget.dart';
import 'package:covid19_dashboard/view/home_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:covid19_dashboard/ui_componants/screen_utils/info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/controller/statistics_controller.dart';

class StatisticsView extends StatelessWidget {
  HomeController homeController = Get.find();
  SummaryController summaryController =
    Get.find();

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      double maxWidth = deviceInfo.width;
      double maxHeight = deviceInfo.height;
      double screenWidth = deviceInfo.screenWidth;
      double screenHeight = deviceInfo.screenHeight;
      return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Statistics'),
            ),
            backgroundColor: Theme.of(context).primaryColorDark,
            body: RefreshIndicator(
              onRefresh: () async {
              },
              child: SizedBox(height: maxHeight,
                width: maxWidth,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(50)),
                      width: maxWidth * 0.9,
                      height: maxHeight * 0.08,
                      child: TabBar(
                          labelColor: Colors.black,
                          indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          indicatorColor: Colors.white,
                          onTap: (index) {

                          },
                          tabs: [
                            Tab(
                              text: 'My country',
                            ),
                            Tab(
                              text: 'Global',
                            ),
                          ]),
                    ),

                    Expanded(
                      child: TabBarView(
                        children: [
                          CountrySummaryView(),
                          GlobalSummaryView(),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
    });
  }
}
