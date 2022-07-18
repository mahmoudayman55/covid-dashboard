import 'dart:developer';
import 'dart:math';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:covid19_dashboard/core/model/country_model.dart';
import 'package:covid19_dashboard/view/controller_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import '../../view/home_view.dart';

class HomeController extends GetxController {
  bool gettingCountriesLoading = false;
  List<Country> countries = [];
  List<DropdownMenuItem<Country>> countriesItems = [];
  late Country selectedCountry;

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+41 798 931 892',
      text: "hi",
    );
    await launch('$link');
  }

  Future<void> makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '+41 798 931 892',
    );
    await launchUrl(launchUri);
  }

  getCountries() async {
    gettingCountriesLoading = true;
    update();
    try {
      dio.Response response = await dio.Dio().get(
          "https://api.covid19api.com/countries",
          options: buildCacheOptions(Duration(days: 7), forceRefresh: true));

      countries = (response.data as List).map((country) {
        return Country.fromJson(country);
      }).toList();

      countries.removeWhere((element) => element.name == "Israel");
      selectedCountry = (countries
          .where(
            (element) => element.name == "Egypt",
          )
          .first);
    } catch (e) {
      Get.defaultDialog(content:
      Text('Network error',style: TextStyle(color: Colors.red),),onConfirm: () {
        Get.back();
        getCountries();
      },textConfirm: 'reload',buttonColor: Colors.red,confirmTextColor: Colors.white

     );
    }

    gettingCountriesLoading = false;
    update();
  }

  @override
  void onInit() {
    getCountries();
  }
}
