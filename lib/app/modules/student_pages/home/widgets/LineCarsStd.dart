
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/student_pages/home/controller.dart';
import 'package:student_transport_lines/core/theme/text_theme.dart';

import '../../../../../core/theme/color_theme.dart';

class linecardStd extends GetWidget<StudentHomeController>{
  String Sentence = '';

  @override
  Widget build (BuildContext context){
    return  Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Obx(
        ()=> Flexible(
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              controller.isExpanded.value = !controller.isExpanded.value;
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: controller.isExpanded.value ? 0 : 0,
                vertical: 8,
              ),
              padding: EdgeInsets.only( bottom: 10),
              height: controller.isExpanded.value ? 80 : 170,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1200),
              decoration: BoxDecoration(
                //color: Color(0xffFF5050),
                  borderRadius: BorderRadius.all(
                    Radius.circular(controller.isExpanded.value ? 20 : 20),
                  ),
                  border: Border.all(color: Colors.grey)),
              child:
              Container(
                height: 40,
                padding: EdgeInsets.only(right: 20,top: 10,left: 20),
                child: Column(
                  children: [
                    Row(

                      children: const [
                        Text(
                          'الحيانية',
                          style: Styles.boldBlack
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: 18,
                        ),
                        Text(
                          'جامعة البصرة، كرمة علي',
                          style: Styles.boldBlack
                        )
                      ],
                    ),


                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('محمد علي',style: Styles.hintTextbold),

                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: Colors.grey),
                                  color: Colors.white),
                              child: const Text('40 أ.د.ع',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                           const SizedBox(
                              width: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: Palette.pink),
                                  color: Palette.pink),
                              child: const Text(
                                'ممتلئ',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.inpink),
                              ),
                            )
                          ],
                        )

                      ],
                    ),

                    AnimatedCrossFade(
                       firstChild:const Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),

                      secondChild: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:20 , top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Column(
                                  children:const [
                                    Text('التوقيت',
                                      style:Styles.hintTextbold ,
                                    ),
                                    Text('صباحي',style: Styles.normalBlack,)
                                  ],
                                ),

                                Column(
                                  children:const [
                                    Text('عدد الراكبين',
                                      style:Styles.hintTextbold ,
                                    ),
                                    Text('50',style: Styles.normalBlack,)
                                  ],
                                ),

                                Column(
                                  children:const [
                                    Text('عدد الشواغر',
                                      style:Styles.hintTextbold ,
                                    ),
                                    Text('0',style: Styles.normalBlack,)
                                  ],
                                ),
                              ],
                            ),
                          ),


                          Divider(color: Colors.grey,height: 10),
                          Container(
                            padding:const EdgeInsets.only( top: 10),
                            // decoration: BoxDecoration(
                            //   border: Border.all(),
                            //   borderRadius: BorderRadius.circular(20)
                            // ),
                            child: Row(
                              mainAxisAlignment:  MainAxisAlignment.spaceAround,
                              children: const[
                                Icon(Icons.phone),
                                Icon(Icons.telegram),
                                Icon(Icons.car_crash),
                                Icon(Icons.add_alert),
                                Icon(Icons.save),
                              ],
                            ),
                          )
                        ],
                      ),
                      crossFadeState: controller.isExpanded.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 1200),
                      reverseDuration: Duration.zero,
                      sizeCurve: Curves.fastLinearToSlowEaseIn,
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