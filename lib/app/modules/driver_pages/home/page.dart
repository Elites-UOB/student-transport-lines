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
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Palette.backgroundColor,
          appBar: AppBar(
            backgroundColor: Palette.yellowColor,

            //pic
            leading: Container(
              padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/driver/profile');
                },
                child: Container(
                  // padding:const EdgeInsets.all(8),

                  child: ProfilePicS(
                    img: Image.asset('assets/images/person.png',
                        height: 20, width: 20),
                    ImgRadius: 30,
                    IconRadius: 8,
                    myColor: Palette.blueColor,
                    myIcon: const Icon(
                      Icons.edit,
                      size: 10,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(controller.porfiles[0]['full_name'],
                style: Styles.normalBlack),
          ),
          floatingActionButton: InkWell(
            onTap: () {
              Get.toNamed('/new/line');
            },
            child: const CircleAvatar(
              backgroundColor: Palette.yellowColor,
              child: Icon(Icons.add, color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MyPadding.KPadding, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  خطوطي
                const Text(
                  'خطوطي',
                  style: Styles.boldBlack,
                ),

                addNewLine(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// خط جديد icon and text
// InkWell(
//   onTap: () {
//     Get.toNamed('/new/line');
//     // Get.toNamed('/driver/profile');
//   },
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: const [
//       Icon(
//         Icons.add_circle,
//         size: 16,
//         color: Palette.blueColor,
//       ),
//       Text(
//         ' خط جديد',
//         style: TextStyle(
//             color: Palette.blueColor,
//             fontWeight: FontWeight.bold,
//             fontSize: 14),
//       )
//     ],
//   ),
// )