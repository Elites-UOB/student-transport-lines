import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../core/theme/color_theme.dart';
import '../../../../core/theme/padding.dart';
import '../../../utils/widgets/textFiled.dart';
import '../../auth/controller.dart';
import '../../../utils/widgets/dropdown.dart';

class StudentRegisterPage extends GetView<AuthController> {
  const StudentRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: MyPadding.KPadding),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //text تسجيل المستخدم
                      const Text(
                        'تسجيل المستخدم',
                        style: TextStyle(fontSize: 25, color: Palette.blueColor),
                      ),

                      const SizedBox(height: 10),

                      //
                      Obx(
                        () => Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          //height: 700.h,
                          width: double.infinity,
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
                                height: 15,
                              ),
                              //name filed
                              textFiled(
                                controller: controller.email,
                                headtext: 'البريد الالكتروني',
                                hinttext: 'example@gmail.com',
                                isEmail: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child: dropdownstud(
                                      headtext: 'المحافظة',
                                      hinttext: 'البصرة',
                                      item: controller.provinces.value,
                                      controller: controller.provinceId,
                                    ),
                                  ),
                                  Flexible(
                                    child: dropdownstud(
                                      headtext: 'المدينة',
                                      hinttext: 'شط العرب',
                                      item: controller.cities.value,
                                      controller: controller.cityId,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              textFiled(
                                  controller: controller.telegarm,
                                  headtext: 'معرّف التلكرام',
                                  hinttext: 'khaltk.3mtk'),
                              const SizedBox(
                                height: 15,
                              ),
                              textFiled(
                                controller: controller.password,
                                headtext: 'كلمة المرور',
                                hinttext: 'خالتك',
                                isPassword: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              dropdownstud(
                                controller: TextEditingController(),
                                item: controller.universities.value,
                                headtext: 'الجامعة',
                                hinttext: 'جامعة البصرة',
                              //  width: 19,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              dropdownstud(
                                controller: TextEditingController(),
                                item: controller.colleges.value,
                                headtext: 'الكلية',
                                hinttext: 'مجمع كليات الكرمة',
                               // width: 19,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              dropdownstud(
                                controller: TextEditingController(),
                                item: [
                                  {'id': 1, 'name': 'صباحي'},
                                  {'id': 2, 'name': 'مسائي'}
                                ],
                                headtext: 'الدراسة',
                                hinttext: 'مسائي',
                               // width: 19,
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
      ),
    );
  }
}
