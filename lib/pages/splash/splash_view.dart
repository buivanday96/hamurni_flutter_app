import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamurni_flutter_app/lang/key_lang.dart';
import 'package:hamurni_flutter_app/settings/color_setting.dart';
import 'package:hamurni_flutter_app/settings/font_setting.dart';
import 'package:hamurni_flutter_app/widgets/button.dart';
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
<<<<<<< HEAD
=======
          Positioned(
            top: 114.h,
            right: 24.w,
            child: IconButton(
              icon: Icon(
                Icons.info_outline_rounded,
                size: 24.w,
              ),
              color: colorButtonInfo,
              //padding: EdgeInsets.all(0),
              //constraints: BoxConstraints(),
              onPressed: () {
                printInfo(info: 'tap');
              },
            ),
          ),
>>>>>>> d36650b... commit setup
        ],
      ),
    );
  }

  Widget _buildStart() {
<<<<<<< HEAD
    return GreenButton(
      onTap: () {
        print('tap');
      },
      text: start_btn.tr.toUpperCase(),
=======
    return MyButton.elevated(
      width: 143.w,
      height: 48.h,
      borderRadius: 4.r,
      text: start_btn.tr.toUpperCase(),
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      onTap: () {},
>>>>>>> d36650b... commit setup
    );
  }

  Widget _buildLanguage() {
    return Container(
      child: Row(
        children: [
<<<<<<< HEAD
          GreenButton(
            width: ,
          ),
        ],  
=======
          MyButton.outlined(
            width: 48.w,
            height: 48.h,
            text: 'EN',
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: fontRoboto,
              fontWeight: FontWeight.normal,
              fontSize: 20.sp,
            ),
            // backgroundColor: colorApp,
            onTap: () {},
          ),
          SizedBox(
            width: 8.w,
          ),
          MyButton.outlined(
            width: 48.w,
            height: 48.h,
            text: 'ID',
            textStyle: TextStyle(
              color: colorApp,
              fontFamily: fontRoboto,
              fontSize: 20.sp,
            ),
            backgroundColor: Colors.transparent,
            borderColor: colorApp,
            onTap: () {},
          ),
        ],
>>>>>>> d36650b... commit setup
      ),
    );
  }
}
