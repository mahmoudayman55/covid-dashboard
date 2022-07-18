import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactButton extends StatelessWidget {
  Color color;
  Widget icon;
  Function onTap;
  String text;
  double maxHeight, maxWidth;

  ContactButton(
      {this.color = Colors.red,
      this.text = "Call Now",
      required this.maxHeight,
      required this.maxWidth,
       required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(10),
          fixedSize: Size(maxWidth * 0.4, maxHeight*0.07),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: () => onTap(),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center,

        children: [
       icon,
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 15.sp),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
