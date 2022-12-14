import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../core/theme/color_theme.dart';
import '../../../utils/widgets/textFiled.dart';
import '../../auth/controller.dart';
import '../../driver_pages/register/widgets/dropdown.dart';
import 'widgets/dropdown.dart';

class StudentRegisterPage extends GetView<AuthController> {
  const StudentRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //text تسجيل المستخدم
                    const Text(
                      'تسجيل المستخدم',
                      style: TextStyle(fontSize: 25, color: Palette.blueColor),
                    ),

                    const SizedBox(height: 18),

                    //
                    Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        height: 700.h,
                        width: 345.w,
                        decoration: BoxDecoration(
                            color: Palette.whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Form(
                            child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            textFiled(
                              controller: controller.name,
                              headtext: 'الأسم',
                              hinttext: 'حسن خالد الطالب',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //name filed
                            textFiled(
                              controller: controller.email,
                              headtext: 'البريد الالكتروني',
                              hinttext: 'example@gmail.com',
                              isEmail: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                dropdown(
                                  headtext: 'المحافظة',
                                  hinttext: 'البصرة',
                                  item: controller.provinces.value,
                                  controller: controller.provinceId,
                                ),
                                dropdown(
                                  headtext: 'المدينة',
                                  hinttext: 'شط العرب',
                                  item: controller.cities.value,
                                  controller: controller.cityId,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            textFiled(
                                controller: controller.telegarm,
                                headtext: 'معرّف التلكرام',
                                hinttext: 'khaltk.3mtk'),
                            const SizedBox(
                              height: 20,
                            ),
                            textFiled(
                              controller: controller.password,
                              headtext: 'كلمة المرور',
                              hinttext: 'خالتك',
                              isPassword: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            dropdownstud(
                              controller: TextEditingController(),
                              item: controller.universities.value,
                              headtext: 'الجامعة',
                              hinttext: 'جامعة البصرة',
                              width: 19,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            dropdownstud(
                              controller: TextEditingController(),
                              item: controller.colleges.value,
                              headtext: 'الكلية',
                              hinttext: 'مجمع كليات الكرمة',
                              width: 19,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            dropdownstud(
                              controller: TextEditingController(),
                              item: [
                                {'id': 1, 'name': 'صباحي'},
                                {'id': 2, 'name': 'مسائي'}
                              ],
                              headtext: 'الدراسة',
                              hinttext: 'مسائي',
                              width: 19,
                            ),
                            InkWell(
                              onTap: () {
                                controller.register();
                                // Get.toNamed('/student/home');
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 34.h,
                                width: 118.w,
                                decoration: BoxDecoration(
                                    color: Palette.blueColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: controller.isLoading.value
                                      ? const SpinKitThreeInOut(
                                          size: 20,
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          'تسجيل',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Palette.whiteColor,
                                          ),
                                        ),
                                ),
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
