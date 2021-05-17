import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../settings/color_setting.dart';
import '../../lang/key_lang.dart';
import 'start_controller.dart';
import '../../settings/image_setting.dart';
import '../../widgets/button.dart';

class StartView extends GetView<StartController> {
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
          Positioned(
            top: (114 - 16).h,
            right: (24 - 16).w,
            child: MyButton.iconSvg(
              assetName: 'assets/icon_info.svg',
              iconSize: (24).w,
              onTap: () {},
              tooltip: 'Info',
              isAreaTap: true,
              iconPadding: EdgeInsets.all(16),
            ),
          ),
          Positioned(
            top: 138.h,
            left: 40.w,
            child: _buildLogan(),
          ),
          Positioned(
            top: 35.h,
            left: 40.w,
            child: _buldLogoText(),
          ),
        ],
      ),
    );
  }

  Widget _buildStart() {
    return MyButton.elevated(
      width: 133.w,
      height: 48.w,
      borderRadius: 4.r,
      text: start_btn.tr.toUpperCase(),
      backgroundColor: AppColor.primaryColor,
      elevation: 5,
      textStyle: GoogleFonts.roboto(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      onTap: () {},
    );
  }

  Widget _buildLanguage() {
    changedColor(int id) {
      return controller.langEnable == id ? AppColor.primaryColor : Colors.transparent;
    }

    changedBorderColor(int id) {
      return controller.langEnable == id ? Colors.transparent : AppColor.primaryColor;
    }

    changedTextColor(int id) {
      return controller.langEnable == id ? Colors.white : AppColor.primaryColor;
    }

    return Obx(
      () => Container(
        child: Row(
          children: [
            MyButton.outlined(
              width: 48.w,
              height: 48.w,
              text: 'EN',
              textStyle: GoogleFonts.roboto(
                color: changedTextColor(0),
                fontWeight: FontWeight.normal,
                fontSize: 20.sp,
              ),
              backgroundColor: changedColor(0),
              borderRadius: 4.r,
              borderColor: changedBorderColor(0),
              isDisable: controller.langEnable == 0,
              disableColor: colorApp,
              onTap: () {
                controller.onChangeLange(0);
              },
            ),
            SizedBox(
              width: 8.w,
            ),
            MyButton.outlined(
              width: 48.w,
              height: 48.w,
              text: 'ID',
              textStyle: GoogleFonts.roboto(
                color: changedTextColor(1),
                fontWeight: FontWeight.normal,
                fontSize: 20.sp,
              ),
              backgroundColor: changedColor(1),
              borderRadius: 4.r,
              borderColor: changedBorderColor(1),
              isDisable: controller.langEnable == 1,
              disableColor: colorApp,
              onTap: () {
                controller.onChangeLange(1);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogan() {
    return Text(
      'Hasil Murni\nDan Lestari',
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w700,
        fontSize: 30.sp,
        color: AppColor.primaryColor,
        height: 33 / 30,
        letterSpacing: 0.1.sp,
      ),
    );
  }

  Widget _buldLogoText() {
    return Image.asset(
      'assets/logo_text.png',
      width: 143.w,
      height: 54.h,
    );
  }
}
