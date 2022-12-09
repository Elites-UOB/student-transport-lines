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
      body: SingleChildScrollView(
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

                const SizedBox(height: 20),

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
                        height: 20,
                      ),

                      //name filed
                      const textFiled(
                        headtext: 'الأسم',
                        hinttext: 'حسن خالد ابو الخط',
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          dropdown(),
                          dropdown(),
                        ],
                      ),

                      //phone number filed
                      const textFiled(
                          headtext: 'رقم الهاتف', hinttext: '07712345678'),
                      const SizedBox(
                        height: 20,
                      ),

                      //tele user name filed
                      textFiled(
                          headtext: 'معرّف التلكرام', hinttext: 'khaltk.3mtk'),
                      SizedBox(
                        height: 20,
                      ),

                      //password filed
                      textFiled(headtext: 'كلمة المرور', hinttext: 'خالتك'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
