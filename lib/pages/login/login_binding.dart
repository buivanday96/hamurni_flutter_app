import 'package:get/get.dart';
import 'package:hamurni_flutter_app/pages/login/login_controller.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}