import 'package:get/get.dart';
import 'package:student_transport_lines/app/data/services/line_service.dart';

class StudentHomeController extends GetxController {
  final LineService linService = LineService();
  RxList lines = [].obs;
  RxBool isLoading = false.obs;
  RxBool isExpanded = true.obs;

  @override
  void onInit() async {
    await facth();
    print('+++===================');
    print(lines.value);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  facth() async {
    try {
      isLoading.value = true;
      final data = await linService.getLines();
      if (data != null) {
        lines.assignAll(data);
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ ما');
    } finally {
      isLoading.value = false;
    }
  }
}
