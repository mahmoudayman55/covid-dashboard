import 'dart:math';

import 'package:covid19_dashboard/ui_componants/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DataView extends StatelessWidget {
  String label;
     var value;
  Color color;

  DataView(
      {required this.color,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(label,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w500),),
          Text(value.toString(),style: Theme.of(context).textTheme.headline4),
        ],
      ),
    );
  }
}
