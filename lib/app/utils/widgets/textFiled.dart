import 'package:flutter/material.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/text_theme.dart';

class textFiled extends StatelessWidget {
  final String headtext;
  final String hinttext;
  final TextEditingController controller;
  // final bool isPassword;
  // final bool isEmail;

  const textFiled(
      {super.key,
      required this.controller,
      required this.headtext,
      required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headtext,
            style:const TextStyle(
              color: Colors.grey,
              fontFamily: 'Tajawal',
              fontSize: 18,
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Palette.greyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration:
                  InputDecoration(hintText: hinttext, border: InputBorder.none,
                      hintStyle: Styles.hintText),
              controller: controller,

              //keyboardType: TextInputType.numberWithOptions(),
            ),
          ),
        ],
      ),
    );
  }
}
