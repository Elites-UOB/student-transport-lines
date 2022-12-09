import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/driver_pages/register/widgets/dropdown.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import 'widgets/ProfilePic.dart';
import 'widgets/textFiled.dart';
import 'controller.dart';

class DriverRegisterPage extends GetView<DriverRegisterController> {
  const DriverRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'تسجيل السائق',
                    style: TextStyle(fontSize: 25, color: Palette.blueColor),
                  ),

                  const SizedBox(height: 18),

                  //
                  Container(
                    height: 650.h,
                    width: 345.w,
                    decoration: BoxDecoration(
                        color: Palette.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Form(
                      key: controller.authKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const driverPic(),

                          const SizedBox(
                            height: 15,
                          ),

                          //name filed
                          textFiled(
                            controller: controller.name,
                            headtext: 'الأسم',
                            hinttext: 'حسن خالد ابو الخط',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //name filed
                          textFiled(
                            controller: controller.email,
                            headtext: 'البريد الالكتروني',
                            hinttext: 'example@gmail.com',
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // drop down
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              dropdown(
                                headtext: 'المحافظة',
                                hinttext: 'البصرة',
                              ),
                              dropdown(
                                headtext: 'المدينة',
                                hinttext: 'شط العرب',
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          //phone number filed
                          textFiled(
                              controller: controller.phone,
                              headtext: 'رقم الهاتف',
                              hinttext: '07712345678'),
                          const SizedBox(
                            height: 20,
                          ),

                          //tele user name filed
                          textFiled(
                              controller: controller.telegarm,
                              headtext: 'معرّف التلكرام',
                              hinttext: 'khaltk.3mtk'),
                          const SizedBox(
                            height: 20,
                          ),

                          //password filed
                          textFiled(
                              controller: controller.password,
                              headtext: 'كلمة المرور',
                              hinttext: 'password'),

                          InkWell(
                            onTap: () {
                              controller.register(
                                  email: controller.email.text,
                                  password: controller.password.text);
                            },
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(top: 10),
                              height: 34.h,
                              width: 118.w,
                              decoration: BoxDecoration(
                                  color: Palette.blueColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: controller.isLoading.value
                                    ? const CircularProgressIndicator(
                                        color: Palette.whiteColor,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
