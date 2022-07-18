import 'package:covid19_dashboard/core/binding.dart';
import 'package:covid19_dashboard/core/controller/home_controller.dart';
import 'package:covid19_dashboard/core/controller/nav_controller.dart';
import 'package:covid19_dashboard/core/controller/statistics_controller.dart';
import 'package:covid19_dashboard/ui_componants/Themes.dart';
import 'package:covid19_dashboard/view/controller_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
        builder: (context,child) {
          return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: Themes().getThemeMode(),
          darkTheme: Themes().customDarkTheme,
          theme: Themes().customLightTheme,
getPages: [
  GetPage(
    name: '/nav',
    page: () => ControllerView(),
    binding: BindingsBuilder(() {
      Get.lazyPut(()=> HomeController());
      Get.lazyPut(()=> SummaryController());
      Get.put( NavController());


    }),
  ),
],

initialRoute: '/nav',    );
        }
      );
  }
}

