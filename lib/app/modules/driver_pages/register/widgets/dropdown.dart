import 'package:flutter/material.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
class dropdown extends StatelessWidget {
  const dropdown({ required this.headtext, required this.hinttext}) ;
  final String headtext;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        headtext,
      style:const TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 18,
      ),
    ),

        Container(
          height: 40,width: MediaQuery.of(context).size.width/2.8,
          child: DropdownButtonFormField(
            hint: Center(
              child: Text(hinttext,
                textAlign: TextAlign.start,
                style:const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 15,
                ),
           ),
            ),

              decoration: InputDecoration(
                enabledBorder:InputBorder.none,
                border: OutlineInputBorder
                  (
                  borderSide:BorderSide.none ,
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor:  Palette.greyColor,
              ),
              dropdownColor:  Palette.whiteColor,

              onChanged: (value) {

              },

              items: dropdownItems),
        ),
      ],
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems{

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("البصره")),
    DropdownMenuItem(child: Text("بغداد"),value: "Canada"),
    DropdownMenuItem(child: Text("الموصل"),value: "Brazil"),
    DropdownMenuItem(child: Text("العماره"),value: "England"),
  ];
  return menuItems;
}