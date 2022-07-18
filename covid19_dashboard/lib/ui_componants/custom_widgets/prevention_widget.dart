import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Prevention extends StatelessWidget{
  double maxWidth,maxHeight;
  String title,image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth*0.25,
      height: maxHeight*0.25,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Image(image: AssetImage(image),width: maxWidth*0.25),
        Text(title,style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center,)
      ],),);}

  Prevention(this.maxWidth, this.maxHeight, this.title,this.image);
}