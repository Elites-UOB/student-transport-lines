import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/driver_pages/register/widgets/dropdown.dart';
import 'package:student_transport_lines/app/utils/helper_controller.dart';
import 'package:student_transport_lines/app/utils/widgets/profilePicS.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import '../../../utils/widgets/textFiled.dart';
import 'controller.dart';

class DriverRegisterPage extends GetView<DriverRegisterController> {
  final HelperController helperController = Get.put(HelperController());
  DriverRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final h =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: h/35.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     TextButton(
                      onPressed:(){Get.toNamed('/driver/home');},
                      child:const Text(
                        'تسجيل السائق',
                        style: TextStyle(fontSize: 25, color: Palette.blueColor),
                      ) ,

                    ),

                  //  const SizedBox(height: 12),

                    //
                    Container(
                      height: 700.h,
                      width: 345.w,
                      decoration: BoxDecoration(
                          color: Palette.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Obx(
                        () => Form(
                          key: controller.authKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const ProfilePicS(
                                  img: Image(image: AssetImage('assets/images/person.png')),
                                  ImgRadius: 35,
                                  IconRadius: 15,
                                  myIcon: Icon(Icons.recycling),
                                  myColor: Palette.blueColor),

                              const SizedBox(
                                height: 15,
                              ),

                              //name filed
                              textFiled(
                                controller: controller.name,
                                headtext: 'الأسم',
                                hinttext: 'أحمد علي',
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

                              // drop down
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  dropdown(
                                    headtext: 'المحافظة',
                                    hinttext: 'البصرة',
                                    item: controller.provinces.value,
                                    controller: controller.cityId,
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

                              //phone number filed
                              textFiled(
                                  controller: controller.phone,
                                  headtext: 'رقم الهاتف',
                                  hinttext: '07xxxxxx'),
                              const SizedBox(
                                height: 20,
                              ),

                              //tele user name filed
                              textFiled(
                                  controller: controller.telegarm,
                                  headtext: 'معرّف التلكرام',
                                  hinttext: '@CsitElites'),
                              const SizedBox(
                                height: 20,
                              ),

                              //password filed
                              textFiled(
                                controller: controller.password,
                                headtext: 'كلمة المرور',
                                hinttext: 'password',
                                isPassword: true,
                                icon: Icons.lock_outline,
                              ),

                              InkWell(
                                onTap: () {
                                  controller.register();
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
                          ),
                        ),
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
