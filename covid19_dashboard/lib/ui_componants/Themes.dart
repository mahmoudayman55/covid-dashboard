import 'package:covid19_dashboard/ui_componants/custom_colors.dart';
import 'package:covid19_dashboard/ui_componants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class Themes {

  final ThemeData customLightTheme = ThemeData.light().copyWith(

  textTheme: TextTheme(

          headline1: CustomTextStyle(fontSize: 20).customTextStyle(),
          headline2: CustomTextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: CustomColors.deepBlue)
              .customTextStyle(),
    headline3: CustomTextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white70)
              .customTextStyle(),
    headline4: CustomTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white)
              .customTextStyle(),

      ),
      primaryColorDark: CustomColors.lightBlue,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: CustomColors.softGrayBlue),
      appBarTheme: AppBarTheme(elevation: 0, color: CustomColors.lightBlue));

  ///dark
  final ThemeData customDarkTheme =
  ThemeData.dark().copyWith(
      textTheme: TextTheme(

        headline1: CustomTextStyle(fontSize: 20).customTextStyle(),
        headline2: CustomTextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.white)
            .customTextStyle(),
        headline3: CustomTextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: Colors.white70)
            .customTextStyle(),
        headline4: CustomTextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.white)
            .customTextStyle(),

      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: CustomColors.grayBlue),
      primaryColorDark: CustomColors.grayBlue,
      scaffoldBackgroundColor: CustomColors.deepBlue,
      colorScheme: ColorScheme.fromSwatch(
          primaryColorDark: CustomColors.grayBlue,
          primarySwatch:
              CustomColors().createMaterialColor(CustomColors.lightBlue)),
      appBarTheme: AppBarTheme(elevation: 0, color: CustomColors.grayBlue));

  final GetStorage _getStorage = GetStorage();
  final _darkThemeKey = "isDark";

  saveTheme(bool isDark)  {
     _getStorage.write(_darkThemeKey, isDark);
  }

  bool isDarkTheme() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  changeTheme() async {
     Get.changeTheme(isDarkTheme() ? customLightTheme : customDarkTheme);
     saveTheme(!isDarkTheme());


  }

  ThemeMode getThemeMode() {
    return isDarkTheme() ? ThemeMode.dark : ThemeMode.light;
  }
}
