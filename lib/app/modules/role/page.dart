import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import 'controller.dart';
import 'widgets/card_driver_stud.dart';

class RolePage extends GetView<RoleController> {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: sizeh / 3.5),
          child: Column(
            children: [
              //ما هو دورك؟ text
              const Text(
                'ما هو دورك؟',
                style: TextStyle(fontSize: 30, color: Palette.blueColor),
              ),

              const SizedBox(height: 40),

              // driver card
              card_driver_stud(
                  onPressed: () {
                    Get.toNamed('/driver/register');
                  },
                  destext:
                      'الأعلان عن خطوط  النقل الخاصة بك، \n لأعلان عن خطوط  النقل الخاصة بك،',
                  headtext: 'سائق',
                  myimg: "assets/images/img_1.png",
                  backroundCard: Palette.blueColor,
                  backroundImg: Palette.whiteColor,
                  destextColor: Palette.whiteColor),
              const SizedBox(height: 50),

              // student card
              card_driver_stud(
                onPressed: () {},
                destext: 'ايجاد خطوط النقل المناسبة\n حسب المتطلبات الخاصة',
                headtext: 'طالب',
                myimg: '',
                backroundCard: Palette.whiteColor,
                backroundImg: Palette.blueColor,
                destextColor: Palette.blueColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
