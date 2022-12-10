import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/auth/controller.dart';
import 'package:student_transport_lines/app/modules/role/page.dart';

class AuthPage extends StatelessWidget {
  AuthController controller = Get.put(AuthController());

  AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RolePage(),
                      ));
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    )),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shape: BoxShape.rectangle,
                    ),
                    child: Form(
                      key: controller.authKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(
                              () => controller.isRegister.value == true
                                  ? TextFormField(
                                      controller: controller.name,
                                      onSaved: (v) {},
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Name ',
                                      ),
                                    )
                                  : Container(),
                            ),
                            TextFormField(
                              controller: controller.email,
                              validator: (v) {
                                return controller.valideateEmail(v!);
                              },
                              onSaved: (v) {},
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                ),
                                hintText: 'Email ',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => TextFormField(
                                controller: controller.password,
                                validator: (v) {
                                  return controller.valideatePassworde(v!);
                                },
                                onSaved: (v) {},
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !controller.showPassword.value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () => controller.showPassword.value =
                                        !controller.showPassword.value,
                                    child: controller.showPassword.value
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.remove_red_eye_outlined),
                                  ),
                                  // hintTextDirection: TextDirection.ltr,
                                  hintText: 'Password ',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black.withOpacity(.4)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              onPressed: () => controller.login(),
                              child: Center(
                                child: Obx(
                                  () => controller.isLoading.value == true
                                      ? const SpinKitRipple(
                                          color: Colors.white,
                                        )
                                      : Container(
                                          height: 50,
                                          width: 200,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "تسجيل الدخول",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () => controller.isRegister.value =
                                  !controller.isRegister.value,
                              child: Obx(
                                () => controller.isRegister.value
                                    ? const Text(
                                        "تسجيل الدخول",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      )
                                    : const Text(
                                        "ليس لديك حساب؟",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
