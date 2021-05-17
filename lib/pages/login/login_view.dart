import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamurni_flutter_app/lang/key_lang.dart';
import 'package:hamurni_flutter_app/pages/login/login_controller.dart';
import 'package:hamurni_flutter_app/settings/color_setting.dart';
import 'package:hamurni_flutter_app/widgets/button.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Widget txtVersion = Text(
      'Version: 0.0.1-rc 1',
      style: GoogleFonts.roboto(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: Colors.white,
      ),
    );

    Widget image = Container(
      color: Colors.green,
      width: Get.width,
      height: Get.height,
      child: Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Image.asset(
              'assets/login_background.png',
              width: Get.width,
              height: 251.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 17.h,
              left: 16.w,
              child: txtVersion,
            ),
          ],
        ),
      ),
    );

    Widget countryCode = Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 74.w,
              child: TextFormField(
                initialValue: '+84',
                style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  color: AppColor.accentColor,
                ),
                enabled: false,
                showCursor: false,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            Positioned(
              right: -10.w,
              top: -13.h,
              child: Icon(
                Icons.arrow_drop_down_rounded,
                size: 48.w,
                color: Color(0xffd9d9e2),
              ),
            )
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        Container(
          width: 181.w,
          child: TextFormField(
            initialValue: '123456789',
            style: GoogleFonts.roboto(
              fontSize: 20.sp,
              color: AppColor.accentColor,
            ),
            enabled: true,
            showCursor: true,
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );

    Widget underline = Row(
      children: [
        Container(
          width: 74.w,
          height: 1.h,
          color: AppColor.primaryColor,
        ),
        SizedBox(
          width: 16.w,
        ),
        Container(
          width: 181.w,
          height: 1.h,
          color: AppColor.primaryColor,
        ),
      ],
    );

    Widget btnLogin = MyButton.elevated(
      text: login.toUpperCase().tr,
      width: 271.w,
      height: 59.h,
      backgroundColor: AppColor.primaryColor,
      elevation: 5,
      textStyle: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 20.sp,
      ),
      onTap: controller.gotoTerm,
    );

    Widget btmPart = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/ic_logo.png',
          width: 30.w,
          height: 40.h,
        ),
        Center(
          child: Text.rich(
            TextSpan(
              style: GoogleFonts.roboto(
                color: Color(0x89000000),
                fontSize: 14.sp,
                textStyle: TextStyle(),
              ),
              children: [
                TextSpan(
                  text: by_logging_in_you_are_agreeing_to_our.tr,
                ),
                TextSpan(text: '\n'),
                TextSpan(
                    text: term_conditions_and_privacy_policy.tr,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    Widget main = Container(
      height: 498.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 44.w, right: 45.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 56.h,
            ),
            Text(
              enter_phone_number.tr,
              style: GoogleFonts.roboto(
                fontSize: 18.sp,
                color: AppColor.hintColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            countryCode,
            SizedBox(
              height: 2.h,
            ),
            underline,
            SizedBox(
              height: 32.5.h,
            ),
            btnLogin,
            Spacer(),
            btmPart,
            SizedBox(
              height: 48.h,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          image,
          Positioned(
            top: 242.h,
            left: 0,
            right: 0,
            child: main,
          ),
        ],
      ),
    );
  }
}
