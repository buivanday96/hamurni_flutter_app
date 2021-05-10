import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamurni_flutter_app/lang/key_lang.dart';
import 'package:hamurni_flutter_app/widgets/green_button.dart';
import '../../settings/image_setting.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(splash_background),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 56.h,
            right: 48.w,
            child: _buildStart(),
          ),
          Positioned(
            top: 42.h,
            right: 24.w,
            child: _buildLanguage(),
          ),
        ],
      ),
    );
  }

  Widget _buildStart() {
    return GreenButton(
      onTap: () {
        print('tap');
      },
      text: start_btn.tr.toUpperCase(),
    );
  }

  Widget _buildLanguage() {
    return Container(
      child: Row(
        children: [
          GreenButton(
            width: ,
          ),
        ],  
      ),
    );
  }
}
