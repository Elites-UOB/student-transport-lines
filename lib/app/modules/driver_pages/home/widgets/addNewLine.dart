import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/core/theme/text_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class addNewLine extends GetWidget {
  const addNewLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return ListTile(
      //image
      leading: Container(
        height: 60.h,
        width: 50.w,
        decoration: BoxDecoration(
            color: Color(0xFFF6F7F9), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(
            'assets/images/taxi.svg',
          ),
        ),
      ),

      //collage name
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'كلية علوم الحاسوب / صباحي',
            style: Styles.boldblue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  '4',
                  style: Styles.boldblue,
                ),
                SizedBox(
                  width: 25,
                ),
                Text('2', style: Styles.boldblue),
              ],
            ),
          ),
        ],
      ),

      //university name
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('جامعة البصرة'),
          Row(
            children: const [
              Text(
                'مقاعد ',
                style: Styles.hintText,
              ),
              SizedBox(
                width: 5,
              ),
              Text('شاغر', style: Styles.hintText)
            ],
          )
        ],
      ),
    );
  }
}


// //مقاعد && شاغر
// trailing:Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Column(
// children: [
// Text('كلية علوم الحاسوب / صباحي')
// ],
// ),
//
// Column(
// children: const[
// Text('4',
// style: TextStyle(
// color: Palette.blueColor,fontWeight: FontWeight.bold,fontSize: 18
// ),),
// Text(' مقاعد   ',style: Styles.hintText,)
// ],
// ),
//
// Column(
// children: const[
// Text('2',
// style: TextStyle(
// color: Palette.blueColor,fontWeight: FontWeight.bold,fontSize: 18
// ),),
// Text('شاغر',style: Styles.hintText,)
// ],
// )
// ],
// ),