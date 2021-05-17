import 'package:get/get.dart';
import 'package:hamurni_flutter_app/app_pages.dart';

class LoginController extends GetxController {
  var _countryCode = '84'.obs;
  set countryCode(value) => _countryCode.value = value;
  String get countryCode => _countryCode.value;

  var _phoneNumber = '769860236'.obs;
  set phoneNumber(value) => _phoneNumber.value = value;
  String get phoneNumber => _phoneNumber.value;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void gotoTerm() {
    Get.toNamed(Routes.TERM);
  }
}
