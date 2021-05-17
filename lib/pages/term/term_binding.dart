import 'package:get/get.dart';
import 'package:hamurni_flutter_app/pages/term/term_controller.dart';

class TermBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermController>(() => TermController());
  }
}
