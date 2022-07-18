


import 'package:covid19_dashboard/core/controller/home_controller.dart';
import 'package:covid19_dashboard/ui_componants/loading_widget.dart';
import 'package:flutter/painting.dart';
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

class CountrySummaryView extends StatelessWidget {
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
      return Scaffold(
          backgroundColor: Theme.of(context).primaryColorDark,
          body:  Container(
            height: maxHeight,
            child: Obx(
                  ()=> Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  summaryController.gettingGlobalSummary.value?LoadingWidget():
                  Expanded(flex: 2,
                    child: Container(padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        width: maxWidth,
                        child: StaggeredGrid.count(
                          axisDirection: AxisDirection.right,
                          crossAxisCount: 4,
                          crossAxisSpacing: maxHeight * 0.02,
                          mainAxisSpacing: maxHeight * 0.02,
                          children: [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 3.1.w,
                              child: DataView(

                                color: Colors.red,
                                label: "New Confirmed",
                                value: summaryController
                                    .currentCountrySummary!.newConfirmed!
                                    .toInt(),
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.07.w,
                              child: DataView(

                                color: Colors.green,
                                label: "Total Confirmed",
                                value: summaryController
                                    .currentCountrySummary!.totalConfirmed!
                                    .toInt(),
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.07.w,
                              child: DataView(


                                color: Colors.cyan,
                                label: "New Deaths",
                                value: summaryController
                                    .currentCountrySummary!.newDeaths!
                                    .toInt(),
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 3.1.w,
                              child: DataView(


                                color: Colors.orangeAccent,
                                label: "New Recovered",
                                value: summaryController
                                    .currentCountrySummary!.newRecovered!
                                    .toInt(),
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.07.w,
                              child: DataView(


                                color: Colors.purple,
                                label: "Total Deaths",
                                value: summaryController
                                    .currentCountrySummary!.totalDeaths!
                                    .toInt(),
                              ),
                            ),
                          ],
                        )),
                  ),

                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('New Cases',style: Theme.of(context).textTheme.headline4,),
                            )),
                        Expanded(flex: 8,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.deepBlue.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              padding: EdgeInsets.all(30),
                              width: maxWidth,
                              child:summaryController.gettingGlobalSummary.value?LoadingWidget(): BarChart(
                                BarChartData(
                                    barGroups: summaryController.countryNewConfirmedBarGroups,
                                    gridData: FlGridData(
                                        checkToShowVerticalLine: (value) =>
                                        value % 3 == 0,
                                        getDrawingHorizontalLine: (value) =>
                                            FlLine(
                                                color: Colors.white,
                                                strokeWidth: 0.3,
                                                dashArray: [8])),
                                    titlesData: FlTitlesData(
                                        bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(showTitles: true,
                                                getTitlesWidget:
                                                summaryController
                                                    .countryBottomTitles)),
                                        topTitles: AxisTitles(
                                            sideTitles:
                                            SideTitles(showTitles: false)),
                                        rightTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ))),
                                    borderData: FlBorderData(show: false)),
                                swapAnimationDuration: Duration(seconds: 2),
                                swapAnimationCurve: Curves.easeInOutSine,
                              )
                          ),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ),
          ));

    });
  }
}
