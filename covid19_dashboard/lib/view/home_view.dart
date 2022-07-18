import 'dart:ui';
import 'package:covid19_dashboard/core/controller/statistics_controller.dart';
import 'package:covid19_dashboard/ui_componants/loading_widget.dart';
import 'package:get/get.dart';
import 'package:covid19_dashboard/core/controller/home_controller.dart';
import 'package:covid19_dashboard/ui_componants/custom_colors.dart';
import 'package:covid19_dashboard/ui_componants/custom_widgets/contact_button.dart';
import 'package:covid19_dashboard/ui_componants/custom_widgets/prevention_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:covid19_dashboard/ui_componants/screen_utils/info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/model/country_model.dart';

class HomeView extends StatelessWidget {

   HomeController homeController = Get.find();



  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      double maxWidth = deviceInfo.width;
      double maxHeight = deviceInfo.height;
      double screenWidth = deviceInfo.screenWidth;
      double screenHeight = deviceInfo.screenHeight;
      return Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Covid-19',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GetBuilder<HomeController>(
                            builder: (controller) {
                              return homeController.gettingCountriesLoading
                                  ? LoadingWidget()
                                  : SizedBox(height: maxHeight*0.06,
                                    child: DropdownButtonFormField<Country>(
                                        value: homeController.selectedCountry,
                                        isExpanded: true,
                                        decoration: InputDecoration(contentPadding: EdgeInsets.all(10),
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(45))),
                                        items: homeController.countries
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(
                                                    e.iso2.toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3!
                                                        .copyWith(
                                                            color: Colors.black),
                                                  ),
                                                  value: e,
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          homeController.selectedCountry = value!;
                                          SummaryController summaryController = Get.find();

                                          summaryController.getGlobalSummary();
                                        }),
                                  );
                            }),
                      )
                    ],
                  ),
                  Text(
                    "Are you feeling sick?",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "if you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContactButton(
                        maxHeight: maxHeight,
                        maxWidth: maxWidth,
                        text: "Call Now",
                        onTap: () =>homeController.makePhoneCall(),
                        icon: Icon(
                          Icons.call,
                          size: 25.w,
                          color: Colors.white,
                        ),
                      ),
                      ContactButton(
                        maxHeight: maxHeight,
                        maxWidth: maxWidth,
                        onTap: ()=>homeController.launchWhatsApp(),
                        text: "WhatsApp",
                        color: CustomColors.green,
                        icon: ImageIcon(
                          AssetImage('lib/assets/images/message.png'),
                          size: 25.w,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60.w)),
                  color: Theme.of(context).primaryColorDark),
              width: maxWidth,
              height: maxHeight * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Preventions',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 20.sp),
              ),
            ),
            SizedBox(
              width: maxWidth,
              height: maxHeight * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Prevention(maxWidth, maxHeight, 'Clean your hands often',
                      'lib/assets/images/washing-hands.png'),
                  Prevention(maxWidth, maxHeight, 'Avoid close contact',
                      'lib/assets/images/quarantine.png'),
                  Prevention(maxWidth, maxHeight, 'Ware a facemask',
                      'lib/assets/images/face-mask.png'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [CustomColors.skyBlue, CustomColors.gBlue],
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      width: maxWidth * 0.8,
                      height: maxHeight * 0.18,
                    ),
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage(
                          'lib/assets/images/medical-team.png',
                        ),
                        width: maxWidth * 0.4,
                      ),
                      SizedBox(
                        width: maxWidth * 0.42,
                        height: maxHeight * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Do your own test!',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 16.sp),
                            ),
                            Text(
                              'Follow the instructions to do your own test.',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
