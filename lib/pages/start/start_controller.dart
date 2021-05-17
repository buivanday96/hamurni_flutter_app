import 'package:get/get.dart';

import '../../app_pages.dart';

class StartController extends GetxController {
  var _langEnable = 0.obs;
  int get langEnable => _langEnable.value;
  set langEnable(value) => _langEnable.value = value;

  @override
  void onInit() {
    super.onInit();
    gotoLogin();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeLange(int current) {
    langEnable = current;
    print('$langEnable');
    update();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Get.toNamed(Routes.LOGIN);
  }
}
