import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/color_theme.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';
import '../../../utils/widgets/textFiled.dart';
import '../../auth/controller.dart';
import '../../../utils/widgets/dropdown.dart';
import 'controller.dart';

class DriverProfilePage extends GetView<DriverProfileController> {
  AuthController authController = Get.put(AuthController());

  DriverProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Palette.backgroundColor,

          appBar: AppBar(
            backgroundColor: Palette.yellowColor,

            leading:Container(
              padding: EdgeInsets.only(right: 30),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              },
                  icon:const Icon(Icons.arrow_back_sharp,
                    color: Palette.blackColor,
                    size: 22,
                  ) ),
            ),

            title:const Text(
              'الملف الشخصي',
              style: Styles.normalBlack,
            ),

          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:  MyPadding.KPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                    // IconButton(
                    //     onPressed: (() => authController.logout()),
                    //     icon: Icon(Icons.logout))

                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Column(
                    children: [
                      const ProfilePicS(
                          img: Image(
                            image: AssetImage('assets/images/person.png'),
                          ),
                          ImgRadius: 35,
                          IconRadius: 13,
                          myIcon: Icon(Icons.edit,size: 15),
                          myColor: Palette.blackColor),

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
                    ],
                  ),
                ),



                const SizedBox(
                  height: 20,
                ),

                //
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        // height: 34.h,
                        // width: 118.w,
                        decoration: BoxDecoration(
                            color: Palette.yellowColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'حفظ التعديلات',
                            textAlign: TextAlign.center,
                            style:Styles.normalBlack,
                          ),
                        ),
                      ),
                    ),
                    TextButton (
                        onPressed: (() => authController.logout()),
                        child:const Text(
                          'تسجيل الخروج',
                          style: TextStyle(color: Color(0xffFF6969),fontWeight: FontWeight.w800),
                        ))
                  ],
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
