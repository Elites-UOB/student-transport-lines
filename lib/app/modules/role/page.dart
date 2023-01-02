import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import 'controller.dart';

class RolePage extends GetView<RoleController> {
  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/gray_taxi.png"),
              fit: BoxFit.contain,
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: sizew * 0.075, vertical: sizeh * 0.05),
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed('/driver/home');
                  },
                  icon: Icon(Icons.cancel_outlined)),
              // Stepper
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: sizew * 0.4,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (MapEntry entry in controller.steps.asMap().entries)
                          GestureDetector(
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 12.0.w,
                                  height: 3.0.w,
                                  decoration: BoxDecoration(
                                      color: (entry.key == 0 ||
                                              controller.currentStep.value <
                                                  entry.key)
                                          ? Color(Colors.transparent.value)
                                          : Palette.yellowColor),
                                ),
                                Container(
                                  width: 24.w,
                                  height: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.currentStep.value >=
                                              entry.key
                                          ? Palette.yellowColor
                                          : Palette.greyColor2),
                                ),
                              ],
                            ),
                            onTap: () => controller.goToStep(entry.key),
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // Content
              Expanded(
                flex: 8,
                child: Container(
                  alignment: Alignment.topRight,
                  child: Obx(
                    () => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        child: controller.steps[controller.currentStep.value],
                        key: ValueKey<int>(controller.currentStep.value),
                      ),
                    ),
                  ),
                ),
              ),

              // Next Button
              SizedBox(
                width: double.infinity,
                height: 48.0,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            side: BorderSide(color: Colors.transparent))),
                    shadowColor:
                        MaterialStatePropertyAll<Color>(Colors.transparent),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Palette.yellowColor),
                  ),
                  onPressed: () => controller.nextStep(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => !controller.isLoading.value
                            ? Text(
                                controller.currentStep.value ==
                                        controller.steps.length - 1
                                    ? 'حفظ'
                                    : 'التالي',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Tajawal'),
                              )
                            : const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Palette.whiteColor),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
