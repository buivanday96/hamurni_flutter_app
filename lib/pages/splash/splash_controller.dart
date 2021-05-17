import 'package:get/get.dart';
import 'package:hamurni_flutter_app/app_pages.dart';

class SplashController extends GetxController {
  var _isLoading = true.obs;
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    gotoStartScreen();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> gotoStartScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Get.toNamed(Routes.START);
  }
}
