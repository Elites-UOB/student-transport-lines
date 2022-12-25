import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_transport_lines/core/theme/color_theme.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final String title;
  final void Function(int) onChanged;

  const CustomRadio(
      {Key? key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              // margin: const EdgeInsets.all(0.5),
              // padding: const EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1.w,
                      color:
                          selected ? Palette.blackColor : Palette.greyColor2)),
              child: Icon(
                Icons.circle,
                size: 20.w,
                color: selected ? Palette.blackColor : Colors.transparent,
              ),
            ),
            SizedBox(width: 10.h),
            Text(
              widget.title,
              style: TextStyle(
                  color: selected ? Palette.blackColor : Palette.greyColor2,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Tajawal",
                  fontSize: 20.w),
            ),
          ])),
    );
  }
}
