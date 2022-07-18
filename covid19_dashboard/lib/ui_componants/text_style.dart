import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextStyle{
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
   CustomTextStyle(
      {
        this.textAlign=TextAlign.start,
        this.fontSize = 18,
        this.color = Colors.white,
        this.fontWeight = FontWeight.w800});

   TextStyle customTextStyle() {

  return TextStyle(color: color,fontWeight: fontWeight,fontSize: fontSize.sp,fontFamily: 'Graphik');


}
}