import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/text_theme.dart';

class textFiled extends StatelessWidget {
  final String headtext;
  final String hinttext;
  final TextEditingController controller;
  final bool isPassword;
  final bool isEmail;
  final IconData? icon;

  const textFiled({
    super.key,
    required this.controller,
    required this.headtext,
    required this.hinttext,
    this.isPassword = false,
    this.isEmail = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headtext,
          style: TextStyle(
            fontFamily: 'Tajawal',
            color: Colors.grey,
            fontSize: 18.sp,
          ),
        ),
        Container(
          height: 40.h,
          padding: EdgeInsets.only(left: 5),
          // margin: EdgeInsets.symmetric(horizontal: width),
          decoration: BoxDecoration(
            color: Palette.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              icon: icon != null ? Icon(icon) : null,
              hintText: hinttext,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintStyle: Styles.hintText,
            ),
            controller: controller,
            obscureText: isPassword,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            //keyboardType: TextInputType.numberWithOptions(),
          ),
        ),
      ],
    );
  }
}
