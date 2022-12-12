import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/color_theme.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';
import '../../../utils/widgets/textFiled.dart';
import '../register/widgets/dropdown.dart';
import 'controller.dart';

class DriverProfilePage extends GetView<DriverProfileController> {
  const DriverProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Palette.backgroundColor,
        body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
              onTap: (){},

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
                    Icons.keyboard_return,
                    size: 12,
                  )),
            ),
          ],
      ),

      const SizedBox(height: 40),
      const Text('الملف الشخصي',style: Styles.hintTextbold,),


      Container(
          height: 528.h,
          width: 345.w,
          decoration: BoxDecoration(
              color: Palette.whiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: Form(
              key:key,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const ProfilePicS(
                      img: Image(
                          image: AssetImage(
                              'assets/images/person.png')),
                      ImgRadius: 35,
                      IconRadius: 15,
                      myIcon: Icon(Icons.recycling),
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
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      dropdown(
                        headtext: 'المحافظة',
                        hinttext: 'البصرة',
                        item:[],
                        controller:TextEditingController(),
                      ),
                      dropdown(
                        headtext: 'المدينة',
                        hinttext: 'شط العرب',
                        item: [],
                        controller:TextEditingController(),
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
                      child:const Center(
                        child:  const Text(
                          'حفظ التعديلات',
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


    ]
    )
    ),
        )
        )
        ));
  }}