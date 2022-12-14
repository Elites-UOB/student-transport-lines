import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/car.json'),
                  const Padding(padding: EdgeInsets.only(top: 10.0)),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(50, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Power By',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        height: 25,
                      ),
                      Obx(() =>
                          controller.isAuth.value ? Container() : Container())
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
