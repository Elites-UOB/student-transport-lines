import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import 'package:student_transport_lines/core/theme/text_theme.dart';
import '../../../../core/theme/padding.dart';
import '../../../utils/widgets/profilePicS.dart';
import 'controller.dart';
import 'widgets/line_card.dart';

class DriverHomePage extends GetView<DriverHomeController> {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(
          () => Scaffold(
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
                      img: controller.porfiles.length > 0
                          ? Image.network(
                              controller.porfiles[0]['avatar_url'].toString(),
                            )
                          : Image.asset('assets/images/person.png',
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
              title: Text('asd', style: Styles.normalBlack),
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

                  const SizedBox(height: 10),

                  LineCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: Palette.yellowColor,
        leading: Container(
          padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
          child: Container(
            child: const SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.circle, width: 50, height: 50),
            ),
          ),
        ),
        title: SkeletonParagraph(
          style: SkeletonParagraphStyle(
            lines: 2,
            spacing: 6,
            lineStyle: SkeletonLineStyle(
              randomLength: true,
              height: 10,
              borderRadius: BorderRadius.circular(8),
              minLength: MediaQuery.of(context).size.width / 6,
              maxLength: MediaQuery.of(context).size.width / 3,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(color: Colors.white),
          child: SkeletonItem(
              child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 12),
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 2,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                      minLength: MediaQuery.of(context).size.width / 2,
                    )),
              ),
              SizedBox(height: 12),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    minHeight: MediaQuery.of(context).size.height / 8,
                    maxHeight: MediaQuery.of(context).size.height / 7,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    minHeight: MediaQuery.of(context).size.height / 8,
                    maxHeight: MediaQuery.of(context).size.height / 7,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    minHeight: MediaQuery.of(context).size.height / 8,
                    maxHeight: MediaQuery.of(context).size.height / 7,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                ),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    minHeight: MediaQuery.of(context).size.height / 8,
                    maxHeight: MediaQuery.of(context).size.height / 7,
                  ),
                ),
              ),
            ],
          )),
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