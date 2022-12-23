import 'package:flutter/material.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';

class dropdownstud extends StatelessWidget {
  const dropdownstud(
      {required this.headtext,
      required this.hinttext,
      required this.item,
      required this.controller,
      //required this.width
      });

  final String headtext;
  final String hinttext;
  final List item;
 // final double width;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
         // margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            headtext,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 40,
          // width:width,
          child: DropdownButtonFormField(
            hint: Center(
              child: Text(
                hinttext,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontFamily: 'Tajawal',
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            decoration: InputDecoration(

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Palette.whiteColor,
            ),
            dropdownColor: Palette.whiteColor,
            onChanged: (Object? element) {
              controller:
              controller.text = element.toString();
            },
            items: item
                .map((element) => DropdownMenuItem(
                    value: element['id'],
                    child: Text(
                      element['name'],
                      textDirection: TextDirection.rtl,
                    )))
                .toList(),
          ),
        ),
      ],
    );
  }
}
