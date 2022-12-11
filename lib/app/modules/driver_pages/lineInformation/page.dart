import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/driver_pages/lineInformation/controller.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';

import '../../../../core/theme/text_theme.dart';
import '../../../utils/widgets/profilePicS.dart';

class LineInformationPage extends GetView<LineInformationController>{

  const LineInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
        padding:const EdgeInsets.only(top:30,left: 15,right: 15 ),
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
            children: const[
              Text('حسن خالد ابو الخط',
                  style: Styles.boldblue
              ),
              Text('2022/08/12',
                  textAlign:TextAlign.right ,
                  style: Styles.hintText
              )
            ],
          ),

          //pic
          ProfilePicS(
              img: Image.asset('assets/images/person.png',height: 30,width: 30,),
              ImgRadius: 25,
              IconRadius: 9,
              myColor:Palette.blueColor ,
              myIcon: Icon(Icons.edit,size: 12,)
          ),
        ],
      ),
      const SizedBox(height: 40),
      const Text('تعديل الخط',style: Styles.hintTextbold,),

      Container(
        margin: EdgeInsets.only(top: 10),
        height:489.h ,
        width: 345.w,
        decoration: BoxDecoration(
          color:Palette.whiteColor ,
          borderRadius: BorderRadius.circular(16),

        ),
      )
      
      
      
    ]),
    )
    )
    );
  }
  }
