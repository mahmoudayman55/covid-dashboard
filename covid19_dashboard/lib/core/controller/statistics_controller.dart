
import 'package:covid19_dashboard/assets/constants.dart';
import 'package:covid19_dashboard/core/controller/home_controller.dart';
import 'package:covid19_dashboard/core/model/country_summary.dart';
import 'package:covid19_dashboard/core/model/global_summary_model.dart';
import 'package:covid19_dashboard/ui_componants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:fl_chart/fl_chart.dart';

import 'package:dio_http_cache/dio_http_cache.dart';


class SummaryController extends GetxController {
  late GlobalSummary globalSummary;
  RxBool gettingGlobalSummary = RxBool(false);

  CountrySummary? currentCountrySummary;
  List<CountrySummary> countrySummaryList = [];

  List<GlobalSummary> totalNewConfirmedLastWeak = [];
  List<BarChartGroupData> totalNewConfirmedBarGroups = [];

  List<CountrySummary> countryNewConfirmedLastWeak = [];
  List<BarChartGroupData> countryNewConfirmedBarGroups = [];



RxBool networkIssue=RxBool(false);

  getCountrySummary(
      String countryCode, String countrySlug, String countryName) async {
    dio.Response response =
        await dio.Dio().get("https://api.covid19api.com/summary");
    countrySummaryList = (response.data['Countries'] as List)
        .map((e) => CountrySummary.fromJson(e))
        .toList();

    currentCountrySummary = countrySummaryList
        .where((element) =>
            element.date!.month == DateTime.now().month &&
            element.date!.day == DateTime.now().day &&
            element.date!.year == DateTime.now().year &&
            element.countryCode == countryCode)
        .first;
    await getCountryConfirmedLastWeak(countrySlug, countryName);
  }

  getCountryConfirmedLastWeak(String countrySlug, String countryName) async {
    dio.Response response = await dio.Dio()
        .get('https://api.covid19api.com/total/dayone/country/$countrySlug/status/confirmed');

    List<CountrySummary> currentCountrySummaries =
        (response.data as List).map((e) => CountrySummary.fromJson(e)).toList();
    countryNewConfirmedLastWeak = currentCountrySummaries
        .where((element) =>
            DateTime.now().difference(DateTime.parse(element.date.toString())) <
                Duration(days: 10) &&
            element.countryName == countryName)
        .toList();
    countryNewConfirmedBarGroups.clear();
for(int i=1;i<countryNewConfirmedLastWeak.length;i++){

  countryNewConfirmedBarGroups
      .add(BarChartGroupData(x: countryNewConfirmedLastWeak[i].date!.day, barRods: [
    BarChartRodData(
        toY: countryNewConfirmedLastWeak[i].cases!.toDouble()- countryNewConfirmedLastWeak[i-1].cases!.toDouble(),
        color: Colors.lightGreen)
  ]));
}

  }

  getGlobalSummary() async {

    gettingGlobalSummary.value = true;
    update();
    dio.Response response = await dio.Dio().get(
        "https://api.covid19api.com/summary",
        options: buildCacheOptions(Duration(days: 7),));

    if (response.statusCode == 200) {
      globalSummary = GlobalSummary.fromJson(response.data[globalKey]);
      await getTotalConfirmedLastWeak();
      update();
    } else {}

    HomeController homeController = Get.find();
    await getCountrySummary(
        homeController.selectedCountry.iso2.toString(),
        homeController.selectedCountry.slug.toString(),
        homeController.selectedCountry.name.toString());
    gettingGlobalSummary.value = false;
    update();
  }
  Widget globalBottomTitles(double value, TitleMeta meta) {
    TextStyle style = CustomTextStyle(fontSize: 10,fontWeight: FontWeight.normal).customTextStyle();
    String? text;
for (var element in totalNewConfirmedLastWeak) {
  if(element.date!.day.toDouble()==value){
text="${element.date!.day.toString()}/${element.date!.month.toString()}";
  }
}

    return SideTitleWidget(
      child: Text(text!, style: style),
      axisSide: meta.axisSide,
    );
  }
  Widget countryBottomTitles(double value, TitleMeta meta) {
    TextStyle style = CustomTextStyle(fontSize: 10,fontWeight: FontWeight.normal).customTextStyle();
    String? text;
for (var element in countryNewConfirmedLastWeak) {
  if(element.date!.day.toDouble()==value){
text="${element.date!.day.toString()}/${element.date!.month.toString()}";
  }
}

    return SideTitleWidget(
      child: Text(text!, style: style),
      axisSide: meta.axisSide,
    );
  }
  getTotalConfirmedLastWeak() async {
    totalNewConfirmedBarGroups.clear();
    countryNewConfirmedBarGroups.clear();
    dio.Response response =
        await dio.Dio().get('https://api.covid19api.com/world');


    totalNewConfirmedLastWeak = (response.data as List)
        .map((e) => GlobalSummary.fromJson(e))
        .toList()
        .where((element) =>
            DateTime.now().difference(DateTime.parse(element.date.toString())) <
            Duration(days: 6))
        .toList();
    totalNewConfirmedLastWeak.sort((a, b) => a.date!.day.compareTo(b.date!.day));
    totalNewConfirmedBarGroups.clear();
    for (GlobalSummary summary in totalNewConfirmedLastWeak) {
      totalNewConfirmedBarGroups.add(BarChartGroupData(
          x: summary.date!.day,
          barRods: [
            BarChartRodData(
                toY: summary.newConfirmed!.toDouble(), color: Colors.lightGreen)
          ]));

    }
  }

  @override
  void onInit() {
    getGlobalSummary();
  }
}
