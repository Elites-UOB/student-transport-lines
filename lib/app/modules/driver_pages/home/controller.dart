import 'package:get/get.dart';

import '../../../data/services/helper_service.dart';

class DriverHomeController extends GetxController {
  final HelperService helperService = HelperService();
  RxList porfiles = [].obs;
  @override
  void onInit() {
    helperService.getPorfile();
    print(porfiles);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPorfile() async {
    porfiles.value = await helperService.getPorfile();
  }
}
