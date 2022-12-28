import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/driver_pages/new_line/controller.dart';
import 'package:student_transport_lines/app/utils/widgets/dropdown.dart';
import 'package:student_transport_lines/app/utils/widgets/textFiled.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';

class NewLinePage extends GetView<NewLineController> {
  const NewLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Palette.backgroundColor,
          appBar: AppBar(
            backgroundColor: Palette.yellowColor,
            leading: Container(
              padding: EdgeInsets.only(right: 30),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Palette.blackColor,
                    size: 22,
                  )),
            ),
            title: const Text(
              'اضافة خط جديد',
              style: Styles.normalBlack,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MyPadding.KPadding, vertical: 10),
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        dropdownstud(
                          headtext: 'الكلية',
                          hinttext: 'مجمع كليات الكرمة',
                          item: controller.colleges.value,
                          controller: TextEditingController(),
                          // width: 20
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        dropdownstud(
                          headtext: 'الدراسة',
                          hinttext: 'مسائي',
                          item: const [
                            {'id': 1, 'name': 'صباحي'},
                            {'id': 2, 'name': 'مسائي'}
                          ],
                          controller: TextEditingController(),
                          // width: 20
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //نوع السيارة
                        dropdownstud(
                          headtext: 'نوع السيارة',
                          hinttext: 'تكسي',
                          item: const [],
                          controller: TextEditingController(),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        //  موديل السيارة
                        SizedBox(
                          width: double.infinity,
                          child: textFiled(
                            controller: controller.carModel,
                            headtext: 'موديل السيارة',
                            hinttext: 'اكسنت 2019',
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: textFiled(
                                controller: controller.carPassCount,
                                headtext: 'عدد المقاعد',
                                hinttext: '4',
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: textFiled(
                                controller: controller.passCount,
                                headtext: 'عدد الشاغر',
                                hinttext: '2',
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: textFiled(
                                controller: controller.price,
                                headtext: 'الكلفة',
                                hinttext: '100',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // حفظ التعديلات
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.addNewLine();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Palette.yellowColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: controller.isLoading.value
                                    ? const SpinKitThreeInOut(
                                        size: 20,
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        'اضافة ',
                                        textAlign: TextAlign.center,
                                        style: Styles.normalBlack,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
