import 'package:flutter/material.dart';
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
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 25,
                        color: Palette.blueColor),
                  ),

                  const SizedBox(height: 18),

                  //
                  Container(
                    height: 566,
                    width: 345,
                    decoration: BoxDecoration(
                        color: Palette.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
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
                        const textFiled(
                          headtext: 'الأسم',
                          hinttext: 'حسن خالد ابو الخط',
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // drop down
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            dropdown(headtext:'المحافظة', hinttext: 'البصرة', ),
                            dropdown(headtext: 'المدينة', hinttext: 'شط العرب',),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //phone number filed
                        const textFiled(
                            headtext: 'رقم الهاتف', hinttext: '07712345678'),
                        const SizedBox(
                          height: 20,
                        ),

                        //tele user name filed
                        const textFiled(
                            headtext: 'معرّف التلكرام',
                            hinttext: 'khaltk.3mtk'),
                        const SizedBox(
                          height: 20,
                        ),

                        //password filed
                        const textFiled(headtext: 'كلمة المرور', hinttext: 'خالتك'),

                        InkWell(
                          onTap: (){
                            Get.toNamed('/driver/home');
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(top:10),
                            height: 34, width: 118,
                            decoration: BoxDecoration(
                              color: Palette.blueColor,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child:const Center(
                              child: Text('تسجيل',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
