import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/color_theme.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';
import 'controller.dart';

class StudentHomePage extends GetView<StudentHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
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
                        Text('حسن خالد المستخدم', style: Styles.boldblue),
                        Text('2022/08/12',
                            textAlign: TextAlign.right, style: Styles.hintText)
                      ],
                    ),

                    //user img
                    const ProfilePicS(
                      img: Image(
                        image: AssetImage('assets/images/person.png'),
                        height: 30,
                        width: 30,
                      ),
                      ImgRadius: 25,
                      IconRadius: 9,
                      myColor: Palette.blueColor,
                      myIcon: Icon(
                        Icons.edit,
                        size: 12,
                      ),
                    )
                  ],
                ),

                //الخطوط && فلتر text
                Container(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'الخطوط',
                        style: Styles.hintTextbold,
                      ),
                      InkWell(
                        onTap: () {
                          controller.facth();
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.filter_list_alt,
                              color: Palette.blueColor,
                              size: 18,
                            ),
                            Text(
                              'فلتر',
                              style: Styles.boldblue,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 489.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                    color: Palette.whiteColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                              height: 200,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                    'This is the modal bottom sheet. Tap anywhere to dismiss.'),
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text('الخط الاول'),
                        ),
                      );
                    },
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
