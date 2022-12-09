import 'package:flutter/material.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';
class dropdown extends StatelessWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,width: MediaQuery.of(context).size.width/2.8,
      child: DropdownButtonFormField(

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
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
  return menuItems;
}