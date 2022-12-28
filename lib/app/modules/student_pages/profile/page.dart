import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_transport_lines/core/theme/padding.dart';
import '../../../../core/theme/color_theme.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';
import '../../../utils/widgets/textFiled.dart';
import '../../auth/controller.dart';
import '../../../utils/widgets/dropdown.dart';
import 'controller.dart';

class StudentProfilePage extends GetView<StudentProfileController> {
  AuthController authController = Get.put(AuthController());

  StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                // HEADER
                Container(
                    height: 60.h,
                    color: Palette.yellowColor,
                    margin: EdgeInsets.only(top: 28.h),
                    padding: EdgeInsets.only(bottom: 10.h, right: 15.w),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //pic
                        IconButton(
                            onPressed: (() => authController.logout()),
                            icon: Icon(
                              Icons.arrow_back,
                              size: 17.w,
                            )),
                        SizedBox(width: 10.w),
                        Text(
                          'الملف الشخصي',
                          style: GoogleFonts.tajawal(
                            textStyle: TextStyle(
                                color: Palette.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.w),
                          ),
                          // style: TextStyle(
                          //     color: Palette.blackColor,
                          //     fontSize: 19.w,
                          //     fontFamily: "Tajawal",
                          //     fontWeight: FontWeight.w900),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 528.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Palette.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Form(
                      key: key,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const ProfilePicS(
                              img: Image(
                                  image:
                                      AssetImage('assets/images/person.png')),
                              ImgRadius: 35,
                              IconRadius: 15,
                              myIcon: Icon(Icons.swap_horiz_sharp),
                              myColor: Palette.blueColor),

                          const SizedBox(
                            height: 15,
                          ),

                          //name filed
                          textFiled(
                            controller: TextEditingController(),
                            headtext: 'الأسم',
                            hinttext: 'أحمد علي',
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // drop down
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: dropdownstud(
                                  headtext: 'المحافظة',
                                  hinttext: 'البصرة',
                                  item: [],
                                  controller: TextEditingController(),
                                ),
                              ),
                              Flexible(
                                child: dropdownstud(
                                  headtext: 'المدينة',
                                  hinttext: 'شط العرب',
                                  item: [],
                                  controller: TextEditingController(),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          //phone number filed
                          textFiled(
                              controller: TextEditingController(),
                              headtext: 'رقم الهاتف',
                              hinttext: '07xxxxxx'),
                          const SizedBox(
                            height: 20,
                          ),

                          //tele user name filed
                          textFiled(
                              controller: TextEditingController(),
                              headtext: 'معرّف التلكرام',
                              hinttext: '@CsitElites'),
                          const SizedBox(
                            height: 20,
                          ),

                          //password filed
                          textFiled(
                            controller: TextEditingController(),
                            headtext: 'كلمة المرور',
                            hinttext: 'password',
                            isPassword: true,
                            icon: Icons.lock_outline,
                          ),

                          const SizedBox(
                            height: 15,
                          ),

                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.bottomCenter,
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
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
