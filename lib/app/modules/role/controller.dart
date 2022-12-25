import 'package:get/get.dart';
import 'package:student_transport_lines/app/modules/role/widgets/step1.dart';
import 'package:student_transport_lines/app/modules/role/widgets/step2.dart';

class RoleController extends GetxController {
  RxList steps = [
    const Step1(),
    const Step2(),
    const Step1(),
    const Step2(),
    const Step1(),
  ].obs;

  RxInt currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value < steps.length - 1) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step < steps.length) {
      currentStep.value = step;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
