import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/auth/controller.dart';
import 'package:student_transport_lines/app/modules/role/page.dart';
import 'package:student_transport_lines/core/theme/app_theme.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/padding.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: MyPadding.KPadding, vertical: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backround1.png'),
              ),
              color: Palette.yellowColor),
          child: Center(
            child: Container(
              //padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //text
                  Column(
                    children: const [
                      Text(
                        'تطبيق الخطوط',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'Tajawal'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'تطبيقك الأول لإيجاد خطوط النقل',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () => controller.login(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '  Google دخول عبر ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Tajawal'),
                        ),
                        Image(
                          image: AssetImage('assets/images/google.png'),
                          height: 22,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // Scaffold(
    //   body: Directionality(
    //     textDirection: TextDirection.ltr,
    //     child: Center(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             Padding(
    //               padding: const EdgeInsets.all(30.0),
    //               child: DecoratedBox(
    //                 decoration: const BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.all(Radius.circular(20)),
    //                   shape: BoxShape.rectangle,
    //                 ),
    //                 child: Form(
    //                   key: controller.authKey,
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(20.0),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                         TextFormField(
    //                           controller: controller.email,
    //                           onSaved: (v) {},
    //                           keyboardType: TextInputType.emailAddress,
    //                           decoration: const InputDecoration(
    //                             border: InputBorder.none,
    //                             icon: Icon(
    //                               Icons.email,
    //                               color: Colors.grey,
    //                             ),
    //                             hintText: 'Email',
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           height: 10,
    //                         ),
    //                         Obx(
    //                           () => TextFormField(
    //                             controller: controller.password,
    //                             onSaved: (v) {},
    //                             keyboardType: TextInputType.visiblePassword,
    //                             obscureText: !controller.showPassword.value,
    //                             decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               icon: const Icon(
    //                                 Icons.lock_outline,
    //                                 color: Colors.grey,
    //                               ),
    //                               suffixIcon: GestureDetector(
    //                                 onTap: () => controller.showPassword.value =
    //                                     !controller.showPassword.value,
    //                                 child: controller.showPassword.value
    //                                     ? const Icon(Icons.remove_red_eye)
    //                                     : const Icon(
    //                                         Icons.remove_red_eye_outlined),
    //                               ),
    //                               // hintTextDirection: TextDirection.ltr,
    //                               hintText: 'Password ',
    //                             ),
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                         ElevatedButton(
    //                           style: ButtonStyle(
    //                               elevation:
    //                                   MaterialStateProperty.all<double>(0),
    //                               backgroundColor:
    //                                   MaterialStateProperty.all<Color>(
    //                                       Palette.blueColor),
    //                               shape: MaterialStateProperty.all<
    //                                       RoundedRectangleBorder>(
    //                                   RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(20.0),
    //                               ))),
    //                           onPressed: () => controller.login(),
    //                           child: Center(
    //                             child: Obx(
    //                               () => controller.isLoading.value == true
    //                                   ? const SpinKitRipple(
    //                                       color: Colors.white,
    //                                     )
    //                                   : Container(
    //                                       height: 50,
    //                                       width: 200,
    //                                       alignment: Alignment.center,
    //                                       child: const Text(
    //                                         "تسجيل الدخول",
    //                                         style: TextStyle(
    //                                           fontSize: 18,
    //                                         ),
    //                                       ),
    //                                     ),
    //                             ),
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                         TextButton(
    //                           onPressed: () => Get.toNamed('/role'),
    //                           child: const Text(
    //                             "ليس لديك حساب؟",
    //                             style: TextStyle(
    //                               fontSize: 18,
    //                               color: Palette.blueColor,
    //                             ),
    //                           ),
    //                         ),
    //                         IconButton(
    //                           onPressed: (() => Themes().changeTheme()),
    //                           icon: const Icon(Icons.lightbulb_outline),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 25,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
