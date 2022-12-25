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
        child: Text('Steper Page'),
      )),
    );
  }
}
