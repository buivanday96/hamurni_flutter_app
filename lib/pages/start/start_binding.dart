import 'package:get/get.dart';
import 'package:hamurni_flutter_app/pages/start/start_controller.dart';

class StartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartController>(() => StartController());
  }
}
