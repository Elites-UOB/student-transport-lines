import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import 'package:student_transport_lines/core/theme/text_theme.dart';

import '../../../../core/theme/padding.dart';
import '../../../utils/widgets/profilePicS.dart';
import 'controller.dart';
import 'widgets/addNewLine.dart';

class DriverHomePage extends GetView<DriverHomeController> {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal:  MyPadding.KPadding),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //appar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //name and date
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('حسن خالد ابو الخط', style: Styles.boldblue),
                          Text('2022/08/12',
                              textAlign: TextAlign.right, style: Styles.hintText)
                        ],
                      ),

                      //pic
                      InkWell(
                        onTap: () {
                          Get.toNamed('/driver/profile');
                        },
                        child: ProfilePicS(
                            img: Image.asset(
                              'assets/images/person.png',
                              height: 30,
                              width: 30,
                            ),
                            ImgRadius: 25,
                            IconRadius: 9,
                            myColor: Palette.blueColor,
                            myIcon: Icon(
                              Icons.edit,
                              size: 12,
                            )),
                      ),
                    ],
                  ),

                  //  خطوطي && خط جديد
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'خطوطي',
                          style: Styles.hintTextbold,
                        ),

                        // خط جديد icon and text
                        InkWell(
                          onTap: () {
                            Get.toNamed('/new/line');
                            // Get.toNamed('/driver/profile');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.add_circle,
                                size: 16,
                                color: Palette.blueColor,
                              ),
                              Text(
                                ' خط جديد',
                                style: TextStyle(
                                    color: Palette.blueColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(top: 15.sp),
                      height: w / 1.3.sp,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Palette.whiteColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: const [
                          addNewLine(),
                          Divider(
                            color: Colors.grey,
                          ),
                          addNewLine(),
                          Divider(
                            color: Colors.grey,
                          ),
                          addNewLine(),
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
