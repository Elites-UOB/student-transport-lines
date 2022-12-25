import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/utils/widgets/radio.dart';

import '../../../../core/theme/color_theme.dart';
import '../controller.dart';

class Step1 extends GetWidget<RoleController> {
  const Step1({super.key});
  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;

    return Obx(() => Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "اختر دورك",
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Palette.greyColor2,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(children: [
                  CustomRadio(
                    title: "مستخدم",
                    value: 0,
                    groupValue: controller.role.value,
                    onChanged: (val) {
                      controller.role.value = val;
                    },
                  ),
                  const Divider(
                    color: Palette.greyColor2,
                  ),
                  CustomRadio(
                    title: "سائق",
                    value: 1,
                    groupValue: controller.role.value,
                    onChanged: (val) {
                      controller.role.value = val;
                    },
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
