import 'package:covid19_dashboard/core/controller/home_controller.dart';
import 'package:covid19_dashboard/core/controller/nav_controller.dart';
import 'package:covid19_dashboard/core/controller/statistics_controller.dart';
import 'package:get/get.dart';
class Binding implements Bindings{
  @override
  void dependencies() {
    Get.put(NavController(),permanent: true);
    Get.put(HomeController(),permanent: true);
    Get.put(SummaryController(),permanent: true);
  }

}