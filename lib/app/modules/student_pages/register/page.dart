import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/color_theme.dart';
import '../../../utils/widgets/textFiled.dart';
import '../../driver_pages/register/widgets/dropdown.dart';
import 'controller.dart';
import 'widgets/dropdown.dart';

class StudentRegisterPage extends GetView<StudentRegisterController> {
  const StudentRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 591.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                      color: Palette.whiteColor,
                      borderRadius: BorderRadius.circular(10)),

                  child: Form(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           textFiled(
                             controller: TextEditingController(),
                             headtext:'الأسم' ,
                             hinttext: 'حسن خالد الطالب',),

                           const SizedBox(height: 20,),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               dropdown(
                                 headtext: 'المحافظة',
                                 hinttext: 'البصرة',
                                 item: [],
                                 controller: TextEditingController(),
                               ),
                               dropdown(
                                 headtext: 'المدينة',
                                 hinttext: 'شط العرب',
                                 item: [],
                                 controller: TextEditingController(),
                               ),
                             ],
                           ),

                           const SizedBox(height: 20,),

                           textFiled(
                               controller: TextEditingController(),
                               headtext: 'معرّف التلكرام',
                               hinttext: 'khaltk.3mtk'),

                           const SizedBox(height: 20,),

                           textFiled(
                               controller: TextEditingController(),
                               headtext: 'كلمة المرور',
                               hinttext: 'خالتك'),

                           const SizedBox(height: 20,),

                           dropdownstud(
                             controller: TextEditingController(),
                             item: [],
                             headtext: 'الجامعة',
                             hinttext: 'جامعة البصرة',
                             width:19,),

                           const SizedBox(height: 20,),

                           dropdownstud(
                             controller: TextEditingController(),
                             item: [],
                             headtext: 'الكلية',
                             hinttext: 'مجمع كليات الكرمة',
                             width:19,),

                           const SizedBox(height: 20,),

                           dropdownstud(
                             controller: TextEditingController(),
                             item: [],
                             headtext: 'الدراسة',
                             hinttext: 'مسائي',
                             width:19,),

                           InkWell(
                             onTap: () {
                               Get.toNamed('/student/home');
                             },
                             child: Container(
                               margin: EdgeInsets.only(top: 10),
                               height: 34.h,
                               width: 118.w,
                               decoration: BoxDecoration(
                                   color: Palette.blueColor,
                                   borderRadius: BorderRadius.circular(20)),
                               child:const Center(
                                 child: Text(
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
                      )
                  ),
                ),
                ],
              ),
              ),
            ),
          )
      ),
    );
  }
  }