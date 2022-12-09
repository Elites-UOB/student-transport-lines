import 'package:flutter/material.dart';
import 'package:student_transport_lines/app/modules/driver_login/page.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';

import '../../data/models/card_driver_stud.dart';
import '../home/page.dart';
class RolePage extends StatefulWidget {
  const RolePage({Key? key}) : super(key: key);

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  Widget build(BuildContext context) {
    var sizeh =MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
     body: Center(
       child: Container(
         padding: EdgeInsets.only(top: sizeh /3.5),
         child: Column(

           children: [

             //ما هو دورك؟ text
              const Text('ما هو دورك؟',
             style: TextStyle(
                 fontFamily: 'Tajawal',
                 fontSize: 30,
                 color: Palette.blueColor
             ),
             ),

           const SizedBox(height: 40),

            // driver card
             card_driver_stud(
               onPressed:() {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DriverLoginPage() ,));
                 },
               destext: 'الأعلان عن خطوط  النقل الخاصة بك، \n لأعلان عن خطوط  النقل الخاصة بك،',
               headtext: 'سائق',
               myimg: "assets/images/img_1.png",
               backroundCard: Palette.blueColor,
               backroundImg: Palette.whiteColor,
                 destextColor: Palette.whiteColor
             ),
             const SizedBox(height:50),

             // student card
             card_driver_stud(
               onPressed: (){},
               destext: 'ايجاد خطوط النقل المناسبة\n حسب المتطلبات الخاصة',
               headtext: 'طالب',
               myimg: '',
               backroundCard: Palette.whiteColor,
               backroundImg: Palette.blueColor,
               destextColor: Palette.blueColor,

             )

           ],
         ),
       ),
     ),
    );
  }
}
