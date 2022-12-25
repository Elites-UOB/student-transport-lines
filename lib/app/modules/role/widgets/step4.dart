import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/color_theme.dart';
import '../controller.dart';

class Step4 extends GetWidget<RoleController> {
  const Step4({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            DropdownButton<String>(
              items: controller.provinces.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: controller.province.value,
              onChanged: (_) {
                controller.province.value = _!;
                controller.getCities(controller.province.value);
              },
            ),
            DropdownButton<String>(
              items: controller.cities.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: controller.city.value,
              onChanged: (_) {
                controller.city.value = _!;
              },
            )
          ],
        ));
  }
}
