import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/driver_pages/lineInformation/controller.dart';
import 'package:student_transport_lines/app/modules/student_pages/register/widgets/dropdown.dart';
import 'package:student_transport_lines/app/utils/widgets/textFiled.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';

import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';
import '../register/widgets/dropdown.dart';

class LineInformationPage extends GetView<LineInformationController> {
  const LineInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      Get.toNamed('/driver/DriverProfile');
                    },
                    child: ProfilePicS(
                      img: Image.asset('assets/images/person.png',
                          height: 30, width: 30),
                      ImgRadius: 25,
                      IconRadius: 9,
                      myColor: Palette.blueColor,
                      myIcon: Icon(
                        Icons.edit,
                        size: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'تعديل الخط',
                style: Styles.hintTextbold,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 489.h,
                width: 345.w,
                decoration: BoxDecoration(
                  color: Palette.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    dropdownstud(
                        headtext: 'الجامعة',
                        hinttext: 'جامعة البصرة',
                        item: [],
                        controller: TextEditingController(),
                        width: 20),

                    dropdownstud(
                        headtext: 'الكلية',
                        hinttext: 'مجمع كليات الكرمة',
                        item: [],
                        controller: TextEditingController(),
                        width: 20),

                    dropdownstud(
                        headtext: 'الدراسة',
                        hinttext: 'مسائي',
                        item: [],
                        controller: TextEditingController(),
                        width: 20),

                    textFiled(
                        controller: TextEditingController(),
                        headtext: 'نوع السيارة',
                        hinttext: 'تكسي'),

                    textFiled(
                        controller: TextEditingController(),
                        headtext: 'موديل السيارة',
                        hinttext: 'سوناتا'),

                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: textFiled(
                              controller: TextEditingController(),
                              headtext: 'عدد المقاعد',
                              hinttext: '4'),
                        ),
                        SizedBox(
                          width: 120,
                          child: textFiled(
                              controller: TextEditingController(),
                              headtext: 'عدد الشاغر',
                              hinttext: '2'),
                        ),
                        SizedBox(
                          width: 120,
                          child: textFiled(
                              controller: TextEditingController(),
                              headtext: 'الكلفة',
                              hinttext: '100'),
                        ),
                      ],
                    ),
                    //البحث عن ركاب
                    //حفظ التعديلات
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 34.h,
                        width: 118.w,
                        decoration: BoxDecoration(
                            color: Palette.blueColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'حفظ التعديلات',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Palette.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
