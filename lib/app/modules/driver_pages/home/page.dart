import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/driver_pages/register/widgets/ProfilePic.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import 'controller.dart';

class DriverHomePage extends GetView<DriverHomeController> {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Palette.backgroundColor,

        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding:const EdgeInsets.only(top:30,left: 6,right: 6 ),

            child: Column(
              children: [

                //appar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //pic
                    driverPic(),

                    //name and date
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const[
                        Text('حسن خالد ابو الخط',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                          color: Palette.blueColor
                        ),
                        ),
                        Text('2022/08/12',
                          textAlign:TextAlign.right ,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Tajawal',
                              color: Colors.grey
                            //  color: Palette.
                          ),
                        )
                      ],
                    ),



                  ],


                )
              ],
            ),

          ),
        ),

    );
  }
}