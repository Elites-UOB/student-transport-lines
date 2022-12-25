import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
import 'controller.dart';
import 'widgets/card_driver_stud.dart';
import 'package:student_transport_lines/core/theme/padding.dart';

class RolePage extends GetView<RoleController> {
  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        
        body: Container(
          padding:  const EdgeInsets.symmetric(
            horizontal: MyPadding.KPadding, vertical: 20),
          decoration:const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backround1.png'),
            ),
            color: Palette.yellowColor
          ),
          child: Center(
            child: Container(
              //padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //text
                  Column(
                    children: const[
                      Text('تطبيق الخطوط',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: 'Tajawal'
                      ),
                      ),
                      SizedBox(height: 8),
                      Text('تطبيقك الأول لإيجاد خطوط النقل',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Tajawal'
                        ),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          Text('  Google دخول عبر ' ,

                              style: TextStyle(

                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Tajawal'
                              ),),
                          Image(image: AssetImage('assets/images/google.png'),height: 22,)
                        ],
                      )),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
