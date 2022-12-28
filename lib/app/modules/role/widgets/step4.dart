import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/utils/widgets/dropdown.dart';

import '../../../../core/theme/color_theme.dart';
import '../controller.dart';

class Step4 extends GetWidget<RoleController> {
  const Step4({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "المحافظة",
                style: TextStyle(
                    color: Palette.greyColor3,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Tajawal",
                    fontSize: 20.w),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.transparent, //background color of dropdown button
                border: Border.all(
                    color: Palette.greyColor3,
                    width: 1), //border of dropdown button
                borderRadius: BorderRadius.circular(
                    12), //border raiuds of dropdown button
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20.w, left: 10.w, top: 10.h, bottom: 10.h),
                child: DropdownButton(
                  value: controller.province.value,
                  items: controller.provinces.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {
                    controller.province.value = _!;
                    controller.getCities(controller.province.value);
                  },
                  icon: Icon(Icons.arrow_drop_down_rounded, size: 40.w),
                  iconEnabledColor: Palette.greyColor3, //Icon color
                  style: TextStyle(
                    color: Palette.greyColor3,
                    fontSize: 20.w,
                    fontFamily: "Tajawal",
                  ),
                  underline: Container(),
                  isExpanded: true,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "المدينة",
                style: TextStyle(
                    color: Palette.greyColor3,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Tajawal",
                    fontSize: 20.w),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.transparent, //background color of dropdown button
                border: Border.all(
                    color: Palette.greyColor3,
                    width: 1), //border of dropdown button
                borderRadius: BorderRadius.circular(
                    12), //border raiuds of dropdown button
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20.w, left: 10.w, top: 10.h, bottom: 10.h),
                child: DropdownButton(
                  value: controller.city.value,
                  items: controller.cities.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {
                    controller.city.value = _!;
                  },
                  icon: Icon(Icons.arrow_drop_down_rounded, size: 40.w),
                  iconEnabledColor: Palette.greyColor3, //Icon color
                  style: TextStyle(
                    color: Palette.greyColor3,
                    fontSize: 20.w,
                    fontFamily: "Tajawal",
                  ),
                  underline: Container(),
                  isExpanded: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
