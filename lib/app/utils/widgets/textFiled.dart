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
    this.headtext = "",
    this.hinttext = "",
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
        headtext.isNotEmpty
            ? Text(
                headtext,
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: Colors.grey,
                  fontSize: 18.sp,
                ),
              )
            : Container(),
        Container(
          // height: 40.h,
          padding: EdgeInsets.only(left: 5),
          child: TextFormField(
            style: TextStyle(fontSize: 20.w),
            decoration: InputDecoration(
              icon: icon != null ? Icon(icon) : null,
              hintText: hinttext,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.greyColor2),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Palette.blackColor),
                  borderRadius: BorderRadius.circular(12)),
              hintStyle: Styles.hintText,
            ),
            cursorColor: Palette.greyColor3,
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
