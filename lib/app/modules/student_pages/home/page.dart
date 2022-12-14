import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../core/theme/color_theme.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';
import 'controller.dart';

class StudentHomePage extends GetView<StudentHomeController> {
  StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: SpinKitSpinningLines(
                    color: Palette.blueColor,
                    size: 70.sp,
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                                  textAlign: TextAlign.right,
                                  style: Styles.hintText)
                            ],
                          ),

                          //user img
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/student/profile');
                            },
                            child: const ProfilePicS(
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
                                Get.toNamed('/student/profile');
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
                          shrinkWrap: true,
                          itemCount: controller.lines.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    height: 200,
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            controller.lines[index]['type'] == 1
                                                ? 'صباحي'
                                                : 'مسائي',
                                          ),
                                          Text(
                                            controller.lines[index]
                                                ['universities']['name'],
                                          ),
                                          Text(
                                            controller.lines[index]['colleges']
                                                ['name'],
                                          ),
                                          Text(
                                            controller.lines[index]
                                                    ['car_pass_count']
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                controller.lines[index]
                                                            ['profiles']
                                                        ['avatar_url'] ??
                                                    'https://ccemdata.mcmaster.ca/media/avatars/default.png',
                                                height: 60,
                                                width: 60,
                                              ),
                                              Text(
                                                controller.lines[index]
                                                    ['profiles']['full_name'],
                                                style: Styles.hintTextbold,
                                              ),
                                              Text(
                                                controller.lines[index]
                                                    ['provinces']['name'],
                                                style: Styles.hintTextbold,
                                              ),
                                              Text(
                                                controller.lines[index]
                                                    ['cities']['name'],
                                                style: Styles.hintTextbold,
                                              ),
                                              Text(
                                                controller.lines[index]
                                                    ['car_model'],
                                                style: Styles.hintTextbold,
                                              ),
                                              Text(
                                                controller.lines[index]['price']
                                                    .toString(),
                                                style: Styles.hintText,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                controller.lines[index]
                                                        ['pass_count']
                                                    .toString(),
                                                style: Styles.hintTextbold,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                size: 12,
                                                color: Palette.blueColor,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Palette.blueColor,
                                      thickness: 1,
                                    )
                                  ],
                                ),
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
