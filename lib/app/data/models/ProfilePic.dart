import 'package:flutter/material.dart';

import '../../../core/theme/color_theme.dart';

class driverPic extends StatelessWidget {
  const driverPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          // driver image
         const CircleAvatar(
            backgroundImage: AssetImage("assets/images/driver.png"),
          ),

          //icon
           Positioned(
            left: -8,
            bottom: 0,
            child: InkWell(
              onTap: (){},
              child:const CircleAvatar(
                radius: 18,
                backgroundColor:Palette.blueColor ,
                child:Icon(Icons.recycling)),
            ),
            ),


        ],
      ),
    );
  }
}
