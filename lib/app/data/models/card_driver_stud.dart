import 'package:flutter/material.dart';

import '../../../core/theme/color_theme.dart';

class card_driver_stud extends StatelessWidget {
 final String  myimg;
 final String headtext;
 final String destext;
 final Color backroundImg;
 final Color backroundCard;
 final Color destextColor;

 final VoidCallback onPressed;

  const card_driver_stud({ required this.myimg, required this.headtext, required this.destext,
    required this.backroundImg, required this.backroundCard, required this.onPressed, required this.destextColor}) ;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onPressed ,
      child: Container(
        height: 118,width:345 ,
        padding:EdgeInsets.only(right: 20) ,
        decoration: BoxDecoration(color: backroundCard,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(headtext,
                  style:  TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      color:destextColor
                  ),),

                Text(destext,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 14,
                      color:destextColor
                  ),),
              ],
            ),

            Container(height: 70,width: 70,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color:backroundImg ,
                    borderRadius: BorderRadius.circular(10)),
                child:  Image(image: AssetImage(myimg))),
          ],
        ),
      ),
    );
  }
}
