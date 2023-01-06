import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../core/theme/color_theme.dart';
import '../../../../core/theme/padding.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';
import '../../driver_pages/home/widgets/line_card.dart';
import 'controller.dart';
import 'widgets/LineCarsStd.dart';

class StudentHomePage extends GetView<StudentHomeController> {
  StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Palette.backgroundColor,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Palette.yellowColor,

              //pic
              leading: Container(
                padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/student/profile');
                  },
                  child: Container(
                    // padding:const EdgeInsets.all(8),

                    child: ProfilePicS(
                      img: Image.asset('assets/images/person.png',
                          height: 20,
                          width: 20,
                      ),
                      ImgRadius: 30,
                      IconRadius: 8,
                      myColor: Palette.blackColor,
                      myIcon: const Icon(
                        Icons.edit,
                        size: 10,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text('محمد علي', style: Styles.normalBlack),
            ),


            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyPadding.KPadding, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //  search and filter
                  // TextField(
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius:BorderRadius.circular(20),
                  //       ),
                  //    label:const Icon(Icons.search_outlined,
                  //      color:  Colors.grey,
                  //      size: 25,
                  //    ),
                  //
                  //     ),
                  //   ),

                  Container(
                    height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                         border: Border.all(
                           color: Colors.grey
                         ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //search
                          const Icon(Icons.search_outlined,
                            color:  Colors.grey,
                            size: 25,
                          ),

                         const Flexible(
                            child: SizedBox(
                              child:TextField(
                                decoration:  InputDecoration(
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                          ),

                          //فلتر
                          Row(
                            children: const [
                              Icon(Icons.filter_list_alt,
                                color:  Colors.grey,
                                size: 20,
                              ),
                              Text('فلتر',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),)
                            ],
                          )
                        ],
                      ),
                    ),


                  //
                  linecardStd()

                ],
              ),
            ),
          ),
        ),

    );
  }
}
