import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ActiveNavBarIcon extends StatelessWidget{
  double maxWidth,maxHeight;
  IconData activeIconData;

  ActiveNavBarIcon(this.maxWidth, this.maxHeight,this.activeIconData);

  @override
  Widget build(BuildContext context) {
return     Container(
  width: maxWidth * 0.15,
  height: maxHeight * 0.05,
  padding: EdgeInsets.all(5),
  decoration: BoxDecoration(
      color: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(20)),
  child: Icon(
    activeIconData,
    size: 20.w,
    color: Colors.white,
  ),
);
  }

}