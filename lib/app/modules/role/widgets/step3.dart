import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/utils/widgets/radio.dart';
import 'package:student_transport_lines/app/utils/widgets/textFiled.dart';

import '../../../../core/theme/color_theme.dart';
import '../controller.dart';

class Step3 extends GetWidget<RoleController> {
  const Step3({super.key});
  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "رقم الهاتف",
                style: TextStyle(
                    color: Palette.greyColor3,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Tajawal",
                    fontSize: 20.w),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            textFiled(controller: controller.mobile),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "معرف التيلغرام",
                style: TextStyle(
                    color: Palette.greyColor3,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Tajawal",
                    fontSize: 20.w),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            textFiled(controller: controller.telegram)
          ],
        ));
  }
}
