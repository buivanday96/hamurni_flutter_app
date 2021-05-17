import 'package:get/get.dart';
import 'package:hamurni_flutter_app/pages/login/login_binding.dart';
import 'package:hamurni_flutter_app/pages/start/start_binding.dart';
import 'package:hamurni_flutter_app/pages/start/start_view.dart';
import 'package:hamurni_flutter_app/pages/term/term_binding.dart';

import 'pages/login/login_view.dart';
import 'pages/splash/splash_binding.dart';
import 'pages/splash/splash_view.dart';
import 'pages/term/term_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.size,
      transitionDuration: Duration(seconds: 2),
    ),
    GetPage(
      name: Routes.START,
      page: () => StartView(),
      binding: StartBinding(),
      transition: Transition.size,
      transitionDuration: Duration(seconds: 2),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.size,
      transitionDuration: Duration(seconds: 2),
    ),
    GetPage(
      name: Routes.TERM,
      page: () => TermView(),
      binding: TermBinding(),
      transition: Transition.size,
      transitionDuration: Duration(seconds: 2),
    ),
  ];
}
