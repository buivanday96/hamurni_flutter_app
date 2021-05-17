import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamurni_flutter_app/settings/color_setting.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Center(
        child: Image.asset(
          'assets/logo_text.png',
          scale: 1.5,
        ),
      ),
    );

    Widget loading = Center(
        child: SpinKitCircle(
      color: colorApp,
    ));
    return Scaffold(
      body: Stack(
        children: [
          body,
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.h,
            top: (-50 + Get.height / 2).h,
            child: controller.isLoading ? loading : Opacity(opacity: 0),
          ),
        ],
      ),
    );
  }
}
